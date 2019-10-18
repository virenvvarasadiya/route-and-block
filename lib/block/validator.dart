import 'dart:async';

mixin Validator{
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
     handleData: (data,sink){
        if(data.contains('@')){
          sink.add(data);
        }else{
          sink.addError('Please enter correct email.');
        }
     }
  );

  var passwordvalidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (data,sink){
      if(data.length>4){
        sink.add(data);
      }else{
        sink.addError('password must be longer than 5 characters.');
      }
    }
  );
}