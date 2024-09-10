import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterenetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InterenetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
        Icon(Icons.cloud_off,color: Colors.red,size:
          50,),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              "We are unable to show the result,\nPlease check your internet\nconnection",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        ElevatedButton(onPressed: onPress, child: Text("RETRY"))
      ],
    );
  }
}
