class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String? appStoreUrl;
  final String? googlePlayUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.appStoreUrl,
    this.googlePlayUrl,
  });
}
