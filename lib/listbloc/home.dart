import 'package:flutter/material.dart';

import 'employee.dart';
import 'listbloc.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ListBloc _listBloc = ListBloc();

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Bloc"),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _listBloc.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, int index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Text(
                          snapshot.data[index].id.toString(),
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              snapshot.data[index].name.toString(),
                              style: TextStyle(
                                fontSize: 18.0
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              snapshot.data[index].salary.toString(),
                              style: TextStyle(
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: (){
                            _listBloc.employeeSalaryIncrementStream.add(snapshot.data[index]);
                          }
                      ),
                      IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: (){
                            _listBloc.employeeSalaryDecrementStream.add(snapshot.data[index]);
                          }
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
