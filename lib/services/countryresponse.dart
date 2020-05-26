import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CountryResponse{

  String statename,total,active,death,recovered,dconfirm,drecover,ddeaths,lastupdatetime;
  List<dynamic> allstatedata;
  Future<void> getCovidData() async {
      Response response =  await get('https://api.covid19india.org/data.json');
      Map data = jsonDecode(response.body);
      var statedata = data['statewise'][0];
      allstatedata = data['statewise'];
      var d1=allstatedata[0];
      allstatedata.removeAt(0);
      allstatedata.add(d1);
      statename = statedata['state'];
      total = statedata['confirmed'];
      active = statedata['active'];
      death = statedata['deaths'];
      recovered = statedata['recovered'];
      dconfirm = statedata['deltaconfirmed'];
      drecover = statedata['deltarecovered'];
      ddeaths = statedata['deltadeaths'];
      lastupdatetime = statedata['lastupdatedtime'];
  }

}