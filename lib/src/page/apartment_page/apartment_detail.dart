import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/apartment_model.dart';
import 'package:share/share.dart';

class ApartmentDetail extends StatefulWidget {


  @override
  _ApartmentDetailState createState() => _ApartmentDetailState();
}

class _ApartmentDetailState extends State<ApartmentDetail> {
  Apartment _apm;
  double rating =0;

  @override
  void initState() {
    _apm = Apartment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Apartment) {
      _apm = arguments;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: BodyDetail(),
      );
    }
    Widget BodyDetail() {
      var size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(API.APARTMENT_IMAGE + _apm.apmImage),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.ApartmentRoute);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Share.share(
                                'ยินดีต้อนรับสู่อพาร์ตเมนต์ 🙏🏻❤️' +
                                    '\n'+ _apm.apmName +
                                    '\nLocation : ' +
                                    _apm.apmLocation + '\nPhone : '+_apm.apmPhone,
                              );
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoute.ApartmentMapRoute);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.45),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //width: 120,
                          child: Text(
                            _apm.apmName.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '\฿' + _apm.apmPrice,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'ราคา',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/icons/star-icon.png',
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(_apm.apmReview)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Phone : ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _apm.apmPhone,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Limitedroom : ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                         _apm.apmLimitedroom,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Facilities : ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _apm.apmFacilities,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location : ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _apm.apmLocation,
                          style: TextStyle(color: Colors.grey, height: 1.6),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail : ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _apm.apmDetail,
                          style: TextStyle(color: Colors.grey, height: 1.6),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: NetworkImage(API.APARTMENT_IMAGE2 + _apm.apmImage2),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: NetworkImage(API.APARTMENT_IMAGE2 + _apm.apmImage3),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: NetworkImage(API.APARTMENT_IMAGE2 + _apm.apmImage4),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Rating : $rating',
                            style: TextStyle(fontSize: 20),
                          ),
                          RatingBar.builder(
                            minRating: 1,
                            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                            updateOnDrag: true,
                            onRatingUpdate: (rating) => setState((){
                              this.rating = rating;
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'comment..',
                        prefixIcon: Icon(Icons.send),
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
                    // IconButton(onPressed: (){}, icon: Icon(Icons.send))
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
