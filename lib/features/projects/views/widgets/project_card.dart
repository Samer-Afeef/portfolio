import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/skill_chip.dart';
import '../../domain/project_model.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _launchUrl(String? url) async {
    if (url != null && url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: _isHovered ? 20 : 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon / Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.folder_open,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
                Row(
                  children: [
                    if (widget.project.appStoreUrl != null)
                      IconButton(
                        icon: const Icon(Icons.apple),
                        tooltip: 'Download on App Store',
                        onPressed: () => _launchUrl(widget.project.appStoreUrl),
                        color: theme.colorScheme.onSurface,
                      ),
                    if (widget.project.googlePlayUrl != null)
                      IconButton(
                        icon: const Icon(Icons.android),
                        tooltip: 'Get it on Google Play',
                        onPressed: () => _launchUrl(widget.project.googlePlayUrl),
                        color: theme.colorScheme.onSurface,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Title
            Text(
              widget.project.title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: _isHovered ? theme.colorScheme.primary : null,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              widget.project.description,
              style: theme.textTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Technologies
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.technologies
                  .map((tech) => SkillChip(label: tech))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
