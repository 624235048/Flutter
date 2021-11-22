import 'package:flutter/material.dart';
import 'package:miniproject/src/Home/home_page.dart';
import 'package:miniproject/src/Login/login_page.dart';
import 'package:miniproject/src/Login/singup_page.dart';
import 'package:miniproject/src/page/apartment_page/apartment_compare.dart';
import 'package:miniproject/src/page/apartment_page/apartment_detail.dart';
import 'package:miniproject/src/page/apartment_page/apartment_management.dart';
import 'package:miniproject/src/page/apartment_page/apartment_map.dart';
import 'package:miniproject/src/page/apartment_page/apartment_page.dart';
import 'package:miniproject/src/page/condo_page/codo_compare.dart';
import 'package:miniproject/src/page/condo_page/condo_detail.dart';
import 'package:miniproject/src/page/condo_page/condo_management.dart';
import 'package:miniproject/src/page/condo_page/condo_map.dart';
import 'package:miniproject/src/page/condo_page/condo_page.dart';
import 'package:miniproject/src/page/dormitory_page/domitory_detail.dart';
import 'package:miniproject/src/page/dormitory_page/dormitory_compare.dart';
import 'package:miniproject/src/page/dormitory_page/dormitory_management.dart';
import 'package:miniproject/src/page/dormitory_page/dormitory_map.dart';
import 'package:miniproject/src/page/dormitory_page/dormitory_page.dart';
import 'package:miniproject/src/page/management/home_management.dart';
import 'package:miniproject/src/page/mansion_page/mansion_compare.dart';
import 'package:miniproject/src/page/mansion_page/mansion_detail.dart';
import 'package:miniproject/src/page/mansion_page/mansion_management.dart';
import 'package:miniproject/src/page/mansion_page/mansion_map.dart';
import 'package:miniproject/src/page/mansion_page/mansion_page.dart';
import 'package:miniproject/src/page/profile/profile2_page.dart';
import 'package:miniproject/src/page/profile/profile_page.dart';



class AppRoute{
  static const HomeRoute = "Home";
  static const LoginRoute = "Login";
  static const CondoRoute = "Condo";
  static const CondoDetailRoute = "CondoDetail";
  static const ApartmentRoute = "Apartment";
  static const ApartmentDetailRoute = "ApartmentDetail";
  static const DormitoryRoute = "Dormitory";
  static const DormitoryDetailRoute = "DormitoryDetail";
  static const MansionRoute = "Mansion";
  static const MansionDetailRoute = "MansionDetail";
  static const CondoMapRoute = "CondoMapPage";
  static const ApartmentMapRoute = "ApartmentMap";
  static const DormitoryMapRoute = "DormitoryMap";
  static const MansionMapRoute ="MansionMap";
  static const SingupRoute = "Singup";
  static const ProfileRoute = "Profile";
  static const Profile2Route = "Profile2";
  static const HomemanagementRoute = "Homemanage";
  static const CondoManagementRoute = "Condomanage";
  static const ApartmentManagementRoute = "Apartmanage";
  static const DormitoryManagementRoute = "Dormitorymanage";
  static const MansionManagementRoute = "Mansionmanage";
  static const CondoCompareRoute = "Condocompare";
  static const ApartmentcompareRoute = "Apartmentcompare";
  static const DormidorycompareRoute = "Dormitorycompare";
  static const MansioncompareRoute = "Mansioncompare";


  final _route = <String, WidgetBuilder>{
    HomeRoute:(context) => HomePage(),
    LoginRoute:(context) => LoginPage(),
    CondoRoute:(context) => CondoPage(),
    ApartmentRoute:(context) => ApartmentPage(),
    DormitoryRoute:(context) => DormitoryPage(),
    MansionRoute:(context) => MansionPage(),
    CondoDetailRoute:(context) => CondoDetail(),
    ApartmentDetailRoute:(context) => ApartmentDetail(),
    DormitoryDetailRoute:(context) => DormitoryDetail(),
    MansionDetailRoute:(context) => MansionDetail(),
    CondoMapRoute:(context) => CondoMap(),
    ApartmentMapRoute:(context) => ApartmentMap(),
    DormitoryMapRoute:(context) =>DormitoryMap(),
    MansionMapRoute:(context) =>MansionMap(),
    SingupRoute:(context) =>SingupPage(),
    ProfileRoute:(context) => ProfilePage(),
    Profile2Route:(context) => Profile2Page(),
    HomemanagementRoute:(context) => HomeManagement(),
    CondoManagementRoute :(context) => CondoManagement(),
    ApartmentManagementRoute :(context) => ApartmentManagement(),
    DormitoryManagementRoute :(context) => DormitoryManagement(),
    MansionManagementRoute :(context) => MansionManagement(),
    CondoCompareRoute :(context) => CondoCompare(),
    ApartmentcompareRoute :(context) => ApartmentCompare(),
    DormidorycompareRoute :(context) => DormitoryCompare(),
    MansioncompareRoute :(context) => MansionCompare(),
  };

  get getAll => _route;
}//end clas