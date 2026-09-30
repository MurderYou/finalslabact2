import 'package:flutter/material.dart';
import '../models/member.dart';

/// Reusable card that displays one group member.
class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: theme.colorScheme.primary,
              child: Text(
                member.initials,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.listName, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(member.role,
                      style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Text(member.bio, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, size: 16),
                      const SizedBox(width: 6),
                      Flexible(child: Text(member.email)),
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
