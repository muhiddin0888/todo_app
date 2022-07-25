import 'package:flutter/material.dart';
import 'package:my_todo_app/utils/colors.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Back_ground_121212,
      appBar: AppBar(
        backgroundColor: MyColors.Back_ground_121212,
        title: Text(
          "Basket screen",
        ),
      ),
      body: Column(
        children: [Text("Under development")],
      ),
    );
  }
}
