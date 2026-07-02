import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive_layout.dart';
import '../../../components/section_header.dart';
import '../controllers/project_provider.dart';
import 'widgets/project_card.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the controller just for this view, or it could be global.
    return ChangeNotifierProvider(
      create: (_) => ProjectProvider(),
      child: const _ProjectsContent(),
    );
  }
}

class _ProjectsContent extends StatelessWidget {
  const _ProjectsContent();

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectProvider>().projects;

    return ResponsiveLayout(
      mobile: _buildList(context, projects, isMobile: true),
      tablet: _buildGrid(context, projects, crossAxisCount: 2),
      desktop: _buildGrid(context, projects, crossAxisCount: 3),
    );
  }

  Widget _buildList(BuildContext context, projects, {required bool isMobile}) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }

  Widget _buildGrid(BuildContext context, projects, {required int crossAxisCount}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.85, // Adjust based on content height
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}
