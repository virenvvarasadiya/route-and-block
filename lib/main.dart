import 'package:flutter/material.dart';
import 'block/block.dart';
import 'route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: routeGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var block = Block();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StreamBuilder(
                stream: block.emailStream,
                builder: (context, snapshot) => TextFormField(
                    onChanged: block.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: snapshot.error,
                      border: OutlineInputBorder(),
                      hintText: "Enter email",
                      labelText: "Email",
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder(
                stream: block.passwordStream,
                builder: (context, snapshot) => TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: block.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: snapshot.error,
                    border: OutlineInputBorder(),
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
              ),
              StreamBuilder(
                stream: block.submitcheck,
                builder: (context, snapshot) => RaisedButton(
                    child: Text("press"),
                    onPressed: snapshot.hasData
                        ? () {
                            Navigator.of(context)
                                .pushNamed('/second', arguments: 'string');
                          }
                        : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
