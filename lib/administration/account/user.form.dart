import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
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
                      child: new Text("Button"),textColor: Colors.blue,
                      onPressed: ()=> print('tombol'),
                      shape: new RoundedRectangleBorder(
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
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}