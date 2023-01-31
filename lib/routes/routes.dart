import 'package:dietapp/navbar/navbar.dart';
import 'package:dietapp/screens/homepage/home_page.dart';
import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:dietapp/screens/social/social.dart';
import 'package:dietapp/screens/explore/explore.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: social, page: () => const SocialScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: explore, page: () => const ExploreScreen())
  ];

  static getNavBar() => navbar;
  static getHome() => home;
  static getProfile() => profile;
  static getSocial() => social;
  static getExplore() => explore;

  static String navbar = "/";
  static String home = "/home";
  static String profile = "/profile";
  static String explore = "/explore";
  static String social = "/social";
}
