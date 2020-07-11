import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crudbloc/blocs/stuff_bloc.dart';
import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Bloc',
      home:
          BlocProvider(blocs: [Bloc((i) => StuffBloc())], child: HomeScreen()),
    );
  }
}
