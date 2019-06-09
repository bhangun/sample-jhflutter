
import 'dart:convert';
import 'owner.dart';

class Driver {
    final int id;
    final String name;
    final List<Owner> owners;
    const Driver ({ 
        this.id,
        this.name, 
        this.owners,
    });

    factory Driver.fromJson(Map<String, dynamic> json) =>  Driver(
        id: json['id'],
        name: json['name'],
        owners: List<Owner>.from(json['owner'].map((x) => Owner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "name": name, 
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
    };

    List<Driver> driverFromJson(String str) => new List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

    String driverToJson(List<Driver> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

}


