import 'package:flutter/material.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/widget/social_media_button.dart';
import 'package:my_todo_app/presentation/login/register_screen/register_screen.dart';
import 'package:my_todo_app/presentation/tabs/tab_box/tab_box.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/icons.dart';
import 'package:my_todo_app/utils/utility_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String savedUsername = '';
  String savedPassword = '';
  bool _passwordVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getInitials();
    _passwordVisible = false;
    super.initState();
  }

  void getInitials() {
    savedPassword = StorageRepository.getString("password");
    savedUsername = StorageRepository.getString("username");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.Back_ground_121212,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: MyColors.Back_ground_121212,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: MyColors.white),
              ),
              const SizedBox(
                height: 46,
              ),
              const Text(
                "Username",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 24,
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: MyColors.textFild),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: "Enter your Username",
                      hintStyle: const TextStyle(color: MyColors.textFild)),
                  controller: usernameController,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 24,
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: MyColors.textFild),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: "◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ",
                    hintStyle: const TextStyle(color: MyColors.textFild),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  controller: passwordController,
                ),
              ),
              const SizedBox(
                height: 59,
              ),
              Container(
                width: 345,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MyColors.button),
                child: TextButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if (username.length > 3 && password.length > 6) {
                      if (username == savedUsername &&
                          password == savedPassword) {
                        await StorageRepository.putBool("is_logged", true);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const TabBox();
                        }));
                      } else {
                        UtilityFunctions.getMyToast(
                          message: "Login password wrong\nRegister first",
                        );
                      }
                    } else {
                      UtilityFunctions.getMyToast(
                          message: "Login va parol xato kiritilgan");
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 0.5,
                      color: MyColors.textFild,
                    )),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "or",
                    style: TextStyle(color: MyColors.textFild, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: MyColors.textFild)),
                  ),
                ],
              ),
              const SizedBox(
                height: 29,
              ),
              const SocialMediaButton(
                  icon: MyIcons.google, titel: "Login with Google"),
              const SizedBox(
                height: 15,
              ),
              const SocialMediaButton(
                  icon: MyIcons.apple, titel: "Login with Appe"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: MyColors.textFild),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const RegisterScreen();
                        }));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MyColors.white),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
