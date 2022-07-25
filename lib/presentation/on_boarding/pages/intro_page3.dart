import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_todo_app/utils/colors.dart';

class IntorPage3 extends StatelessWidget {
  const IntorPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Back_ground_121212,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Image.asset("assets/images/intro3.png"),
          Lottie.asset("assets/lottie/intro3.json", width: 300),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Orgonaize your tasks",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: MyColors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "You can organize your daily tasks by\n adding your tasks into separate categories",
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
