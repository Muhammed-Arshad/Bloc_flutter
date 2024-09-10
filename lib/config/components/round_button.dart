import 'package:bloc_flutter/config/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundButton({super.key, required this.title,
    required this.onPress,
    required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
