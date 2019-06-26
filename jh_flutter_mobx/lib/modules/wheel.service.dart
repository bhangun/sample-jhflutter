import 'dart:async';
import 'dart:convert';
import 'wheel.dart';
import '../services/network/connection.dart';


// GET getAllWheels
// POST createWheel
// PUT updateWheel
const API_WHEELS = "wheels";

// GET getWheel
// DELETE deleteWheel
const API_WHEEL = "wheels/";

//
Future<Wheel> wheel(String id) async {
  var response = await restGet(API_WHEEL + id,true,false);
  return Wheel.fromJson(json.decode(response));
}


//
Future<Wheel> wheels() async {
  print("get wheels");
  return await restGet(API_WHEEL,true,false);
}

//
createWheel(Wheel wheel) async {
  print("create");
  return await restPost(API_WHEEL, wheel.toJson().toString(),true);
}

//
updateWheel(Wheel wheel) async {
  print("update");
  return await restPut(API_WHEEL, wheel.toJson().toString(),true);
}


//
deleteWheel(Wheel wheel) async {
  return await restDelete(API_WHEEL + wheel.toJson().toString());
}


List<Wheel> wheelsData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<Wheel> lu= parsed.map<Wheel>((json) => Wheel.fromJson(json)).toList();
  return lu;
}

