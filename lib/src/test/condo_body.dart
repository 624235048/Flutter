import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/condo_model.dart';
import 'package:miniproject/src/services/networt.dart';

class CondoBody extends StatefulWidget {
  @override
  _CondoBodyState createState() => _CondoBodyState();
}

class _CondoBodyState extends State<CondoBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CondoCarousel()
    );
  }
}

class CondoCarousel extends StatefulWidget {
  @override
  _CondoCarouselState createState() => _CondoCarouselState();
}

class _CondoCarouselState extends State<CondoCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      child: FutureBuilder<CondoModel>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: PageView.builder(
                        itemCount: snapshot.data.condos.length,
                        itemBuilder: (context, index) {
                          var condo = snapshot.data.condos[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                            image: NetworkImage(
                                          API.CONDO_IMAGE + condo.condoImage,
                                        ))),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8.0/2),
                                  child: Text(
                                    condo.condoName,
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("assets/icons/star-icon.png",height: 30,),
                                    SizedBox(width: 5),
                                    Text(condo.condoReview,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Type : " +condo.condoType,style: Theme.of(context).textTheme.subtitle1,),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                        ),
                  )
              );
            }
          }),
    )
    );
  }
} //end


