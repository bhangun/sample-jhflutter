

import 'driver.dart';

class Owner {
    final int id;
    final String name;
    final List<Driver> drivers;
    
    const Owner ({ 
        this.id,
        this.name, 
        this.drivers,
    });

    factory Owner.fromJson(Map<String, dynamic> json) =>  Owner(
        id: json['id'],
        name: json['name'],
        drivers: List<Driver>.from(json['driver'].map((x) => Driver.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "name": name, 
        "drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
    };
}

