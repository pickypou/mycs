import '../../domain/entity/evenements.dart';
import 'evenement_dto.dart';

extension EvenementDtoMapper on EvenementDto {
  Evenement toEntity() {
    return Evenement(
      id: id,
      title: title,
      fileUrl: fileUrl ?? '',  // Évite un crash en cas de valeur null
      fileType: fileType ?? '',
      thumbnailUrl: thumbnailUrl,
      publishDate: publishDate ?? DateTime(1970, 1, 1),  // Évite une erreur sur une date nulle
    );
  }
}

extension EvenementsMapper on Evenement {
  EvenementDto toDto() {
    return EvenementDto(
      id: id,
      title: title,
      fileUrl: fileUrl ?? '',
      fileType: fileType ?? '',
      fileName: title ?? 'fichier_sans_nom',  // Ajouter une valeur par défaut raisonnable
      thumbnailUrl: thumbnailUrl,
      publishDate: publishDate,
    );
  }
}
