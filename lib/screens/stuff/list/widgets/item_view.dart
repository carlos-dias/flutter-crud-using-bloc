import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crudbloc/blocs/stuff_bloc.dart';
import 'package:crudbloc/models/stuff_model.dart';
import 'package:crudbloc/screens/stuff/add/add_stuff_screen.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final List<StuffModel> listStuffModel;
  final int index;

  final stuffBloc = BlocProvider.getBloc<StuffBloc>();

  ItemView(this.listStuffModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(listStuffModel[index].id.toString()),
      onDismissed: (direction) =>
          stuffBloc.remove(listStuffModel[index].id),
      background: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        color: Colors.orange,
      ),
      secondaryBackground: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        color: Colors.red,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AddStuffScreen.edit(listStuffModel[index])));
        },
        child: Row(children: [
          Expanded(
            flex: 9,
            child: Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listStuffModel[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87),
                        ),
                        Text(
                          listStuffModel[index].description,
                          style: TextStyle(color: Colors.black26),
                        )
                      ]),
                )),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(listStuffModel[index].favorited
                  ? Icons.star
                  : Icons.star_border),
              onPressed: () {
                stuffBloc.save(listStuffModel[index]
                  ..favorited = !listStuffModel[index].favorited);
              },
            ),
          )
        ]),
      ),
    );
  }
}
