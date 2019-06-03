


import 'dart:io';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:jh_flutter_sample/pages/owner/owner.dart';
// import 'package:jh_flutter_sample/pages/owner/owner.helper.dart';
import 'package:jh_flutter_sample/services/services.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Json', () {
    test('coba', () async {
      final file = new File('test/owner_data.json');
      //print(await file.readAsString());
      final js = json.decode(await file.readAsString());
      Owner ow = Owner.fromJson(js);
      //print(ow.cars[0].name);
        //expect(0,ow.id);
         expect('string',ow.name);
      //expect(Counter().value, 0);
    });

    test('rest', () async {
    //login('admin','admin',false);

    const token ='eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU1ODU5NDQzNn0.C3TMuce5jKjl1kLAq0zpEUiXOsdd4LYIFtwvOdEIaCtIF1uHTbYy_4EWoDYiwQ9fOPCKmhfkYQr5ja9hYCIiwQ';
     final response = await http.get( 'http://localhost:8080/api/owners/2', headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    "Authorization": "Bearer $token "});
print(response.body);
      Owner ow = Owner.fromJson(json.decode(response.body));
      //print(ow.cars[0].name);
        //expect(0,ow.id);
         expect('string',ow.name);
      //expect(Counter().value, 0);
    });
  });
}