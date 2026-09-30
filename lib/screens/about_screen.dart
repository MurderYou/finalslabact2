import 'package:flutter/material.dart';

import '../data/team_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/member_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      drawer: const AppDrawer(currentRoute: AppRoutes.about),
      // ListView holds the group description followed by the member list.
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Who We Are', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 8),
                const Text(
                  'We are a group of multiraces suportting any identity even if you are not a human. we love you maam sai',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Stat(value: '${teamMembers.length}', label: 'Members'),
                    _Stat(value: '${galleryPhotos.length}', label: 'Photos'),
                    const _Stat(value: '4', label: 'Screens'),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Our Members', style: theme.textTheme.titleLarge),
              ],
            ),
          ),
          for (final member in teamMembers) MemberCard(member: member),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary)),
        Text(label),
      ],
    );
  }
}
