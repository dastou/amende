import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/amende_screen.dart';
import 'screens/paiement_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Fixer l'orientation en mode portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Dimensions de base du design
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gestion des Amendes',

          // Configuration du thème
          theme: ThemeData(
            primaryColor: const Color(0XFF0A345A),
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),

          // Support de la localisation
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // Langues prises en charge
          supportedLocales: const [
            Locale('fr'), // Français
            Locale('en'), // Anglais
          ],

          // Langue par défaut
          locale: const Locale('fr'),

          // Route initiale
          home: const AmendeScreen(),

          // Routes de l'application
          routes: {
            '/amende': (context) => const AmendeScreen(),
            '/paiement': (context) => const PaiementScreen(montant: 0),
          },
        );
      },
    );
  }
}