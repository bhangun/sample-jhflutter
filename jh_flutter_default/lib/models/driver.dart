
import 'dart:convert';
import 'license.dart';
import 'car.dart';
import 'owner.dart';

class Driver {
    final int id;
    final String name;
    final List<License> licenses; 
    final List<Car> cars; 
    final List<Owner> owners; 
    
    const Driver ({  
        this.id, 
        this.name,
        this.licenses,
        this.cars,
        this.owners, 
    });

    factory Driver.fromJson(Map<String, dynamic> json) =>  Driver(
        id: json['id'],
        name: json['name'],
        licenses: List<License>.from(json['licenses'].map((x) => License.fromJson(x))), 
        cars: List<Car>.from(json['cars'].map((x) => Car.fromJson(x))), 
        owners: List<Owner>.from(json['owners'].map((x) => Owner.fromJson(x))), 
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "licenses": List<dynamic>.from(licenses.map((x) => x.toJson())), 
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())), 
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())), 
    };
}


List<Driver> driverFromJson(String str) => new List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String driverToJson(List<Driver> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
