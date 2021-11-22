import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Navigator.pushNamed(context, AppRoute.HomeRoute);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: ClipOval(
            child: Icon(Icons.next_plan_outlined, color: Colors.white),),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.Profile2Route);

          },
        ),
      ],
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
          Text(
            'Warinthon Kongjan',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '624235048',
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
            height: 16,
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
              'Gmail : 624235048@parichat.skru.ac.th',
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
          'assets/images/11.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildImage() => Container(
        color: Colors.white24,
        child: Image.asset(
          'assets/images/22.jpg',
          width: double.infinity,
          height: 144,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: 144 / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage(
          'assets/images/255194107_460495575522521_2344400964752651189_n.jpg',
        ),
      );
} //end class
