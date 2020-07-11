import 'package:crudbloc/database/util/database_util.dart';
import 'package:crudbloc/models/stuff_model.dart';

class StuffDb {
  Future<int> save(StuffModel stuffModel) async {
    var db = await DataBaseUtil().db;
    if (stuffModel.id == null) {
      return await db.insert(StuffModel.TABLE_STUFF, stuffModel.toMap());
    }
    return await db.update(StuffModel.TABLE_STUFF, stuffModel.toMap(),
        where: "${StuffModel.COLUMN_ID} = ?", whereArgs: [stuffModel.id]);
  }

  Future<int> delete(int id) async {
    var db = await DataBaseUtil().db;
    return await db.delete(StuffModel.TABLE_STUFF,
        where: '${StuffModel.COLUMN_ID} = ?', whereArgs: [id]);
  }

  Future<List<StuffModel>> findAll() async {
    var db = await DataBaseUtil().db;

    List<Map> listMap = await db.query(StuffModel.TABLE_STUFF);
    List<StuffModel> listStuffModel = [];

    listMap.forEach((element) {
      listStuffModel.add(StuffModel.fromMap(element));
    });
    return listStuffModel;
  }
}
