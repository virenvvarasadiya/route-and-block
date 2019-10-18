import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route/main.dart';

class routeGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    final args = settings.arguments;
    
    switch(settings.name){

      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage() );

      case '/second':
        if(args is String){
          return MaterialPageRoute(builder: (_)=> SecondPage(
            name: args,
          ));
        }
        return _errorRought();

      default:
          return _errorRought();
    }

  }

  static Route<dynamic> _errorRought(){

    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Container(
              child: Center(
                child: Text("Error Message"),
              ),
            ),
          );
        }
    );

  }
}

class SecondPage extends StatefulWidget {

  final String name ;

  SecondPage({this.name});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("second Page"),
        ),
      ),
    );
  }
}
