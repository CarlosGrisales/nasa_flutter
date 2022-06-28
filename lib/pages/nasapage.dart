import 'package:flutter/material.dart';
import 'package:nasa_flutter/widget/favorites_menu.dart';
import 'package:nasa_flutter/widget/food_menu.dart';

class NasaPage extends StatefulWidget {
  const NasaPage({Key? key}) : super(key: key);

  @override
  State<NasaPage> createState() => _NasaPage();
}

class _NasaPage extends State<NasaPage> {
  double screenHeight = 0.0, screenWidth = 0.0;
  double height = 0.0;
  double width = 0.0;
  double sizeFactor = 0.0;
  List<bool> pressList = [];
  var selected = -1;
  int cambio = 1;

  int _actualpage = 1;
  final pageController = PageController();

  Widget FloationButton(Icon iconoType, bool sizeIcon, Color colorIcon ) {
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

  Widget bottonMenu( String text, bool isPress, int index,) {
    return GestureDetector(
      onTap: () {
        var flag = pressList[index];
        for (int i = 0; i < pressList.length; i++) {
          setState(() {
            pressList[i] = false;
            if (index == i) {
              if (flag)
                pressList[index] = false;
              else
                pressList[i] = true;
              print(pressList[index]);
            }
            selected = index;
          });
          pageController.jumpToPage(index);
          
        }

        print(pressList);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            const BoxShadow(
              color: Colors.black45,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
          color: isPress ? Colors.orange : Colors.white,
        ),
        margin: EdgeInsets.only(top: screenHeight * 0.005, bottom: screenHeight * 0.005),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPress ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    pressList = [true, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    sizeFactor = screenHeight - screenWidth;
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            bool? result = await false;
            if (result == null) {
              result = false;
            }
            return result!;
          },
          child: Center(
              child: Container(
            color: Colors.blueAccent,
            child: ListView(
              children: [
                Container(
                  height: screenHeight * 0.15,
                  child: Row(
                    children: [
                      Spacer(flex: 1),
                      Container(
                        width: screenWidth * 0.35,
                        child: Image.asset(
                          'assets/img/logonasa.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Spacer(flex: 4),
                      FloationButton(
                        Icon(Icons.notifications_active_outlined),
                        true,
                        Colors.black,
                        
                      ),
                      FloationButton(
                        Icon(Icons.settings),
                        true,
                        Colors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * 0.1,
                  child: Row(children: [
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.5,
                      child: Text('Favorites',
                          style: TextStyle(
                            fontSize: sizeFactor * 0.098,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Container(
                      width: screenWidth * 0.2,
                      child: FloationButton(
                        Icon(Icons.add),
                        false,
                        Colors.black,
                      ),
                    ),
                  ]),
                ),

              
                Container(
                  height: screenHeight * 0.06,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 12),
                      Container(
                        child: bottonMenu("All", pressList[0], 0),
                      ),
                      SizedBox(width: 12),
                      Container(
                        child: bottonMenu("Happy Hours", pressList[1], 1),
                      ),
                      SizedBox(width: 12),
                      Container(
                        child: bottonMenu("Drinks", pressList[2], 2),
                      ),
                      SizedBox(width: 12),
                      Container(
                        child: bottonMenu("Beer", pressList[3], 3),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
               Container(
                  height: screenHeight * 0.6, child:
                Expanded(child: Menu(selected,
                (int index){
                  setState(() {
                    selected = index;
                  });
                },
                pageController,
                
                ),
                ),),
    
              ],
            ),
          ),),),
    );
  }
}
