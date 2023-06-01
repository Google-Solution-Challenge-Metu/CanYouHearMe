import 'package:dietapp/navbar/navbar.dart';
import 'package:dietapp/navbar/navbarSOS.dart';
import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:dietapp/screens/home.dart';
import 'package:dietapp/screens/explore/explore.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbarsos, page: () => const NavBarSOS()),
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: explore, page: () => const ExploreScreen())
  ];

  static String navbar = "/a";
  static String navbarsos = "/b";
  static String home = "/home";
  static String profile = "/profile";
  static String explore = "/explore";

  static getNavBar(double x){
    if(x>1){
      navbar = "/";
    } else {
      navbarsos = "/";
    }
  }
  static getHome() => home;
  static getProfile() => profile;
  static getExplore() => explore;

  
}
