import 'package:coffee_Shop_UI/constants/color_palette.dart';
import 'package:coffee_Shop_UI/screens/black_gold.dart';
import 'package:coffee_Shop_UI/screens/cold_brew.dart';
import 'package:coffee_Shop_UI/screens/gold_brew.dart';
import 'package:coffee_Shop_UI/screens/mcCafe.dart';
import 'package:coffee_Shop_UI/screens/nescafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette = ColorPalette();

  var _selectedOption = 0;

  List allOptions = [
    BlakGold(),
    ColdBrew(),
    NesCafe(),
    McCafe(),
    GoldBrew(),
  ];

  List isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          Container(
            height: screenHeight,
            width: screenWidth / 5,
            color: colorPalette.leftBarColor,
          ),
          Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 35,
            left: 20,
            child: Icon(Feather.menu),
          ),
          Positioned(
            top: 35,
            right: 20,
            child: Icon(Feather.shopping_bag),
          ),
          Positioned(
            top: screenHeight - (screenHeight - 140),
            left: screenWidth / 5 + 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CoffeeHouse',
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFF23163D),
                    fontSize: 40,
                  ),
                ),
                Text(
                  'A lot can happen over coffee',
                  style: GoogleFonts.bigShouldersText(
                    color: Color(0xFFA59FB0),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 225,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      hintText: 'Search....',
                      hintStyle: GoogleFonts.bigShouldersText(
                        color: Color(0xFFA59FB0),
                        fontSize: 15,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildSideNavigator(),
          Positioned(
            top: screenHeight/3 + 5,
            left: screenWidth/5 + 25,
            child: Container(
              height: screenHeight - screenHeight/3 + 50,
              width: screenWidth - screenWidth/5 + 40,
              child: allOptions[_selectedOption],
            ),
          ),
        ],
      ),
    );
  }

  buildSideNavigator() {
    return Positioned(
      top: 75,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height - 100,
          height: MediaQuery.of(context).size.width / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOption('Black Gold', 0),
              buildOption('Cold Brew', 1),
              buildOption('Nescafe', 2),
              buildOption('McCafe', 3),
              buildOption('Gold Brew', 4),
            ],
          ),
        ),
      ),
    );
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = index;
              isOptionSelected(index);
            });
          },
          child: Text(
            title,
              style: isSelected[index]
                  ? GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 18.0)
                  : GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 17.0),
          ),
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
