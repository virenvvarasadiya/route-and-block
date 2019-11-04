import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class Model with ChangeNotifier{
  int _id = 0;
  String _name = 'hello';

//  Model([this._name,this._id]);

  String get name {
      return _name;
  }
  int get id{
      return _id;
  }

  set name(name){
    this._name = name;
    notifyListeners();
  }

  set id(no){
    _id = _id + no;
    notifyListeners();
  }
  
}

class ProviderHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<Model>(
          builder: (context) => Model()),
        ],
        child: Column(
          children: <Widget>[
            IncreamentNumber(),
          ],
        )
      ),
    );
  }
}


class IncreamentNumber extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final _id = Provider.of<Model>(context);

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<Model>(
            builder: (context,object,_){
              return Text(object.id.toString());
            },
          ),
          Text(_id.id.toString()),
          RaisedButton(
            child: Text("hello"),
            onPressed: (){
              _id.id = 5;
            },
          )
        ],
      ),
    );
  }
}
