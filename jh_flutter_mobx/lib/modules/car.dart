

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
        owners: List<Owner>.from(json['owner'].map((x) => Owner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "name": name, 
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
    };
}

