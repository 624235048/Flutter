import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/model/apartment_model.dart';
import 'package:miniproject/src/page/apartment_page/apartment_body.dart';
import 'package:miniproject/src/services/networt.dart';

class ApartmentPage extends StatefulWidget {
  @override
  _ApartmentPageState createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: _buildAppBarAPM(),
      body: ApartmentBody(),
    );
  }

  AppBar _buildAppBarAPM() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //onPressed: () => Navigator.of(context).pop(),
        onPressed: (){
          Navigator.pushNamed(context, AppRoute.HomeRoute);
        },
      ),
      title:
      !isSearching
          ? Text('')
          : TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white),
            hintText: "search ",
            helperStyle: TextStyle(color: Colors.white)),
      ),
      actions: <Widget>[
        isSearching
            ? IconButton(
          icon: Icon(Icons.close,color: Colors.white),
          onPressed: () {
            setState(() {
              this.isSearching = false;
            });
          },
        )
            : IconButton(
          icon: Icon(Icons.search,color: Colors.white),
          onPressed: () {
            setState(() {
              this.isSearching = true;
            });
          },
        ),
        IconButton(
          icon: ClipOval(
            child: Icon(Icons.assessment_outlined, color: Colors.white),),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  bool check = false;
                  bool check2 = false;
                  bool check3 = false;
                  bool check4 = false;
                  bool _checkboxValue = false;
                  bool _checkboxValue2 = false;
                  bool _checkboxValue3 = false;
                  bool _checkboxValue4 = false;
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 16,
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('น้อยกว่า 3,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                    Checkbox(
                                        value: check,
                                        onChanged: (bool value) {
                                          setState(() {
                                            check = value;
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('3,000 - 4,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                    Checkbox(
                                        value: check2,
                                        onChanged: (bool value) {
                                          setState(() {
                                            check2 = value;
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('4,000 - 5,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                    Checkbox(
                                        value: check3,
                                        onChanged: (bool value) {
                                          setState(() {
                                            check3 = value;
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('มากกว่า 5,000 บาท',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                    Checkbox(
                                        value: _checkboxValue4,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _checkboxValue4 = value;
                                          });
                                        })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        IconButton(
          icon: ClipOval(
            child: Icon(Icons.add, color: Colors.white),),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.ApartmentManagementRoute);
          },
        )
      ],
    );
  }
}
