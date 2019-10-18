import 'dart:async';
import 'package:route/block/validator.dart';
import 'package:rxdart/rxdart.dart';

class Block extends Object with Validator implements BlockParent{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //listen email and password
  Function(String) get email => _emailController.sink.add ;
  Function(String) get password => _passwordController.sink.add ;

  //return data
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordvalidator);

  Stream<bool> get  submitcheck => Observable.combineLatest2(emailStream, passwordStream, (e,p)=>true);


  @override
  void dispose() {
    _passwordController?.close();
    _emailController?.close();
  }

}

abstract class BlockParent{
  void dispose();
}