import 'package:flutter/material.dart';
import '../../../core/utils/responsive_layout.dart';
import '../../../components/primary_button.dart';
import '../../../components/section_header.dart';
import '../../../components/skill_chip.dart';

import '../../../features/projects/views/projects_view.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samer Afeef'),
      ),
      body: const ResponsiveLayout(
        mobile: _PortfolioContent(isMobile: true),
        desktop: _PortfolioContent(isMobile: false),
      ),
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  final bool isMobile;
  const _PortfolioContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Top Projects'),
          const SizedBox(height: 32),
          const ProjectsView(),
          const SizedBox(height: 24),
          PrimaryButton(
            text: 'View More on GitHub',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
