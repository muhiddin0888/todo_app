import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_todo_app/utils/colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.icon, required this.titel});
  final String icon;
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: MyColors.button),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              titel,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
