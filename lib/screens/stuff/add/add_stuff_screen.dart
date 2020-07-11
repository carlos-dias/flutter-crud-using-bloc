import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crudbloc/blocs/stuff_bloc.dart';
import 'package:crudbloc/models/stuff_model.dart';
import 'package:crudbloc/utils/background_screen_util.dart';
import 'package:flutter/material.dart';

class AddStuffScreen extends StatelessWidget {
  final StuffModel _stuffModel;

  AddStuffScreen.edit(this._stuffModel);

  AddStuffScreen() : this._stuffModel = StuffModel();

  @override
  Widget build(BuildContext context) {
    final stuffBloc = BlocProvider.getBloc<StuffBloc>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
          title: Text((_stuffModel.id == null) ? "Add Stuff" : "Edit Stuff")),
      body: BackgroundScreenUtil(
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _stuffModel.name,
                decoration: InputDecoration(labelText: "Name"),
                onSaved: (newValue) => _stuffModel.name = newValue,
                validator: (value) => value.isEmpty ? "Required" : null,
              ),
              TextFormField(
                initialValue: _stuffModel.description,
                decoration: InputDecoration(labelText: "Description"),
                onSaved: (newValue) => _stuffModel.description = newValue,
                validator: (value) => value.isEmpty ? "Required" : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.0,
                    margin: EdgeInsets.only(right: 5.0),
                    child: FlatButton.icon(
                      color: Colors.black26,
                      label: Text("Cancel"),
                      icon: Icon(Icons.close),
                      onPressed: () {
                        formKey.currentState.reset();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    width: 150.0,
                    margin: EdgeInsets.only(left: 5.0),
                    child: FlatButton.icon(
                      color: Colors.black26,
                      label: Text("Save"),
                      icon: Icon(Icons.save),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          formKey.currentState.reset();
                          stuffBloc.save(_stuffModel);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
