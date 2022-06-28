import 'dart:io';

import 'package:flutter/material.dart';

class FavoritesMenu extends StatelessWidget {
  double screenHeight = 0.0, screenWidth = 0.0;
  double height = 0.0;
  double width = 0.0;
  double sizeFactor = 0.0;
  

  Widget FloationButton(Icon iconoType, bool sizeIcon, Color colorIcon) {
    return Container(
      width: screenWidth * 0.15,
      child: FloatingActionButton(
        onPressed: () {},
        child: iconoType,
        backgroundColor: Colors.white,
        foregroundColor: colorIcon,
        mini: sizeIcon,
      ),
    );
  }

  Widget typeMenu(String title, String urlmenu, int type2) {
    return Container(
        height: screenHeight * 0.15,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            const BoxShadow(
              color: Colors.black45,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(screenHeight * 0.01),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(Icons.brightness_1,
                    color: Colors.grey, size: screenHeight * 0.01),
                Icon(Icons.brightness_1,
                    color: Colors.grey, size: screenHeight * 0.01),
                Icon(Icons.brightness_1,
                    color: Colors.grey, size: screenHeight * 0.01),
              ]),
            ),
            Container(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(screenHeight * 0.01),
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  urlmenu /*  'https://picsum.photos/id/${ids[index]}/100/100' */),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.40,
                        alignment: Alignment.bottomCenter,
                        child: FloationButton(
                          Icon(Icons.favorite),
                          true,
                          Colors.orange,
                        ),
                      )
                    ],
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: sizeFactor * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    sizeFactor = screenHeight - screenWidth;

    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.fromLTRB(25, 30, 25, 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Happy Hours',
                  style: TextStyle(
                    fontSize: sizeFactor * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth * 0.3),
                FloationButton(
                  Icon(Icons.delete_outline),
                  true,
                  Colors.grey,
                ),
              ],
            ),
          ),
          typeMenu(
            'Broken shaker\n at freehand Miami',
            'https://media.giphy.com/media/4WptkxvuHS120/giphy.gif',
            1
          ),
          typeMenu(
            'Esotico Valley',
            'https://media.giphy.com/media/Ih0tpVwlWACJy/giphy.gif',
            1
          ),
          typeMenu(
            'Esotico Valley',
            'https://media.giphy.com/media/4J3ZW2COhYRbi/giphy.gif',
            1
          ),
          typeMenu(
            'Esotico Valley',
            'https://media.giphy.com/media/XGZj32qtC97t97Pml3/giphy.gif',
            1
          ),
          typeMenu(
            'Esotico Valley',
            'https://media.giphy.com/media/UqjtjRBIxruugVcmEL/giphy.gif',
            2
          ),
        ],
      ),
    );
  }
}
