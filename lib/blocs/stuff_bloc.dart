import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crudbloc/database/stuff_db.dart';
import 'package:crudbloc/models/stuff_model.dart';
import 'package:rxdart/rxdart.dart';

class StuffBloc extends BlocBase {
  final StuffDb _stuffDb;

  final BehaviorSubject _stuffController;

  StuffBloc()
      : _stuffDb = StuffDb(),
        _stuffController = BehaviorSubject<List<StuffModel>>() {
    _findAll();
  }

  Future<void> save(StuffModel stuffModel) async {
    _stuffDb.save(stuffModel);
    _findAll();
    return null;
  }

  Future<void> remove(int idStuffModel) async {
    _stuffDb.delete(idStuffModel);
    _findAll();
    return null;
  }

  _findAll() async {
    _stuffController.add(await _stuffDb.findAll());
  }

  Stream get outStuffs {
    return _stuffController.stream;
  }
}
