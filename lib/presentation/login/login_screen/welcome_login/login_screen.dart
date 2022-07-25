import 'package:flutter/material.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/login_screen.dart';
import 'package:my_todo_app/presentation/login/register_screen/register_screen.dart';
import 'package:my_todo_app/utils/colors.dart';

class WelcomLoginScreen extends StatefulWidget {
  const WelcomLoginScreen({Key? key}) : super(key: key);

  @override
  State<WelcomLoginScreen> createState() => _WelcomLoginScreenState();
}

class _WelcomLoginScreenState extends State<WelcomLoginScreen> {
  String savedUsername = '';
  String savedPassword = '';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() {
    savedPassword = StorageRepository.getString("password");
    savedUsername = StorageRepository.getString("username");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Back_ground_121212,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to UpTodo",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: MyColors.white),
              ),
              const SizedBox(
                height: 42,
              ),
              const Text(
                "Please login to your account or create\n new account to continue",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 370,
              ),
              //Login button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 345,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: MyColors.button),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Registr button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const RegisterScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 345,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MyColors.button),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Rigister",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
