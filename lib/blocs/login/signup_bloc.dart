import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/user_model.dart';

enum SignUpState {IDLE, LOADING, ERROR}

class SignUpBlocState {

  SignUpBlocState(this.state, {this.errorMessage});

  SignUpState state;
  String errorMessage;
}

class SignUpBloc{

  final BehaviorSubject<SignUpBlocState> _stateController = BehaviorSubject<SignUpBlocState>.seeded(SignUpBlocState(SignUpState.IDLE));

  Stream<SignUpBlocState> get outState => _stateController.stream;

  UserModel userModel = UserModel();

  void setName(String name){
    userModel.name = name;
  }

  void setEmail(String email){
    userModel.email = email.toLowerCase();
  }

  void setPassword(String password){
    userModel.name = password;
  }

  void signUp() async{
    _stateController.add(SignUpBlocState(SignUpState.LOADING));

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(SignUpBlocState(SignUpState.IDLE));
  }


  void dispose(){
    _stateController.close();
  }

}