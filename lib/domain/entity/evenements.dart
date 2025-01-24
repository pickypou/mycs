import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/utils/date_converter.dart';

class Evenement {
  final String id;
  final String title;
   String? fileUrl;
  String? fileType;
   String? thumbnailUrl;
  final DateTime publishDate;

  Evenement({
    required this.id,
    required this.title,
    required this.fileUrl,
    required this.fileType,
    this.thumbnailUrl,
    required this.publishDate,
  });

  // Retourne l'image de la vignette ou une image par défaut
  ImageProvider<Object> getThumbnailImage() {
    if (thumbnailUrl != null && thumbnailUrl!.isNotEmpty) {
      return NetworkImage(thumbnailUrl!);
    } else {
      // Utiliser une image par défaut si la vignette n'existe pas
      return const AssetImage('assets/images/logo_cocon.png');
    }
  }

  // Formatte la date au format (DD/MM/YYYY)
  String get formattedPublishDate {
    return DateFormat('dd/MM/yyyy').format(publishDate);
  }

  // Factory pour créer un Evenement à partir d'une Map
  factory Evenement.fromMap(Map<String, dynamic>? data, String id) {
    return Evenement(
      id: id,
      title: data?['title'] ?? 'Titre inconnu',
      fileType: data?['fileType'] ?? 'Type inconnu',
      fileUrl: data?['fileUrl'] ?? '',
      thumbnailUrl: data?['thumbnailUrl'],
      publishDate: DateConverter.convertToDateTime(data?['publishDate']),
    );
  }

  @override
  String toString() {
    return 'Evenement(id: $id, title: $title, fileType: $fileType, fileUrl: $fileUrl, thumbnailUrl: $thumbnailUrl, publishDate: $formattedPublishDate)';
  }
}
