import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}
