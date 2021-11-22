import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/config/app_setting.dart';
import 'package:miniproject/src/services/networt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  var _usernameController = TextEditingController();

  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(100, 149, 237, 1.0),
          Color.fromRGBO(194, 220, 243, 1.0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(height: topPadding),
                SizedBox(height: 50),
                Image.asset('assets/images/rocket.png'),
                Container(
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 50,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(181, 113, 157, 239),
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(0xFFF6495ED),
                              ),
                              border: InputBorder.none,
                              hintText: "\tUsername",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(181, 113, 157, 239),
                                  blurRadius: 15.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: isHidden,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xFFF6495ED),
                              ),
                              suffixIcon: IconButton(icon: isHidden? Icon(Icons.visibility_off): Icon(Icons.visibility), onPressed: togglePasswordVisibility),
                              border: InputBorder.none,
                              hintText: "\tPassword",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      //SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                ElevatedButton(
                  onPressed: () async {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    final message = await NetworkService().validateUserLoginDio(username, password);
                    print(message);
                    if (message != 'failed') {
                      print('login success');
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString(AppSetting.userNameSetting, username);
                      prefs.setString(AppSetting.passwordSetting, password);


                      Navigator.pushNamed(context, AppRoute.HomeRoute);
                    }else{
                      print('login failed');
                    //   Flushbar(
                    //     icon: Icon(
                    //       Icons.cancel_outlined,
                    //       color: Colors.red,
                    //     ),
                    //     backgroundColor: Colors.blueGrey,
                    //     title:  "Failed",
                    //     message:  "Login failed, try again!!",
                    //     duration:  Duration(seconds: 5),
                    //   )..show(context);
                     }
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0XFFF99CCFF),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ?",
                      style: TextStyle(color: Color(0xFFF6495ED)),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.SingupRoute);
                      },
                      child: Text("\t\tSing Up",
                          style: TextStyle(
                              color: Color(0xFFF6495ED),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Singup',
                //       style: TextStyle(
                //           color: Colors.black38,
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold)),
                //   style: ElevatedButton.styleFrom(
                //       primary: Color(0XFFF99CCFF),
                //       padding:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30))),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
