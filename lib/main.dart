// import 'dart:async';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

import 'package:flutter/material.dart';

import 'models/Activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    List<Activity> activitys = <Activity>[
      Activity(1, 'Mes Projets', Colors.indigo, DateTime.now()),
      Activity(2, 'Séquence de DEV', Colors.red, DateTime.now()),
      Activity(3, 'Management', Colors.blue, DateTime.now()),
      Activity(4, 'Révisions', Colors.purple, DateTime.now()),
    ];

  @override
  Widget build(BuildContext context) {
//     final Future<Database> database = openDatabase(
//   // Set the path to the database. Note: Using the `join` function from the
//   // `path` package is best practice to ensure the path is correctly
//   // constructed for each platform.
//   join(await getDatabasesPath(), 'doggie_database.db'),
// );

    return MaterialApp(
      title: 'TimeLess',
      theme: ThemeData(
        primaryColor: Color(0xFF357376),
        accentColor: Color(0xFF357376),
        primaryColorDark: Color(0xFF1D4D4F),
        primaryColorLight: Color(0xFF6BA8A9),
        backgroundColor: Color(0xFFE5DFDF),
        splashColor: Color(0xFF275F62),
        canvasColor: Colors.transparent,
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFE5DFDF),
        appBar: AppBar(
          title: Text('TimeLess'),
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            itemCount: activitys.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Je suis une date',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: activitys[index].color,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 4,
                                        offset: Offset(0, 2)),
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 4,
                                        offset: Offset(0, 0)),
                                  ],
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  activitys[index].name,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                // color: activitys[index].color,
                // child: Center(child: Text(activitys[index].name)),
              );
            }),
        floatingActionButton: CreateActivityButton(),
      ),
    );
  }
}

class CreateActivityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
                child: Container(
                  height: 800.0,
                  width: double.infinity,
                  color: Color(0xFF357376),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          // autofocus: true,
                          maxLength: 50,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            enabled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            counterStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF1D4D4F), width: 2.0)),
                            hintText:
                                'Comment voulez vous appeler votre programme ?',
                            labelText: 'Nom de votre programme',
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            InkResponse(
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFA62ADB),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2.0)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Icon(Icons.add),
    );
  }
}