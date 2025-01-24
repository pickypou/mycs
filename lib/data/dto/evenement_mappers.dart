import '../../domain/entity/evenements.dart';
import 'evenement_dto.dart';

extension EvenementDtoMapper on EvenementDto {
  Evenement toEntity() {
    return Evenement(
      id: id,
      title: title ?? 'Titre inconnu',  // Valeur par défaut si 'title' est null
      fileUrl: fileUrl ?? 'URL inconnue',  // Valeur par défaut si 'fileUrl' est null
      fileType: fileType ?? 'Type inconnu',  // Valeur par défaut si 'fileType' est null
      thumbnailUrl: thumbnailUrl,  // Peut être null, pas besoin de modification si vous le gérez comme optionnel
      publishDate: publishDate,  // Pas de modification nécessaire pour publishDate
    );
  }
}

extension EvenementsMapper on Evenement {
  EvenementDto toDto() {
    return EvenementDto(
      id: id,
      title: title,  // title est de type String, donc il est sûr de l'assigner directement
      fileUrl: fileUrl ?? '',  // Fournir une valeur par défaut si fileUrl est null
      fileType: fileType ?? '',  // Fournir une valeur par défaut si fileType est null
      fileName: title,  // title peut être utilisé pour fileName aussi
      thumbnailUrl: thumbnailUrl,  // Peut être null, pas besoin de modification si vous le gérez comme optionnel
      publishDate: publishDate,  // Pas de modification nécessaire pour publishDate
    );
  }
}
