import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crudbloc/blocs/stuff_bloc.dart';
import 'package:crudbloc/models/stuff_model.dart';
import 'package:crudbloc/screens/stuff/list/widgets/item_view.dart';
import 'package:crudbloc/utils/background_screen_util.dart';
import 'package:flutter/material.dart';

class ListStuffScreen extends StatelessWidget {
  final stuffBloc = BlocProvider.getBloc<StuffBloc>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScreenUtil(
      child: StreamBuilder<List<StuffModel>>(
          stream: stuffBloc.outStuffs,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => ItemView(snapshot.data, index),
              );
            } else {
              return Text("Nada");
            }
          }),
    );
  }
}
