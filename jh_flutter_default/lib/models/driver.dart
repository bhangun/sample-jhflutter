

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
}

