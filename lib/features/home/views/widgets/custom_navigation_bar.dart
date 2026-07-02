import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../controllers/navigation_provider.dart';
import '../../controllers/theme_provider.dart';


class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  Widget _buildSignature(ThemeData theme) {
    return Text(
      'Samer.',
      style: theme.textTheme.headlineMedium?.copyWith(
        color: theme.colorScheme.primary,
        fontFamily: 'Agustina', // Use stylized font
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);
    final navProvider = context.read<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    final themeToggleBtn = IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: child.key == const ValueKey('icon1') ? Tween<double>(begin: 1, end: 0.75).animate(anim) : Tween<double>(begin: 0.75, end: 1).animate(anim),
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: themeProvider.isDarkMode
            ? const Icon(Icons.light_mode, key: ValueKey('icon1'))
            : const Icon(Icons.dark_mode, key: ValueKey('icon2')),
      ),
      color: theme.colorScheme.onSurface,
      onPressed: () => themeProvider.toggleTheme(),
    );

    if (isMobile) {
      return AppBar(
        title: _buildSignature(theme),
        actions: [
          themeToggleBtn,
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Mobile drawer logic to be added
            },
          ),
        ],
      );
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      color: theme.colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSignature(theme),
          Row(
            children: [
              _NavButton(title: 'About', onPressed: () => navProvider.scrollTo(navProvider.aboutKey)),
              _NavButton(title: 'Experience', onPressed: () => navProvider.scrollTo(navProvider.experienceKey)),
              _NavButton(title: 'Projects', onPressed: () => navProvider.scrollTo(navProvider.projectsKey)),
              _NavButton(title: 'Contact', onPressed: () => navProvider.scrollTo(navProvider.contactKey)),
              const SizedBox(width: 16),
              themeToggleBtn,
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const _NavButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
