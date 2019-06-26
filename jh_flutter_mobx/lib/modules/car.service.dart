import 'dart:async';
import 'dart:convert';

import '../services/network/connection.dart';
import 'car.dart';


// GET getAllCars
// POST createCar
// PUT updateCar
const API_CARS = "cars";

// GET getCar
// DELETE deleteCar
const API_CAR = "cars/";

//
Future<Car> car(String id) async {
  var response = await restGet(API_CAR + id,true,false);
  return Car.fromJson(json.decode(response));
}


//
Future<Car> cars() async {
  print("get cars");
  return await restGet(API_CAR,true,false);
}

//
createCar(Car car) async {
  print("create");
  return await restPost(API_CAR, car.toJson().toString(),true);
}

//
updateCar(Car car) async {
  print("update");
  return await restPut(API_CAR, car.toJson().toString(),true);
}


//
deleteCar(Car car) async {
  return await restDelete(API_CAR + car.toJson().toString());
}


List<Car> carsData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<Car> lu= parsed.map<Car>((json) => Car.fromJson(json)).toList();
  return lu;
}

