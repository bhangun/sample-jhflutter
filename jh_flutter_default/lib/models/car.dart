
import 'dart:convert';
import 'owner.dart';

class Car {
    final int id;
    final String name;
    final List<Owner> owners; 
    
    const Car ({  
        this.id, 
        this.name,
        this.owners, 
    });

    factory Car.fromJson(Map<String, dynamic> json) =>  Car(
        id: json['id'],
        name: json['name'],
        owners: List<Owner>.from(json['owners'].map((x) => Owner.fromJson(x))), 
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())), 
    };
}


List<Car> carFromJson(String str) => new List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String carToJson(List<Car> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
