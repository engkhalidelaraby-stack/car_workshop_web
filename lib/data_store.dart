import 'package:shared_preferences/shared_preferences.dart';

// ================== السيارات ==================
const String carsKey = "cars";

Future<List<String>> getCars() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(carsKey) ?? [];
}

Future<void> addCar(String plate) async {
  final prefs = await SharedPreferences.getInstance();
  final cars = prefs.getStringList(carsKey) ?? [];
  if (!cars.contains(plate)) {
    cars.add(plate);
    await prefs.setStringList(carsKey, cars);
  }
}

Future<void> updateCar(String oldPlate, String newPlate) async {
  final prefs = await SharedPreferences.getInstance();
  final cars = prefs.getStringList(carsKey) ?? [];
  final i = cars.indexOf(oldPlate);
  if (i != -1) {
    cars[i] = newPlate;
    await prefs.setStringList(carsKey, cars);
  }
}

// ================== البلاغات ==================
const String reportsKey = "reports";

Future<List<String>> getReports() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(reportsKey) ?? [];
}

Future<void> addReport({
  required String carPlate,
  required String part,
  required String notes,
  required String date,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final reports = prefs.getStringList(reportsKey) ?? [];

  reports.add("$carPlate|$part|$notes|$date");
  await prefs.setStringList(reportsKey, reports);
}
