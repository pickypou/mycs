
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mycs/core/router/router_config.dart';
import 'package:mycs/ui/theme.dart';
import 'core/di/di.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';



Future<String> getDirectoryPath() async {
  if (kIsWeb) {
    // Gérer les chemins de manière différente pour le web
    return '/path/to/web/directory'; // Définir un chemin approprié
  } else {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions.currentPlatform, // Utilisez les options générées
  );

  configureDependencies();

  runApp(const MyApp());


}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouterConfig = getIt<AppRouterConfig>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MYCS',
      theme: theme,
      routerConfig: appRouterConfig.router,
    );
  }
}


