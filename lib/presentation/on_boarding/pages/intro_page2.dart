import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_todo_app/utils/colors.dart';

class IntorPage2 extends StatelessWidget {
  const IntorPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Back_ground_121212,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Image.asset("assets/images/intro2.png"),
          Lottie.asset("assets/lottie/intor2.json", width: 300),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Create daily routine",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: MyColors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "In Uptodo  you can create your\n personalized routine to stay productive",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: MyColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
