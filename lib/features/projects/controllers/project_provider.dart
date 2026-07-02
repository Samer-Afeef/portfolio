import 'package:flutter/material.dart';
import '../domain/project_model.dart';

class ProjectProvider extends ChangeNotifier {
  final List<ProjectModel> _projects = [
    ProjectModel(
      title: 'Ali Talabat Platform',
      description: 'Customer ordering app with real-time synchronization. Handles orders, user data, and location-based services.',
      technologies: ['Flutter', 'Firebase', 'RESTful APIs', 'Google Maps'],
      appStoreUrl: 'REPLACE_WITH_APPSTORE_LINK',
      googlePlayUrl: 'REPLACE_WITH_PLAYSTORE_LINK',
    ),
    ProjectModel(
      title: 'Nass Platform',
      description: 'Scalable multi-vendor ordering system supporting multiple merchants and real-time order processing with secure payment gateways (99.9% success rate).',
      technologies: ['Flutter', 'Firebase', 'RESTful APIs', 'Google Maps'],
      appStoreUrl: 'REPLACE_WITH_APPSTORE_LINK',
      googlePlayUrl: 'REPLACE_WITH_PLAYSTORE_LINK',
    ),
    ProjectModel(
      title: 'Sand Al Khair',
      description: 'Real-time customer app using Pusher for instant updates. Built with a push-based architecture for live tracking and notifications.',
      technologies: ['Flutter', 'Firebase', 'RESTful APIs', 'Google Maps', 'Pusher'],
      appStoreUrl: 'REPLACE_WITH_APPSTORE_LINK',
      googlePlayUrl: 'REPLACE_WITH_PLAYSTORE_LINK',
    ),
    ProjectModel(
      title: 'ToBabk',
      description: 'Scalable customer-facing ordering app with location-based services and backend APIs for robust order management.',
      technologies: ['Flutter', 'Firebase', 'RESTful APIs', 'Google Maps'],
      appStoreUrl: 'REPLACE_WITH_APPSTORE_LINK',
      googlePlayUrl: 'REPLACE_WITH_PLAYSTORE_LINK',
    ),
    ProjectModel(
      title: 'Matajer',
      description: 'E-commerce mobile application supporting multiple product categories, vendors, product listing, cart, and checkout workflows.',
      technologies: ['Flutter', 'Firebase', 'RESTful APIs', 'Google Maps'],
      appStoreUrl: 'REPLACE_WITH_APPSTORE_LINK',
      googlePlayUrl: 'REPLACE_WITH_PLAYSTORE_LINK',
    ),
  ];

  List<ProjectModel> get projects => _projects;
}
