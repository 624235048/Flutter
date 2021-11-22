import 'package:flutter/material.dart';
import 'package:miniproject/src/Home/home_page.dart';
import 'package:miniproject/src/Login/login_page.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/config/app_setting.dart';
import 'package:miniproject/src/page/apartment_page/apartment_body.dart';
import 'package:miniproject/src/page/apartment_page/apartment_page.dart';
import 'package:miniproject/src/page/condo_page/condo_detail.dart';
import 'package:miniproject/src/page/condo_page/condo_map.dart';
import 'package:miniproject/src/page/condo_page/condo_page.dart';
import 'package:miniproject/src/test/condo_body.dart';
import 'package:shared_preferences/shared_preferences.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.white),
       //home: CondoMap()
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(color: Colors.white,);
            }
            final token = snapshot.data.getString(AppSetting.userNameSetting ?? '');
            if(token != null ){
              return HomePage();
            }
            return LoginPage();
          }
      ),
    );
  }

}

