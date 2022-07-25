import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/login_screen.dart';
import 'package:my_todo_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:my_todo_app/presentation/tabs/tab_box/tab_box.dart';
import 'package:my_todo_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogged = false;
  bool isInitial = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await StorageRepository.getInstance();
    isLogged = StorageRepository.getBool("is_logged");
    isInitial = StorageRepository.getBool("is_initial");

    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext con) {
      return isLogged
          ? const TabBox()
          : isInitial == true
              ? const LoginScreen()
              : const OnBoardingScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Back_ground_121212,
      body: Center(
        child: Lottie.asset("assets/lottie/spalsh.json"),
      ),
    );
  }
}
