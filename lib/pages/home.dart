import 'package:flutter/material.dart';
import '../services/helper.dart' as helper;


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState(){
    helper.isRole(helper.ADMIN).then((v)=> isAdmin);
  }

  int _counter = 0;

  
  var isAdmin = false;
  void _incrementCounter() {

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(

        title: new Text("Bismillah"),
      ),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.account_balance,
                      color: Colors.red[500],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.motorcycle,
                      color: Colors.red[200],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.access_alarm,
                      color: Colors.red[200],
                      size: 40.0,
                    ),
                    onPressed: ()=> print('bismillah'),
                  ),
                  OutlineButton(
                      color: Colors.amber,
                      child:  Text("Button " + isAdmin.toString()),textColor: Colors.blue,
                      onPressed: ()=> print('tombol'),
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                  Container(
                    /*decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(25.0),
              border: new Border.all(
                width: 5.0,
                color: Colors.red,
              )
            ),*/
                    margin: const EdgeInsets.all(0.0),
                    color: const Color(0xFF00FF00),
                    width: 48.0,
                    height: 48.0,
                  ),
                ]
            ),
            new Container(
              margin: const EdgeInsets.all(10.0),
              color: const Color(0xFF00FF00),
              width: 48.0,
              height: 48.0,
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      /*floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}