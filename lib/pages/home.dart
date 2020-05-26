import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
  data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  //print(data['allstatedata']);
  List<dynamic> allstatedata = data['allstatedata'];
  //print(allstatedata);

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 India'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        color: Colors.grey[850],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(data['lastupdatedtime'],
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 20, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Confirmed',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.redAccent[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('[+'+data['dconfirm']+']',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Text(data['total'],
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.redAccent[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Active',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueAccent[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 35),
                          Text(data['active'],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blueAccent[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Recovered',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.greenAccent[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('[+'+data['drecover'].toString()+']',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Text(data['recovered'],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.greenAccent[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Deceased',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('[+'+data['ddeaths'].toString()+']',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Text(data['death'],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,10,0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text('Compiled from State Govt. numbers',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      dividerThickness: 5,
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('State/UT',
                          style: TextStyle(color: Colors.grey[100]),
                          textScaleFactor: 1.5,),
                        ),
                        DataColumn(
                          label: Text('Confirmed',
                            style: TextStyle(color: Colors.grey[100]),
                            textScaleFactor: 1.5,),
                        ),
                        DataColumn(
                          label: Text('Active',
                            style: TextStyle(color: Colors.grey[100]),
                            textScaleFactor: 1.5,),
                        ),
                        DataColumn(
                          label: Text('Recovered',
                            style: TextStyle(color: Colors.grey[100]),
                            textScaleFactor: 1.5,),
                        ),
                        DataColumn(
                          label: Text('Deceased',
                            style: TextStyle(color: Colors.grey[100]),
                            textScaleFactor: 1.5,),
                        ),
                      ],
                      rows: allstatedata.map((state) => DataRow(
                          cells: [
                            DataCell(
                                Text(state['state'],
                                style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),
                                )
                            ),
                            DataCell(
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      child: Text('+'+state['deltaconfirmed'],
                                        style: TextStyle(color: Colors.red,),
                                      ),
                                    ),
                                    Text(state['confirmed'],
                                      style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                            ),
                            DataCell(
                              Text(state['active'],
                                style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataCell(
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Text('+'+state['deltarecovered'],
                                      style: TextStyle(color: Colors.green,),
                                    ),
                                  ),
                                  Text(state['recovered'],
                                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Text('+'+state['deltadeaths'],
                                      style: TextStyle(color: Colors.grey,),
                                    ),
                                  ),
                                  Text(state['deaths'],
                                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      )).toList(),
                    ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
