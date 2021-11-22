import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/mansion_model.dart';
import 'package:miniproject/src/services/networt.dart';

class MansionBody extends StatefulWidget {
  @override
  _MansionBodyState createState() => _MansionBodyState();
}

class _MansionBodyState extends State<MansionBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage('assets/images/pic03.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mansion',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2),
                      )
                    ],
                  ))
            ],
          ),
          Expanded(
            child: FutureBuilder<MansionModel>(
                future: NetworkService().getAllMansionDio(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            itemCount: snapshot.data.mansions.length,
                            itemBuilder: (context, index) {
                              var mansion = snapshot.data.mansions[index];
                              return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, AppRoute.MansionDetailRoute,arguments: mansion);
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(40, 5, 25, 10),
                                      height: 170,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            100, 20, 20, 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    mansion.msName,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '\฿' + mansion.msPrice,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      'ราคา',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Type : ' + mansion.msType,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                                'Limitedroom : ' +
                                                    mansion.msLimitedroom,
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text(
                                                'Facilities : ' +
                                                    mansion.msFacilities,
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            //Image.asset('assets/icons/star.jpg'+ apartment.apmReview,),
                                            //_buildRatingStars(apartment.apmReview),
                                            //Text('Location : ' + apartment.apmLocation),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 15,
                                      bottom: 15,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            width: 110,
                                            image: NetworkImage(
                                                API.MANSION_IMAGE +
                                                    mansion.msImage),
                                            fit: BoxFit.cover,
                                            //API.APARTMENT_IMAGE + apartment.apmImage)
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
