import 'package:crudbloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  final PageController _pageController;

  DrawerDefault(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Text("This app does nothing special"),
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _pageController.jumpToPage(Pages.HOME.index);
            },
          ),
          ListTile(
            title: Text('Stuffs'),
            onTap: () {
              Navigator.pop(context);
              _pageController.jumpToPage(Pages.LIST_STUFF.index);
            },
          ),
        ],
      ),
    );
  }
}
