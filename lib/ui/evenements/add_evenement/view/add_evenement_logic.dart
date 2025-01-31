import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:mycs/ui/theme.dart';

import '../../../../core/di/di.dart';
import '../../../../domain/entity/evenements.dart';
import '../add_evenements_interactor.dart';

class AddEvenementLogic with ChangeNotifier {
  final titleController = TextEditingController();
  Uint8List? _selectedFileBytes;
  String? _fileName;
  String? _fileType;

  Uint8List? get selectedFileBytes => _selectedFileBytes;
  String? get fileName => _fileName;
  String? get fileType => _fileType;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result;
      if (kIsWeb) {
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
          withData: true,
        );
      } else {
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
        );
      }

      if (result != null && result.files.isNotEmpty) {
        _selectedFileBytes = result.files.first.bytes;
        _fileName = result.files.first.name;
        String extension = result.files.first.extension?.toLowerCase() ?? '';
        _fileType = _getFileType(extension);
        notifyListeners(); // Notifie les écouteurs que l'état a changé
      } else {
        debugPrint("Aucun fichier sélectionné.");
      }
    } catch (e) {
      debugPrint("Erreur lors de la sélection du fichier : $e");
    }
  }

  String _getFileType(String extension) {
    if (extension == 'pdf') return 'pdf';
    if (['png', 'jpg', 'jpeg'].contains(extension)) return 'image';
    throw Exception('Type de fichier non supporté');
  }

  Widget buildFilePreview(BuildContext context) {
    return Column(
      children: [
        Text('Fichier sélectionné : $_fileName'),
        const SizedBox(height: 10),
        if (_fileType == 'pdf')
          GestureDetector(
            onTap: () {
              final blob = html.Blob([_selectedFileBytes!]);
              final url = html.Url.createObjectUrlFromBlob(blob);
              html.window.open(url, '_blank'); // Ouvrir dans un nouvel onglet
            },
            child: Container(
              height: 150,
              width: 150,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Aperçu PDF indisponible. Cliquez pour ouvrir.'),
              ),
            ),
          )
        else if (_fileType == 'image')
          GestureDetector(
            onTap: () {
              final blob = html.Blob([_selectedFileBytes!]);
              final url = html.Url.createObjectUrlFromBlob(blob);
              html.window.open(url, '_blank'); // Ouvrir dans un nouvel onglet
            },
            child: kIsWeb
                ? Builder(
              builder: (BuildContext context) {
                final blob = html.Blob([_selectedFileBytes!]);
                final url = html.Url.createObjectUrlFromBlob(blob);
                return Image.network(
                  url,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                );
              },
            )
                : Image.memory(
              _selectedFileBytes!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }

  bool isValidInput() {
    return _selectedFileBytes != null && titleController.text.isNotEmpty;
  }

  Future<void> addEvent(BuildContext context) async {
    final interactor = getIt<EvenementsInteractor>();

    if (isValidInput() && _selectedFileBytes != null) {
      try {
        final uploadResult = await interactor.uploadFileWithThumbnail(
          _selectedFileBytes!,
          _fileName!,
          _fileType!,
          DateTime.now().millisecondsSinceEpoch.toString(),
        );

        final evenement = Evenement(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: titleController.text,
          fileUrl: uploadResult['fileUrl']!,
          thumbnailUrl: uploadResult['thumbnailUrl']!,
          fileType: _fileType!,
          publishDate: DateTime.now(),
        );


        await interactor.addEvenement(evenement);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Événement ajouté avec succès')),
        );

        GoRouter.of(context).go('/account'); // Utilisation de GoRouter pour la navigation
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : $e', style: textStyleText(context),)),
        );
      }
    }
  }
}