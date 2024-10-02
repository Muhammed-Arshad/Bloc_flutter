import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/repository/auth/login_repository.dart';
import 'package:bloc_flutter/services/session_manager/session_controller.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {

    Map data = {"email":state.email, "password":state.password};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((val) async {

      if(val.error.isNotEmpty){
        emit(state.copyWith(message: val.error.toString(),postApiStatus: PostApiStatus.error));

      }else{

        await SessionController().saveUserInPreference(val);
        await SessionController().getUserFromPreference();

        emit(state.copyWith(message: 'login success',postApiStatus: PostApiStatus.success));
      }

    }).onError((e,s){
      emit(state.copyWith(message: e.toString(),postApiStatus: PostApiStatus.error));
    });

  }
}
