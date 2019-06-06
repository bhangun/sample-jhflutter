
import 'dart:convert';

class License {
    final int id;
    final int no;
    final String area;
    
    const License ({ 
        this.id,
        this.no,
        this.area, 
    });

    factory License.fromJson(Map<String, dynamic> json) =>  License(
        id: json['id'],
        no: json['no'],
        area: json['area'],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "no": no, 
        "area": area, 
        
    };
}

const area = {
    'JABAR',
    'JAKARTA',
    'JATIM'
};

List<License> licenseFromJson(String str) => new List<License>.from(json.decode(str).map((x) => License.fromJson(x)));

String licenseToJson(List<License> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
