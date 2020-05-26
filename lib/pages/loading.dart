import 'package:flutter/material.dart';
import 'package:covid19trackerindia/services/countryresponse.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setdata() async{
  CountryResponse instance = CountryResponse();
  await instance.getCovidData();
  Navigator.pushReplacementNamed(context, '/home' , arguments: {
    'statename': instance.statename,
    'total': instance.total,
    'active': instance.active,
    'death': instance.death,
    'recovered': instance.recovered,
    'dconfirm': instance.dconfirm,
    'drecover': instance.drecover,
    'ddeaths': instance.ddeaths,
    'lastupdatedtime': instance.lastupdatetime,
    'allstatedata': instance.allstatedata,
  });
}

@override
  void initState() {
    super.initState();
    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        )
    );
  }
}
