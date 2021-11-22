import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';

class DormitoryCompare extends StatefulWidget {

  @override
  _DormitoryCompareState createState() => _DormitoryCompareState();
}

class _DormitoryCompareState extends State<DormitoryCompare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildCenter(),);
  }



  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Compare Dormitory'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.HomeRoute);
        },
      ),
    );
  }

  Center _buildCenter() {
    return Center(
      child: Padding(
        padding:  EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Select Dormitory',
                prefixIcon: Icon(Icons.apartment),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Select Dormitory',
                prefixIcon: Icon(Icons.apartment),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Compare'),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  primary: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  //fixedSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }
}

