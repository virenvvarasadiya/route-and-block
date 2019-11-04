import 'dart:async';

import 'employee.dart';

class ListBloc {
  
  final List<Employee> _employeeList = <Employee>[
    Employee(1,'viren',500000.0),
    Employee(2,'akash',200000.0),
    Employee(3,'ksk',300000.0),
    Employee(4,'mitul',400000.0),
    Employee(5,'kikani',500000.0),
    
  ];
  
  final _employeeListController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementController = StreamController<Employee>();
  final _employeeSalaryDecrementController = StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream =>
      _employeeListController.stream;

  StreamSink<Employee> get employeeSalaryIncrementStream =>
      _employeeSalaryIncrementController.sink;

  StreamSink<Employee> get employeeSalaryDecrementStream =>
      _employeeSalaryDecrementController.sink;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListController.sink;

  ListBloc(){
    _employeeListController.add(_employeeList);
    _employeeSalaryIncrementController.stream.listen(increment);
    _employeeSalaryDecrementController.stream.listen(decrement);

  }

  increment(Employee _employee){
    _employee.salary = _employee.salary + _employee.salary*0.2;
    _employeeListController.add(_employeeList);
  }

  decrement (Employee _employee){
    _employee.salary = _employee.salary - _employee.salary*0.2;
    _employeeListController.add(_employeeList);
  }

  void dispose(){
    _employeeListController?.close();
    _employeeSalaryIncrementController?.close();
    _employeeSalaryDecrementController?.close();
  }

}
