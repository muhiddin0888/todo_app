import 'package:flutter/material.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/login_screen.dart';
import 'package:my_todo_app/presentation/login/login_screen/widget/social_media_button.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/icons.dart';
import 'package:my_todo_app/utils/utility_functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool _passwordVisible = false;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();

    usernameController.dispose();
    passwordController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.Back_ground_121212,
      appBar: AppBar(
        backgroundColor: MyColors.Back_ground_121212,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LoginScreen();
            }));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: MyColors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 24,
                  ),
                  child: TextField(
                    onSubmitted: ((value) {
                      UtilityFunctions.fieldFocusChange(
                          context, focusNode1, focusNode2);
                    }),
                    focusNode: focusNode1,
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: MyColors.textFild),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        hintText: "Enter your Username",
                        hintStyle: const TextStyle(color: MyColors.textFild)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 24,
                  ),
                  child: TextField(
                    obscureText: !_passwordVisible,
                    onSubmitted: ((value) {
                      UtilityFunctions.fieldFocusChange(
                          context, focusNode2, focusNode3);
                    }),
                    focusNode: focusNode2,
                    controller: passwordController,
                    style:
                        const TextStyle(color: Colors.white, letterSpacing: 8),
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: MyColors.textFild),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      hintText: "◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ",
                      hintStyle: const TextStyle(
                          color: MyColors.textFild, letterSpacing: 0),
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 24,
                  ),
                  child: TextField(
                    obscureText: !_passwordVisible,
                    onSubmitted: ((value) {
                      focusNode3.unfocus();
                    }),
                    focusNode: focusNode3,
                    controller: ageController,
                    style:
                        const TextStyle(color: Colors.white, letterSpacing: 9),
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: MyColors.textFild),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      hintText: "◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ◉ ",
                      hintStyle: const TextStyle(
                          color: MyColors.textFild, letterSpacing: 0),
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
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 345,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: MyColors.button),
                  child: TextButton(
                    onPressed: () async {
                      if (usernameController.text.trim().length > 3 &&
                          passwordController.text.trim().length > 6 &&
                          ageController.text.isNotEmpty) {
                        await StorageRepository.putString(
                            key: "username", value: usernameController.text);
                        await StorageRepository.putString(
                            key: "password", value: passwordController.text);
                        await StorageRepository.putString(
                            key: "age", value: ageController.text);
                      }
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                  height: 25,
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
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textFild),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const LoginScreen();
                          }));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: MyColors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
