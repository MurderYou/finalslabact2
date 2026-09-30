import 'package:flutter/material.dart';

/// Loads an asset image and shows a placeholder icon if the file is missing,
/// so the app never crashes while photos are still being added.
class AppImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const AppImage({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.grey.shade300,
        child: const Center(
          child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}
