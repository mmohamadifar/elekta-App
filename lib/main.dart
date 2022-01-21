// import 'dart:html';
// import 'dart:ui';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Database db = await openDatabase('assets/Items.db',1,)


  List<Card> mylist = [];
  void d() {
    print("dd");
  }

  Map<String, String> m = {"1": "One", "2": "Two"};

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Elekta"),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                // constraints: BoxConstraints.expand(),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Elekta.png'),
                      fit: BoxFit.cover,
                      opacity: 0.2),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (String s) {
                        setState(
                          () {
                            mylist=[];
                            mylist.add(
                              Card(
                                child: ListTile(
                                  title: Text(db.query()),
                                ),
                              ),
                            );
                            mylist = List.from(mylist);
                          },
                        );
                      },
                      // obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search Item number or name'),
                    ),
                    Expanded(
                      child: ListView(children: mylist),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text('mkhi654645'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
