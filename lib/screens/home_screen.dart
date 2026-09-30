import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Back-button handling: ask before closing the app.
  Future<void> _confirmExit(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Exit app?'),
        content: const Text('Do you want to Beat me?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Stay')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Exit')),
        ],
      ),
    );
    if (shouldExit == true) SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmExit(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: const AppDrawer(currentRoute: AppRoutes.home),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      const Color(0xFF3F7BD9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.groups, size: 64, color: Colors.white),
                    const SizedBox(height: 12),
                    Text('Meet MarkJames Today',
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(height: 8),
                    const Text(
                      'A mobile development team from the College of Computing '
                      'Studies, University of Cabuyao. Discover who we are, see '
                      'and lets get gambling together.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const _NavCard(
                icon: Icons.people,
                title: 'About Us',
                subtitle: 'Get to know the group and each member',
                route: AppRoutes.about,
              ),
              const _NavCard(
                icon: Icons.photo_library,
                title: 'Gallery',
                subtitle: 'Photos contributed by every member',
                route: AppRoutes.gallery,
              ),
              const _NavCard(
                icon: Icons.contact_mail,
                title: 'Contact Us',
                subtitle: 'Send us a message',
                route: AppRoutes.contact,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// Link card that opens another page using a named route.
class _NavCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;

  const _NavCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading:
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
