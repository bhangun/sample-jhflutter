import 'dart:io';
import 'dart:convert';
import 'package:jh_flutter_sample/models/metrics.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {

  test('parse json', () async {

     String s= await new File('test/data_metrics.json').readAsString();
 Map<String, dynamic> j = json.decode(s);

     Counters c=Counters.fromJson(j['counters']);
expect(1, c.count);

      Gauges ga=Gauges.fromJson(j['gauges']);
   expect(15,ga.jvmWaitingCount);
   
    Histograms h=Histograms.fromJson(j['histograms']);
   expect(19,h.connection.count);

Timers t=Timers.fromJson(j['timers']);
   expect(t.wait.count,6);

 Meters m=Meters.fromJson(j['meters']);
   expect(0,m.connTimeoutRate.count);

   Health he=Health.fromJson(j);
   expect(he.gauges.jvmWaitingCount,15);
   expect(1, he.counters.count);
   expect(he.histograms.connection.count,19);
   expect(he.timers.wait.count,6);
   expect(0,he.meters.connTimeoutRate.count);

  
  });

  test('parse json text', () async {

    //Health health = await h.health();

var response =  await http.get('http://localhost:8080/management/metrics',
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU0MTczMDUzNX0.aw3Wu0TpviNO_P9nFTt-uWraxEGpk66uNPvQI8KF3WpL_giIhU8BkIT52RYuhQdg0_whQM8Op3lxPV0ONaxJ6w"});

Health health=Health.fromJson(json.decode(response.body));
    

   expect(health.gauges.activeConn,0);
  });
}


