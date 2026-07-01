import 'package:flutter/material.dart';
import '../../../../components/section_header.dart';
import '../../../../core/utils/responsive_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Experience & Metrics'),
        const SizedBox(height: 32),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: const _MetricCard(
                title: '4+ Years',
                subtitle: 'Cross-Platform Experience',
                icon: Icons.timeline,
              ),
            ),
            if (isMobile) const SizedBox(height: 16) else const SizedBox(width: 24),
            Expanded(
              flex: isMobile ? 0 : 1,
              child: const _MetricCard(
                title: '99.8%',
                subtitle: 'Crash-Free Sessions',
                icon: Icons.verified_user,
              ),
            ),
            if (isMobile) const SizedBox(height: 16) else const SizedBox(width: 24),
            Expanded(
              flex: isMobile ? 0 : 1,
              child: const _MetricCard(
                title: '40%',
                subtitle: 'Latency Reduction',
                icon: Icons.speed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
