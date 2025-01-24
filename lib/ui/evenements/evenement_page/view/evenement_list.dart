import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/theme.dart';
import '../../../../domain/entity/evenements.dart';
import '../evenement_interactor.dart';
import '../event_handler.dart';

class EvenementListView extends StatefulWidget {
  const EvenementListView({super.key});

  @override
  EvenementListViewState createState() => EvenementListViewState();
}

class EvenementListViewState extends State<EvenementListView> {
  final EvenementInteractor _evenementInteractor = EvenementInteractor();

  List<Evenement> _evenements = [];
  bool _isLoading = true;
  String? _errorMessage;
  final EventHandler eventHandler = EventHandler();

  @override
  void initState() {
    super.initState();
    _loadEvenements();
  }

  Future<void> _loadEvenements() async {
    try {
      List<Evenement> evenements = await _evenementInteractor.fetchEvenements();
      setState(() {
        _evenements = evenements;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Erreur lors de la récupération des événements';
      });
    }
  }

  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: textStyleText(context)),
            ElevatedButton(
              onPressed: _loadEvenements,
              child: const Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    if (_evenements.isEmpty) {
      return  Center(child: Text("Aucun événement disponible", style: textStyleText(context),));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth / 4.5).clamp(200.0, 400.0);
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Nos, Evénements",style: titleStyleMedium(context),
                ),
              ),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _evenements.map((evt) {
                  return SizedBox(
                    width: cardWidth,
                    child: Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () => eventHandler.handleDocumentTap(
                          context,
                          evt.fileUrl!,
                          evt.title,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Si une vignette est présente (thumbnailUrl), on l'affiche
                            evt.thumbnailUrl != null
                                ? Image.network(
                              evt.thumbnailUrl!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                            // Sinon, si c'est une image principale (fileUrl), on l'affiche
                            // Si la vignette est nulle, vérifier si l'événement est une image
                                : (evt.fileType == 'image' &&
                                evt.fileUrl != null)
                                ? Image.network(
                              evt.fileUrl!, // Affiche l'image téléchargée si c'est une image
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    evt.title.isNotEmpty
                                        ? evt.title
                                        : "Sans titre",
                                    style: textStyleText(context),
                                  ),
                                  const SizedBox(height: 4),

                                ],
                              ),
                            ),
                            const SizedBox(height: 55,),

                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}