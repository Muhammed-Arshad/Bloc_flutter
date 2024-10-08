import 'package:bloc_flutter/bloc/login_blocs/login_bloc.dart';
import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/main.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:bloc_flutter/utils/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (c, p) => c.email != p.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'email', border: OutlineInputBorder()),
                      onChanged: (val) {
                        context.read<LoginBloc>().add(EmailChanged(email: val));
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {},
                    );
                  },
                ),
                SizedBox(height: 20,),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (c, p) => c.password != p.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      focusNode: passwordFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'password', border: OutlineInputBorder()),
                      onChanged: (val) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: val));
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {},
                    );
                  },
                ),
                SizedBox(height: 50,),
                BlocListener<LoginBloc, LoginState>(
                  listenWhen: (c,p)=> c.postApiStatus != p.postApiStatus,
                  listener: (context, state) {
                    if(state.postApiStatus == PostApiStatus.error){
                      FlushbarHelper.flushBarErrorMessage(state.message.toString(), context);
                    }

                    if(state.postApiStatus == PostApiStatus.success){
                      Navigator.pushNamed(context, RoutesName.homeScreen);
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (c, p) => false,
                    builder: (context, state) {
                      return ElevatedButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginApi());
                        }
                      }, child: Text('Login'));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
