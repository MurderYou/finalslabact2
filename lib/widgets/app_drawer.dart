import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

/// Navigation drawer shared by all main pages.
class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void _go(BuildContext context, String route) {
    Navigator.pop(context); // close the drawer
    if (route == currentRoute) return;

    if (route == AppRoutes.home) {
      // Going home clears the stack so Back never returns to old pages.
      Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
    } else if (currentRoute == AppRoutes.home) {
      Navigator.pushNamed(context, route); // Home stays underneath
    } else {
      // Switching between side pages replaces the current page.
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String, String)>[
      (Icons.home, 'Home', AppRoutes.home),
      (Icons.people, 'About Us', AppRoutes.about),
      (Icons.photo_library, 'Gallery', AppRoutes.gallery),
      (Icons.contact_mail, 'Contact Us', AppRoutes.contact),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1F4E9C)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Meet Latefenders',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          for (final item in items)
            ListTile(
              leading: Icon(item.$1),
              title: Text(item.$2),
              selected: item.$3 == currentRoute,
              onTap: () => _go(context, item.$3),
            ),
        ],
      ),
    );
  }
}
