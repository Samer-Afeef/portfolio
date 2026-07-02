import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../components/primary_button.dart';
import '../../../../components/social_links.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../controllers/theme_provider.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);
    final isDark = context.watch<ThemeProvider>().isDarkMode;
    final size = MediaQuery.sizeOf(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? size.height * 0.85 : size.height * 0.85,
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Background Photo from Old Portfolio
          Positioned(
            bottom: 0,
            right: isMobile ? -20 : 0,
            child: Opacity(
              opacity: isDark ? 0.85 : 0.8,
              child: Image.asset(
                'assets/photos/samer.png',
                height: isMobile ? size.height * 0.35 : size.height * 0.75,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 40 : 60,
              bottom: isMobile ? 40 : 60,
              right: isMobile ? 0 : size.width * 0.3, // Give space so text doesn't overlap photo on desktop
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcoming Row from Old Portfolio
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WELCOME TO MY PORTFOLIO! ',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontFamily: 'Montserrat',
                        letterSpacing: 1.2,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/hi.gif',
                      height: isMobile ? 20 : 24,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Name Appearance from Old Portfolio (Samer Afeef)
                Text(
                  "Samer",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: isMobile ? 42 : 64,
                    fontWeight: FontWeight.w100,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Afeef",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: isMobile ? 42 : 64,
                    fontWeight: FontWeight.w900,
                    height: 0.9,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20),
                // Animated Text Kit from Old Portfolio
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: theme.colorScheme.primary,
                      size: isMobile ? 24 : 32,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [

                        TyperAnimatedText(
                          ' Flutter Developer',
                          speed: const Duration(milliseconds: 50),
                          textStyle: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TyperAnimatedText(
                          ' UI/UX Enthusiast',
                          speed: const Duration(milliseconds: 50),
                          textStyle: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TyperAnimatedText(
                          ' A friend :)',
                          speed: const Duration(milliseconds: 50),
                          textStyle: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      repeatForever: true,
                      isRepeatingAnimation: true,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // ATS Summary
                SizedBox(
                  width: isMobile ? double.infinity : 600,
                  child: Text(
                    'Senior Mobile Developer with 4 years of experience designing scalable, high-performance cross-platform applications, including 3+ years specializing in Flutter. Proven track record of architecting and publishing complex, real-time multi-vendor and e-commerce platforms to the App Store and Google Play. Expert in Clean Architecture, state management (Provider, BLoC), RESTful APIs, and Firebase. Dedicated to delivering exceptional user experiences, highlighted by achieving 99.8% crash-free sessions and reducing data loading latency by 40%.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 36),
                // CTA Buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    PrimaryButton(
                      text: 'Download CV',
                      onPressed: () {},
                    ),
                    PrimaryButton(
                      text: 'Contact Me',
                      isOutlined: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                // Social Links
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
