import 'dart:async';
import 'dart:convert';
import 'license.dart';
import '../services/network/connection.dart';


// GET getAllLicenses
// POST createLicense
// PUT updateLicense
const API_LICENSES = "licenses";

// GET getLicense
// DELETE deleteLicense
const API_LICENSE = "licenses/";

//
Future<License> license(String id) async {
  var response = await restGet(API_LICENSE + id,true,false);
  return License.fromJson(json.decode(response));
}


//
Future<License> licenses() async {
  print("get licenses");
  return await restGet(API_LICENSE,true,false);
}

//
createLicense(License license) async {
  print("create");
  return await restPost(API_LICENSE, license.toJson().toString(),true);
}

//
updateLicense(License license) async {
  print("update");
  return await restPut(API_LICENSE, license.toJson().toString(),true);
}


//
deleteLicense(License license) async {
  return await restDelete(API_LICENSE + license.toJson().toString());
}


List<License> licensesData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<License> lu= parsed.map<License>((json) => License.fromJson(json)).toList();
  return lu;
}

