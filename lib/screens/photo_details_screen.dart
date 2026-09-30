import 'package:flutter/material.dart';

import '../models/member.dart';
import '../routes/app_routes.dart';
import '../widgets/app_image.dart';
import 'not_found_screen.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Read the Photo that was passed through Navigator.pushNamed(arguments:).
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! Photo) {
      return const NotFoundScreen(routeName: 'Photo data is missing');
    }
    final Photo photo = args;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: photo.path,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: AppImage(path: photo.path),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(photo.title, style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18),
                      const SizedBox(width: 6),
                      Text('Contributed by ${photo.contributor.fullName}',
                          style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(photo.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.contact),
                          icon: const Icon(Icons.mail),
                          label: const Text('Contact'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
