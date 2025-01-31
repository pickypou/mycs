import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mycs/core/di/di.dart';
import 'package:mycs/data/repository/evenement_repository_impl.dart';
import 'package:mycs/domain/usecase/fetch_evenement_data_usecase.dart';

import '../../../theme.dart';
import '../remove_evenement_interactor.dart';

class RemoveEvenementLis extends StatelessWidget {
  final auth = GetIt.instance<FirebaseAuth>();

  RemoveEvenementLis({super.key});

  @override
  Widget build(BuildContext context) {
    final interactor = EvenementListInteractor(getIt<FetchEvenementDataUseCase>(), getIt<EvenementsRepositoryImpl>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onSurface,
        title:  Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              auth.signOut().then((_) {
                debugPrint('Déconnexion réussie');
                context.go('/');
              });
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('evenement').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Aucun événement trouvé.'));
          }

          final evenements = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Je supprime un événement', style: titleStyleMedium(context),),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: evenements.map((doc) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        elevation: 0,
                        color: theme.colorScheme.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: theme.colorScheme.surface, // Couleur de la bordure
                            width: 2.0, // Épaisseur de la bordure
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  doc['thumbnailUrl'] ?? doc['fileUrl'],
                                  height: 80.0,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                doc['title'],
                                style: textStyleText(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8.0),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () async {
                                  final confirm = await _confirmDelete(context);
                                  if (confirm) {
                                    try {
                                      await interactor.removeEvenement(doc.id);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Événement supprimé avec succès')),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Erreur : $e')),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )

          );
        },
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.colorScheme.onError, // ✅ Uniformise avec les cartes
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: theme.colorScheme.onSurface, // ✅ Ajoute une bordure cohérente
              width: 2.0,
            ),
          ),
          title: Text('Confirmer la suppression', style: titleStyleMedium(context)),
          content: const Text('Voulez-vous vraiment supprimer cet événement ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error, // ✅ Bouton rouge pour la suppression
                foregroundColor: theme.colorScheme.onError, // ✅ Texte contrasté
              ),
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    ) ?? false;
  }

}