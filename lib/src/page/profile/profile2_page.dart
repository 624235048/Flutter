import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';

class Profile2Page extends StatefulWidget {
  @override
  _Profile2PageState createState() => _Profile2PageState();
}

class _Profile2PageState extends State<Profile2Page> {
  double profileHeight = 144;
  //double coverHeight= 280;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildTop(),
            buildContent(),
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //onPressed: () => Navigator.of(context).pop(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.ProfileRoute);
        },
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final double coverHeight = 280;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Wanassaree Sahasantiwarakul',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            '624235052',
            style: TextStyle(fontSize: 20, color: Colors.black38),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              builSocialIcon(Icons.face),
              SizedBox(
                width: 12,
              ),
              builSocialIcon(Icons.satellite),
              SizedBox(
                width: 12,
              ),
              builSocialIcon(Icons.games),
              SizedBox(
                width: 12,
              ),
              builSocialIcon(Icons.phone),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          buildAbout(),
          SizedBox(
            height: 25,
          ),
          buildImage()
        ],
      );

  Widget builSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(
          child: Icon(
            icon,
            size: 32,
          ),
        ),
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Gmail : 624235052@parichat.skru.ac.th',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              'Major : Technology Information',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
      );

  Widget buildCoverImage() => Container(
        color: Colors.white24,
        child: Image.asset(
          'assets/images/111.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildImage() => Container(
        color: Colors.white24,
        child: Image.asset(
          'assets/images/222.jpg',
          width: double.infinity,
          height: 144,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: 144 / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage(
          'assets/images/4.jpg',
        ),
      );
} //end class
