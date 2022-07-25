import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app/data/my_repository.dart';
import 'package:my_todo_app/global_widgets/my_custom_button.dart';
import 'package:my_todo_app/models/category_model.dart';
import 'package:my_todo_app/models/todo_model.dart';
import 'package:my_todo_app/presentation/tabs/basket/basket_screen.dart';
import 'package:my_todo_app/presentation/tabs/done_list/done_list_screen.dart';
import 'package:my_todo_app/presentation/tabs/profile/profile_screen.dart';
import 'package:my_todo_app/presentation/tabs/todo_list/todo_list_screen.dart';
import 'package:my_todo_app/presentation/tabs/todo_list/widgets/category_item.dart';
import 'package:my_todo_app/presentation/tabs/todo_list/widgets/modal_top_view.dart';
import 'package:my_todo_app/presentation/tabs/todo_list/widgets/select_date_item.dart';
import 'package:my_todo_app/presentation/tabs/todo_list/widgets/select_urgent_level.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/styles.dart';
import 'package:my_todo_app/utils/utility_functions.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;
  List<TodoModel> myTodos = [];
  List<CategoryModel> categories = [];
  int categorySelectedIndex = -1;
  int urgentLevel = 0;

//-----------------Date selecting------------------

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    setState(() {
      myTodos =
          MyRepository.myTodos.where((element) => !element.isDone).toList();
      categories = MyRepository.categories;
    });
  }

  List<Widget> screens = [
    const ToDoListScreen(),
    const DoneListScreen(),
    Container(),
    const BasketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.todoColor,
        iconSize: 24,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 182, 181, 181),
        items: [
          getItem(icon: Icons.home_filled, labelText: "Home"),
          getItem(icon: Icons.check_box, labelText: "Done"),
          getItem(icon: Icons.add, labelText: ""),
          getItem(icon: Icons.shopping_basket_outlined, labelText: "Basket"),
          getItem(icon: Icons.perm_identity_rounded, labelText: "Profile")
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            isDismissible: false,
            context: context,
            backgroundColor: Colors.white,
            builder: (context) => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ModalTopView(
                            text: "Create new todo",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                  hintText: "To Do title here"),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                controller: descriptionController,
                                maxLength: 150,
                                maxLines: 5,
                                style: const TextStyle(
                                    fontSize: 19, color: Color(0xFF060F17)),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Description here',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(13),
                                  fillColor:
                                      const Color(0xFFD7D7D7).withOpacity(0.2),
                                ),
                              )),
                          SizedBox(
                            height: 85,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, index) {
                                return CategoryItem(
                                  isSelected: categorySelectedIndex == index,
                                  categoryModel: categories[index],
                                  onTap: () {
                                    setState(() {
                                      categorySelectedIndex = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SelectUrgentLevel(
                              selectedStarsCount: urgentLevel,
                              onChanged: (v) {
                                urgentLevel = v;
                              }),
                          SelectDateItem(
                            text: DateFormat.yMMMd().format(selectedDate),
                            onTap: () async {
                              var t = await _selectDate(context);
                              setState(() {
                                selectedDate = t;
                              });
                            },
                          ),
                          SelectDateItem(
                            text: "${selectedTime.hour}:${selectedTime.minute}",
                            onTap: () async {
                              var t = await _selectTime(context);
                              setState(() {
                                selectedTime = t;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyCustomButton(
                                  buttonText: "Cancel",
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: MyCustomButton(
                                  buttonText: "Save",
                                  onTap: () {
                                    String titleText = titleController.text;
                                    String descriptionText =
                                        descriptionController.text;
                                    if (titleText.length < 3) {
                                      UtilityFunctions.getMyToast(
                                          message: "Sarlavxani kiriting!");
                                    } else if (descriptionText.length < 5) {
                                      UtilityFunctions.getMyToast(
                                          message: "Izoh kiriting!");
                                    } else if (categorySelectedIndex < 0) {
                                      UtilityFunctions.getMyToast(
                                          message: "Categoryani tanlang!");
                                    } else if (urgentLevel == 0) {
                                      UtilityFunctions.getMyToast(
                                          message:
                                              "Muhimlik darajasini tanlang!");
                                    } else {
                                      var dateTime = DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute,
                                      );
                                      TodoModel todoModel = TodoModel(
                                        categoryId:
                                            categories[categorySelectedIndex]
                                                .categoryId,
                                        dateTime: dateTime.toString(),
                                        isDone: false,
                                        todoDescription: descriptionText,
                                        todoTitle: titleText,
                                        urgentLevel: urgentLevel,
                                      );
                                      MyRepository.addNewTodo(
                                        todoModel: todoModel,
                                      );
                                      _init();
                                      setDefaults();
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        backgroundColor: MyColors.button,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
      label: labelText,
      icon: Icon(
        icon,
        color: Color.fromARGB(255, 177, 175, 175),
      ),
      activeIcon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  void setDefaults() {
    urgentLevel = 0;
    descriptionController.clear();
    titleController.clear();
    categorySelectedIndex = -1;
  }
}

CategoryModel getCategory(List<CategoryModel> categories, int categoryId) {
  return categories
      .where((element) => element.categoryId == categoryId)
      .toList()[0];
}
