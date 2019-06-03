
/*
import 'package:jh_flutter_sample/pages/car/car.dart';


class Owner {
    final int id;
    final String name;
    final List<Car> cars;
    
    const Owner ({ 
        this.id,
        this.name,
        this.cars
    }): assert(id != null),
    assert(name != null),assert( cars != null);

    factory Owner.fromJson(Map<String, dynamic> json) {
      print('${json['name']} ${json['cars']}');
        return Owner(
            id: json['id'],name: json['name'],cars: json['cars'].map((model)=> Car.fromJson(model)).toList(),
        );
    }

    Map<String, dynamic> toJson() => {
        '"id"': '"$id"','"name"': '"$name"','"cars"': '"$cars"',};
}



 factory Owner.fromJson(Map<String, dynamic> js) {
      print('${js['id']}---${js['name']}');
        return Owner(
            id: js['id'],name: js['name'],cars: (js['cars'] as List).map((model)=> Car.fromJson(model)).toList(),
        );
    }

*/

    // To parse this JSON data, do
//
//     final owner = ownerFromJson(jsonString);

import 'dart:convert';

List<Owner> ownerFromJson(String str) => new List<Owner>.from(json.decode(str).map((x) => Owner.fromJson(x)));

String ownerToJson(List<Owner> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Owner {
    List<Car> cars;
    int id;
    String name;

    Owner({
        this.cars,
        this.id,
        this.name,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => new Owner(
        cars: new List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "cars": new List<dynamic>.from(cars.map((x) => x.toJson())),
        "id": id,
        "name": name,
    };


    /* factory Owner.fromJson(Map<String, dynamic> json) {
      print('${json['name']} ${json['cars']}');
        return Owner(
            id: json['id'],name: json['name'],cars: json['cars'].map((model)=> Car.fromJson(model)).toList(),
        );
    }

    Map<String, dynamic> toJson() => {
        '"id"': '"$id"','"name"': '"$name"','"cars"': '"$cars"',}; */
}


class Car {
    int id;
    String name;
    Owner owner;
    List<Wheel> wheels;

    Car({
        this.id,
        this.name,
        this.owner,
        this.wheels,
    });

    factory Car.fromJson(Map<String, dynamic> json) => new Car(
        id: json["id"],
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        wheels: new List<Wheel>.from(json["wheels"].map((x) => Wheel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner.toJson(),
        "wheels": new List<dynamic>.from(wheels.map((x) => x.toJson())),
    };
}

class Wheel {
    String brand;
    Car car;
    int id;
    String position;

    Wheel({
        this.brand,
        this.car,
        this.id,
        this.position,
    });

    factory Wheel.fromJson(Map<String, dynamic> json) => new Wheel(
        brand: json["brand"],
        car: Car.fromJson(json["car"]),
        id: json["id"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "brand": brand,
        "car": car.toJson(),
        "id": id,
        "position": position,
    };
}
