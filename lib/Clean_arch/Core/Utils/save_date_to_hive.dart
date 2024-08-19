import 'package:hive/hive.dart';
class SaveToHive {
  static void saveDataToHive<ListType>(List<ListType> dataList, String boxName) {
    print('HIVE list type $ListType');
    var box = Hive.box<ListType>(boxName);
    box.addAll(dataList).then((value){
      print('Hive saved all data $value');
    });
  }
}
