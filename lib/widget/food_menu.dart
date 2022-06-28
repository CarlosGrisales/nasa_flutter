import 'package:flutter/material.dart';
import 'package:nasa_flutter/widget/favorites_menu.dart';

class Menu extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  Menu(this.selected, this.callback, this.pageController);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [FavoritesMenu()],
      ),
    );
  }
}
