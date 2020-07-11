import 'package:crudbloc/screens/stuff/add/add_stuff_screen.dart';
import 'package:crudbloc/screens/stuff/list/list_stuff_screen.dart';
import 'package:crudbloc/utils/background_screen_util.dart';
import 'package:crudbloc/widgets/drawer_default.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            appBar: AppBar(title: Text("Crud using bloc")),
            drawer: DrawerDefault(_pageController),
            body: _getBody,
          ),
          Scaffold(
              appBar: AppBar(title: Text("List Stuffs")),
              drawer: DrawerDefault(_pageController),
              body: ListStuffScreen(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddStuffScreen()));
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              )),
        ]);
  }

  Widget get _getBody =>
      BackgroundScreenUtil(child: Text("welcome to my application"));
}

enum Pages { HOME, LIST_STUFF }
