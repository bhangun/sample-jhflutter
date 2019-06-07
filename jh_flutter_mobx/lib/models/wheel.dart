
import 'dart:convert';
import 'car.dart';

class Wheel {
    final int id;
    final String position;
    final String brand;
    final List<Car> cars;
    const Wheel ({ 
        this.id,
        this.position,
        this.brand, 
        this.cars,
    });

    factory Wheel.fromJson(Map<String, dynamic> json) =>  Wheel(
        id: json['id'],
        position: json['position'],
        brand: json['brand'],
        cars: List<Car>.from(json['car'].map((x) => Car.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "position": position, 
        "brand": brand, 
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
    };
}


List<Wheel> wheelFromJson(String str) => new List<Wheel>.from(json.decode(str).map((x) => Wheel.fromJson(x)));

String wheelToJson(List<Wheel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
