import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/photo_details_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/not_found_screen.dart';

void main() => runApp(const MeetTheTeamApp());

class MeetTheTeamApp extends StatelessWidget {
  const MeetTheTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meet Latefenders',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light, // one shared ThemeData for every screen
      initialRoute: AppRoutes.home,

      // All named routes are registered in this single place.
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.about: (_) => const AboutScreen(),
        AppRoutes.gallery: (_) => const GalleryScreen(),
        AppRoutes.photo: (_) => const PhotoDetailsScreen(),
        AppRoutes.contact: (_) => const ContactScreen(),
      },

      // Fallback screen for any route name that is not registered above.
      onUnknownRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (_) => NotFoundScreen(routeName: settings.name),
      ),
    );
  } //test
}
