import 'dart:async';
import 'dart:convert';
import 'driver.dart';
import '../services/network/connection.dart';


// GET getAllDrivers
// POST createDriver
// PUT updateDriver
const API_DRIVERS = "drivers";

// GET getDriver
// DELETE deleteDriver
const API_DRIVER = "drivers/";

//
Future<Driver> driver(String id) async {
  var response = await restGet(API_DRIVER + id,true,false);
  return Driver.fromJson(json.decode(response));
}


//
Future<Driver> drivers() async {
  print("get drivers");
  return await restGet(API_DRIVER,true,false);
}

//
createDriver(Driver driver) async {
  print("create");
  return await restPost(API_DRIVER, driver.toJson().toString(),true);
}

//
updateDriver(Driver driver) async {
  print("update");
  return await restPut(API_DRIVER, driver.toJson().toString(),true);
}


//
deleteDriver(Driver driver) async {
  return await restDelete(API_DRIVER + driver.toJson().toString());
}


List<Driver> driversData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<Driver> lu= parsed.map<Driver>((json) => Driver.fromJson(json)).toList();
  return lu;
}

