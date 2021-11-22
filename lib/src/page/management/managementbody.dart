import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';

class ManagementBody extends StatefulWidget {
  @override
  _ManagementBodyState createState() => _ManagementBodyState();
}

class _ManagementBodyState extends State<ManagementBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .85,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: <Widget>[
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoute.CondoCompareRoute);
                    },
                    child: CategoryCard(
                        title: "Condominium",
                        imagesSrc: "assets/images/condo1-removebg-preview.png"),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoute.ApartmentcompareRoute);
                    },
                    child: CategoryCard(
                        title: "Apartment",
                        imagesSrc: "assets/images/31559490-removebg-preview.png"),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoute.MansioncompareRoute);
                    },
                    child: CategoryCard(
                        title: "Mansion",
                        imagesSrc: "assets/images/mansion-removebg-preview.png"),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoute.DormidorycompareRoute);
                    },
                    child: CategoryCard(
                        title: "Dormitory",
                        imagesSrc: "assets/images/dm-removebg-preview.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagesSrc;
  final String title;
  const CategoryCard({
    Key key,
    this.title,
    this.imagesSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            )
          ],
        ),
        child: Material(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(imagesSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
