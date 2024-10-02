import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            LocalStorage localStorage = LocalStorage();

            localStorage.clearValue('token').then((val){
              localStorage.clearValue('isLogin').then((val){
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('HAHAHA'),
      ),
    );
  }
}
