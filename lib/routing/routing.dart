import 'package:flutter/material.dart';
import 'package:repozen/presentation/navigation/bottomNav.dart';
import 'package:repozen/presentation/screens/export_screens.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    const bottomNavPage = "/";
    const splashScreen = "/splash";
    const homePage = "/home";
    const news = "/news";
    const makePost = "/makePost";
    const partnerships = "/partnerships";
    const profil = "/profil";

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case news:
        return MaterialPageRoute(builder: (_) => News());
      case makePost:
        return MaterialPageRoute(builder: (_) => MakePost());
      case partnerships:
        return MaterialPageRoute(builder: (_) => Partenerships());
      case profil:
        return MaterialPageRoute(builder: (_) => Profiles());
      case bottomNavPage:
        return MaterialPageRoute(builder: (_) => BottomNav());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        // TODO : can create NotFoundPage
        return MaterialPageRoute(builder: (_) => BottomNav());
    }
  }
}