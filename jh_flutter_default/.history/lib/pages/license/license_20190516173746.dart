
import 'package:flutter/foundation.dart';

class License {
    final int id;
    final int no;
    final Area area;
    
    const License ({ 
        this.id,
        this.no,
        this.area,
    }): assert(id != null),
    assert(no != null), 
    assert(area != null);

    factory License.fromJson(Map<String, dynamic> json) {
        return License(
            id: json['id'],no: json['no'],area: json['area'],
        );
    }

    Map<String, dynamic> toJson() => {
        '"id"': '"$id"','"no"': '"$no"','"area"': '"$area"',};
}


const area = {'JABAR', 'JAKARTA', 'JATIM'};

/* enum Area {
    JABAR,
    JAKARTA,
    JATIM
} */
