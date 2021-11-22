import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
              SizedBox(height: topPadding),
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: Text(
                    'Sinup',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFF6495ED),
                            ),
                            border: InputBorder.none,
                            hintText: "\tName",
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
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFF6495ED),
                            ),
                            border: InputBorder.none,
                            hintText: "\tSurname",
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
                        obscureText: isHidden,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: Color(0xFFF6495ED),
                            ),
                            border: InputBorder.none,
                            hintText: "\tPhone",
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
                        obscureText: isHidden,
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
                        obscureText: isHidden,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Color(0xFFF6495ED),
                            ),
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
                onPressed: ()  {
                  Navigator.pop(context, AppRoute.LoginRoute);

                },
                child: Text('Singup',
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
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoute.LoginRoute);
                },
                child: Text("Cancel",
                    style: TextStyle(
                        color: Color(0xFFF6495ED),
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
