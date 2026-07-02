import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(label),
      backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
      side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
