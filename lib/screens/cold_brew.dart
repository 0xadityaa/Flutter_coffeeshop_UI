import 'package:coffee_Shop_UI/constants/color_palette.dart';
import 'package:coffee_Shop_UI/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: ListView(
         padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
        shrinkWrap: true,
        // padding: EdgeInsets.zero,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          buildListItems('assets/coffee4.png', '150', ColorPalette().secondSlice),
          buildListItems('assets/coffee2.png', '200', ColorPalette().firstSlice),
          // buildListItems('assets/coffee4.png', '150', ColorPalette().secondSlice),
        ],
      ),
    );
  }
  buildListItems(String imgPath, String Price, Color bgColor){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoffeeDetails(imgPath: imgPath, headerColor: bgColor)));
  //       Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => )
  // );
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('assets/doodle.png'),
                  fit: BoxFit.none
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: bgColor.withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            // right: 0.1,
            left: 110,
            child: Hero(
               tag: imgPath,
              // tag: "HR-150",
              child: Container(
                height: 250,
                width: 150,
                child: Image(image: AssetImage(imgPath), fit: BoxFit.scaleDown,),
              ),
            ),
          ),
          Positioned(
            top: 125,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 20,
                  ),
                ),
                Text(
                  '\$' + Price,
                  style: GoogleFonts.bigShouldersText(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Grady\'s COLD BREW',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 27.0),
                ),
                SizedBox(height: 2.0),
                Container(
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '65 reviews',
                            style: GoogleFonts.bigShouldersText(
                                color: Colors.white, fontSize: 15.0),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            size: 18.0,
                            color: Colors.white,
                            borderColor: Colors.white,
                            rating: 3.0
                          )
                        ]
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 75.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 17.0),
                              SizedBox(width: 5.0),
                              Text('Add',
                                      style: GoogleFonts.bigShouldersText(
                                      color: Color(0xFF23163D), fontSize: 15.0),
                              )
                            ]
                          )
                        )
                      ),
            ],
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