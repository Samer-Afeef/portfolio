import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive_layout.dart';
import '../../../features/projects/views/projects_view.dart';
import '../controllers/navigation_provider.dart';
import 'widgets/hero_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/custom_navigation_bar.dart';
import '../../../components/section_header.dart';
import '../../../components/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final navProvider = context.read<NavigationProvider>();

    return Scaffold(
      appBar: isMobile ? const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomNavigationBar(),
      ) : null,
      body: Column(
        children: [
          if (!isMobile) const CustomNavigationBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: navProvider.scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24.0 : MediaQuery.sizeOf(context).width * 0.15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(key: navProvider.aboutKey, child: const HeroSection()),
                  const SizedBox(height: 64),
                  Container(key: navProvider.experienceKey, child: const ExperienceSection()),
                  const SizedBox(height: 100),
                  Container(
                    key: navProvider.projectsKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SectionHeader(title: 'Top Projects'),
                        SizedBox(height: 48),
                        ProjectsView(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // Bottom padding
                  Container(key: navProvider.contactKey, height: 100), // Placeholder for Contact
                  const SizedBox(height: 60),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
