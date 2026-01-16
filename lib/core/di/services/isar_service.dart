import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sillicon_power/data/models/tv_show_page_model.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  
  late Isar _isar;
  
  factory IsarService() {
    return _instance;
  }
  
  IsarService._internal();
  
  Isar get isar => _isar;
  
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TVShowPageModelSchema],
      directory: dir. path,
    );
  }
  
  Future<void> close() async {
    await _isar.close();
  }
}