
import 'dart:convert';

class Owner {
    final int id;
    final String name;
    
    const Owner ({ 
        this.id,
        this.name, 
    });

    factory Owner.fromJson(Map<String, dynamic> json) =>  Owner(
        id: json['id'],
        name: json['name'],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "name": name, 
        
    };
}


List<Owner> ownerFromJson(String str) => new List<Owner>.from(json.decode(str).map((x) => Owner.fromJson(x)));

String ownerToJson(List<Owner> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
