import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static Box? _box;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('EmrHive');
  }

  static Future<void> openBox(String boxName) async {
    _box = await Hive.openBox(boxName);
  }

  static Future<void> closeBox() async {
    await _box?.close();
    _box = null;
  }

  static bool isBoxOpen() {
    return _box?.isOpen ?? false;
  }

  static Future<dynamic> getData(String key) async {
    return _box?.get(key);
  }

  static Future<void> saveData(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  static Future<void> updateData(dynamic key, dynamic value) async {
    await _box?.put(key, value);
  }

  static Future<void> deleteData(dynamic key) async {
    await _box?.delete(key);
  }

  static Future<void> clearBox() async {
    await _box?.clear();
  }

  static List<dynamic> getAllKeys() {
    return _box?.keys.toList() ?? [];
  }

  static bool containsKey(dynamic key) {
    return _box?.containsKey(key) ?? false;
  }

  static Stream<BoxEvent>? watchBox() {
    return _box?.watch();
  }

  static List<dynamic> getAllValues() {
    return _box?.values.toList() ?? [];
  }
}
