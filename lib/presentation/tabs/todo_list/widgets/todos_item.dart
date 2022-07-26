import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/models/category_model.dart';
import 'package:my_todo_app/models/todo_model.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/styles.dart';

class TodosItem extends StatelessWidget {
  const TodosItem({
    Key? key,
    required this.toDo,
    required this.category,
    required this.isDone,
    required this.onTap,
  }) : super(key: key);

  final TodoModel toDo;
  final CategoryModel category;
  final VoidCallback onTap;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: MyColors.todoColor,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade100,
        //     spreadRadius: 5,
        //     blurRadius: 5,
        //     offset: const Offset(1, 3),
        //   ),
        //],
      ),
      child: Container(
        height: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  toDo.todoTitle,
                  style: MyTextStyle.interSemiBold600.copyWith(
                    fontSize: 20,
                    color: MyColors.white,
                  ),
                ),
                const Expanded(child: SizedBox()),
                ...List.generate(
                  toDo.urgentLevel,
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
                ...List.generate(
                  5 - toDo.urgentLevel,
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Description:",
                    style: TextStyle(
                        color: MyColors.white, fontWeight: FontWeight.w700)),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    toDo.todoDescription,
                    style: MyTextStyle.interRegular400
                        .copyWith(fontSize: 14, color: MyColors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Category:",
                        style: TextStyle(
                            color: MyColors.white,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      category.categoryName,
                      style: TextStyle(color: MyColors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(category.iconPath),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Deadline:  ",
                      style: TextStyle(
                          color: MyColors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                        DateFormat("yy-MM-dd")
                            .format(DateTime.parse(toDo.dateTime)),
                        style: TextStyle(color: MyColors.white)),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            TextButton(
              onPressed: onTap,
              child: Row(
                children: [
                  const Text("Done:", style: TextStyle(color: MyColors.white)),
                  Checkbox(value: isDone, onChanged: (v) {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
