import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../common/widgets/custom_buttom.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../theme.dart';
import 'add_evenement_logic.dart';

class AddEvenementView extends StatefulWidget {
  const AddEvenementView({super.key});

  @override
  AddEvenementViewState createState() => AddEvenementViewState();
}

class AddEvenementViewState extends State<AddEvenementView> {
  final AddEvenementLogic logic = AddEvenementLogic();

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = GetIt.instance<FirebaseAuth>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 85,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Je crée un événement',
                  style: titleStyleMedium(context),
                ),
              ),
              const SizedBox(height: 55),
              CustomTextField(
                controller: logic.titleController,
                labelText: 'Titre de l\'événement',
                maxLines: 1,
              ),
              const SizedBox(height: 35),
              CustomButton(
                onPressed: logic.pickFile,
                label: 'Choisir un fichier',
              ),
              const SizedBox(height: 20),
              ListenableBuilder(
                listenable: logic,
                builder: (context, _) {
                  if (logic.selectedFileBytes != null) {
                    return logic.buildFilePreview(context);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 35),
              ListenableBuilder(
                listenable: logic,
                builder: (context, _) {
                  return CustomButton(
                    onPressed: logic.isValidInput() ? () => logic.addEvent(context) : null,
                    label: 'Ajouter l\'événement',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}