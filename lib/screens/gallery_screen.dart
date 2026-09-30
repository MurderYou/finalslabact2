import 'package:flutter/material.dart';

import '../data/team_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_image.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      drawer: const AppDrawer(currentRoute: AppRoutes.gallery),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: galleryPhotos.length,
        itemBuilder: (context, index) {
          final photo = galleryPhotos[index];

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            // Named route + route argument: the tapped Photo is passed along.
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.photo,
              arguments: photo,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(tag: photo.path, child: AppImage(path: photo.path)),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        photo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
