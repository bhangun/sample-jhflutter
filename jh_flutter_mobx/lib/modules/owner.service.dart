import 'dart:async';
import 'dart:convert';
import 'owner.dart';
import '../services/network/connection.dart';


// GET getAllOwners
// POST createOwner
// PUT updateOwner
const API_OWNERS = "owners";

// GET getOwner
// DELETE deleteOwner
const API_OWNER = "owners/";

//
Future<Owner> owner(String id) async {
  var response = await restGet(API_OWNER + id,true,false);
  return Owner.fromJson(json.decode(response));
}


//
Future<Owner> owners() async {
  print("get owners");
  return await restGet(API_OWNER,true,false);
}

//
createOwner(Owner owner) async {
  print("create");
  return await restPost(API_OWNER, owner.toJson().toString(),true);
}

//
updateOwner(Owner owner) async {
  print("update");
  return await restPut(API_OWNER, owner.toJson().toString(),true);
}


//
deleteOwner(Owner owner) async {
  return await restDelete(API_OWNER + owner.toJson().toString());
}


List<Owner> ownersData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<Owner> lu= parsed.map<Owner>((json) => Owner.fromJson(json)).toList();
  return lu;
}

