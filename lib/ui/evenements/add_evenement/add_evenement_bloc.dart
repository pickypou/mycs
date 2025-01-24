import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entity/evenements.dart';
import '../../../domain/usecase/generate_and_upload_thumbnail_use_case.dart';
import 'add_evenement_event.dart';
import 'add_evenement_state.dart';

class AddEvenementsBloc extends Bloc<AddEvenementEvent, AddEvenementsState> {
  final  _firebaseStorage = GetIt.instance<FirebaseStorage>();
  final generateThumbnailUseCase = GetIt.instance<GenerateThumbnailUseCase>();

  AddEvenementsBloc() : super(AddEvenementsSignUpInitialState()) {
    on<AddEvenementEvent>((event, emit) async {
      if (event is EvenementSignUpEvent) {
        await _handleAddEvenementSignUpEvent(event, emit);
      }
    });
  }

  Future<void> _handleAddEvenementSignUpEvent(
      EvenementSignUpEvent event, Emitter<AddEvenementsState> emit) async {
    emit(AddEvenementsSignUpLoadingState());

    try {
      Uint8List? thumbnail;

      // Génération de la vignette uniquement si le fichier est un PDF
      if (event.fileType == 'pdf') {
        thumbnail =
        await generateThumbnailUseCase.generateThumbnail(event.file.path as Uint8List);
      }

      String evenementId =
          FirebaseFirestore.instance.collection('evenement').doc().id;

      // Upload du fichier principal
      String fileUrl =
      await _uploadFile(event.file, evenementId, event.fileType);

      // Upload de la vignette si elle a été générée
      String? thumbnailUrl;
      if (thumbnail != null) {
        thumbnailUrl = await _uploadThumbnail(thumbnail, evenementId);
      }

      // Création de l'entité événement
      final evenement = Evenement(
        id: evenementId,
        title: event.title,
        fileType: event.fileType,
        fileUrl: fileUrl,
        publishDate: event.publishDate,
        thumbnailUrl: thumbnailUrl, // Null pour les images
      );

      // Ajout des données dans Firestore
      await FirebaseFirestore.instance
          .collection('evenement')
          .doc(evenementId)
          .set({
        'fileType': evenement.fileType,
        'fileUrl': evenement.fileUrl,
        'thumbnailUrl': evenement.thumbnailUrl,
        'title': evenement.title,
        'publishDate': evenement.publishDate,
      });

      emit(AddEvenementsSignUpSuccessState(evenementId: evenementId));
    } catch (error) {
      debugPrint("Erreur lors de l'ajout de l'événement : $error");
      emit(AddEvenementsSignUpErrorState(error: error.toString()));
    }
  }

  Future<String> _uploadFile(File file, String evenementId, String fileType) async {
    String extension;

    if (fileType == 'pdf') {
      extension = 'pdf';
    } else if (fileType == 'image') {
      // Déterminer l'extension réelle du fichier image
      extension = file.path.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png'].contains(extension)) {
        extension = 'jpg';
      }
    } else {
      throw Exception('Type de fichier non supporté: $fileType');
    }

    debugPrint('Extension utilisée : $extension');

    final fileRef = _firebaseStorage.ref().child('evenement/$evenementId/file.$extension');

    await fileRef.putFile(file);

    return await fileRef.getDownloadURL();
  }

  Future<String> _uploadThumbnail(
      Uint8List thumbnail, String evenementId) async {
    Reference thumbnailRef =
    _firebaseStorage.ref().child('evenement/$evenementId/thumbnail.jpg');
    await thumbnailRef.putData(thumbnail);
    return await thumbnailRef.getDownloadURL();
  }
}