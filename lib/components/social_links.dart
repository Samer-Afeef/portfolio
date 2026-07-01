import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/home/controllers/theme_provider.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  static const List<String> _socialIcons = [
    'assets/icons/facebook.png',
    'assets/icons/instagram.png',
    'assets/icons/linkedin.png',
    'assets/icons/github.png',
  ];

  static const List<String> _socialLinks = [
    "https://facebook.com/samer.alafeef.1",
    "https://instagram.com/samer_afeef",
    "https://linkedin.com/in/samer-afeef-972536296?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
    "https://github.com/Samer-Afeef",
  ];

  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;
    final theme = Theme.of(context);

    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.start,
      children: _socialIcons.asMap().entries.map((entry) {
        final index = entry.key;
        final iconPath = entry.value;
        final url = _socialLinks[index];

        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _openUrl(url),
            hoverColor: theme.colorScheme.primary.withValues(alpha: 0.2),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Image.asset(
                iconPath,
                color: isDark ? Colors.white : Colors.black87,
                height: 20,
                width: 20,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
