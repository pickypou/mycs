import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/access_checker.dart';
import '../../common/widgets/custom_buttom.dart';
import '../../theme.dart';

class AccountView extends StatefulWidget {
  final Map<String, dynamic> userData;

  const AccountView({super.key, required this.userData});

  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  bool isAdmin = false; // Par défaut, l'utilisateur n'est pas administrateur
  bool isLoading = true; // Indique si la vérification est en cours

  @override
  void initState() {
    super.initState();
    _checkAdminAccess();
  }

  Future<void> _checkAdminAccess() async {
    final hasAdminAccess = await hasAccess(); // Appelle la fonction asynchrone
    setState(() {
      isAdmin = hasAdminAccess;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = GetIt.instance<FirebaseAuth>();

    if (isLoading) {
      // Affiche un indicateur de chargement pendant la vérification
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mon Compte'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onSurface,
        title:  Text('Mon Compte',style: textStyleTextAppBar(context),),
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
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Ajout de marges latérales
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Étire les enfants sur toute la largeur
            children: [
              const SizedBox(height: 20),
              Text(
                "Bonjour ${widget.userData['userName']}",
                style: titleStyleLarge(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SizedBox(height: 90),
              if (isAdmin) ...[
                CustomButton(
                  label: 'Je crée un événement',
                  onPressed: () {
                    GoRouter.of(context).go('/add_evenement');
                  },
                ),
                const SizedBox(height: 50),

                CustomButton(
                  label: 'Je supprime un événement',
                  onPressed: () {
                    GoRouter.of(context).go('/evenementList');
                  },
                ),

              ],
            ],
          ),
        ),
      ),
    );
  }
}