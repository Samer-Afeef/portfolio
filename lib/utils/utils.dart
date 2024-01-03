import 'package:flutter/material.dart';
import 'package:my_portfolio/sections/about/about.dart';
import 'package:my_portfolio/sections/contact/contact.dart';
import 'package:my_portfolio/sections/home/home.dart';
import 'package:my_portfolio/sections/portfolio/portfolio.dart';
import 'package:my_portfolio/sections/services/services.dart';
import 'package:my_portfolio/widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';


  // services
  static const String uiux = 'assets/services/ui.png';
  static const String flutter = 'assets/services/flutter.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIcons = [
  'assets/icons/facebook.png',
  'assets/icons/instagram.png',
  'assets/icons/linkedin.png',
  'assets/icons/github.png',
  'assets/icons/behance.png',
  ];


  static const List<String> socialLinks = [
    "https://facebook.com/samer.alafeef.1",
    "https://instagram.com/samer_afeef",
    "https://linkedin.com/in/samer-afeef-972536296?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
    "https://github.com/Samer-Afeef",
    "https://behance.net/samerafeef"
  ];

  static const String resume =
      'https://drive.google.com/file/d/1pQkhLDYkvRAg7K4529CpvkUJ-O6NIzqc/view?usp=drive_link';

  static const String gitHub = 'https://github.com/Samer-Afeef';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
