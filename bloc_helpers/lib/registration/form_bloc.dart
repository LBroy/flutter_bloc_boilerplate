import 'package:bloc_helpers/bloc_helpers/bloc_base.dart';
import 'package:bloc_helpers/registration/bloc_email_validator.dart';
import 'package:bloc_helpers/registration/bloc_password_validator.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc extends Object
    with EmailValidator, PasswordValidator
    implements BlocBase {
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordConfirmController =
      BehaviorSubject<String>();

  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Function(String) get onPasswordConfirmChanged =>
      _passwordConfirmController.sink.add;

  Stream<String> get email => _emailController.transform(validateEmail);
  Stream<String> get password => _passwordController.transform(validateEmail);
  Stream<String> get confirmPassword =>
      _passwordConfirmController.transform(validateEmail).doOnData((String c) {
        if (0 != _passwordController.value.compareTo(c)) {
          _passwordConfirmController.addError("no match password");
        }
      });
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
