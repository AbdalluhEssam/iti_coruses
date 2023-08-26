import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/widgets/create_task-Widget.dart';
import 'package:iti_coruses/widgets/custom_button_widget.dart';
import 'package:iti_coruses/widgets/custom_textFormField.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';
import 'package:iti_coruses/widgets/title_widget.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController clockController = TextEditingController();
  TextEditingController calenderController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();

  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();

  @override
  void initState() {
    // clockController.text = "${time.hourOfPeriod}:${time.minute} ${time.period.name.toUpperCase()}";
    // calenderController.text = DateFormat('yyyy-MM-dd').format(date);
    titleTaskController.text = "Hi-Fi Wireframe";
    taskDetailsController.text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: "Create New Task",
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleWithPadding(context, "Task Title"),
              CustomTextFormField(
                padding: 24,
                hintText: "Add Title Task",
                controller: titleTaskController,
                colorText: Colors.white,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Not Data";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildTitleWithPadding(context, "Task Details"),
              CustomTextFormField(
                padding: 24,
                maxLines: 6,
                hintText: "Add Task Details",
                controller: taskDetailsController,
                colorText: Colors.white,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Not Data";
                  }
                  return null;
                },
              ),
              buildTitleWithPadding(context, "Add team members"),
              buildCreateNewTask(2),
              buildTitleWithPadding(context, "Time & Date"),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    width: 135,
                    height: 41,
                    child: Row(
                      children: [
                        Container(
                          color: ColorManager.mustardYellow,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.watch_later_outlined,
                                size: 28,
                              )),
                        ),
                        Expanded(
                          child: CustomTextFormFieldDate(
                            hintText: "Select Hour",
                            controller: clockController,
                            validator: (val) {
                              if (val?.isEmpty == true) {
                                return "please select";
                              }
                              return null;
                            },
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(
                                          useMaterial3: true,
                                          primaryColor: ColorManager.textField,
                                          colorScheme: ColorScheme.dark(
                                              background:
                                                  ColorManager.textField,
                                              primary:
                                                  ColorManager.mustardYellow),
                                          buttonTheme: const ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                          timePickerTheme: TimePickerThemeData(
                                            backgroundColor:
                                                ColorManager.textField,
                                            dayPeriodTextColor:
                                                ColorManager.mustardYellow,
                                            dayPeriodColor:
                                                ColorManager.textField,
                                            dialTextColor:
                                                ColorManager.mustardYellow,
                                          )),
                                      child: child!);
                                },
                              );
                              if (pickedTime != null) {
                                // DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context));
                                // String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                setState(() {
                                  clockController.text =
                                      "${pickedTime.hourOfPeriod}:${pickedTime.minute} ${pickedTime.period.name.toUpperCase()}";
                                  print(clockController.text);
                                });
                              } else {
                                print("Time is not selected");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 135,
                    height: 41,
                    child: Row(
                      children: [
                        Container(
                          color: ColorManager.mustardYellow,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconBroken.Calendar,
                                size: 28,
                              )),
                        ),
                        Expanded(
                            child: CustomTextFormFieldDate(
                          hintText: "Select Day",
                          controller: calenderController,
                          validator: (val) {
                            if (val?.isEmpty == true) {
                              return "please select";
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? start = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2200),
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                      useMaterial3: true,
                                      colorScheme: ColorScheme.light(
                                          primary: ColorManager.textField,
                                          // <-- SEE HERE
                                          onPrimary: ColorManager.mustardYellow,
                                          secondary: ColorManager.mustardYellow,
                                          // <-- SEE HERE
                                          onSurface: ColorManager.mustardYellow,
                                          //// <-- SEE HERE
                                          onSecondary:
                                              ColorManager.mustardYellow,
                                          surface: ColorManager.textField),
                                      textTheme:
                                          Theme.of(context).textTheme.copyWith(
                                                bodyLarge: const TextStyle(
                                                    fontFamily: "Inter"),
                                                bodyMedium: const TextStyle(
                                                    fontFamily: "Inter"),
                                                bodySmall: const TextStyle(
                                                    fontFamily: "Inter"),
                                              ),
                                      dialogBackgroundColor:
                                          ColorManager.backFormColor,
                                      dialogTheme: const DialogTheme(
                                          contentTextStyle:
                                              TextStyle(fontFamily: "Inter"),
                                          titleTextStyle:
                                              TextStyle(fontFamily: "Inter")),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          textStyle: const TextStyle(
                                              fontFamily: "Inter"),
                                          primary: ColorManager
                                              .mustardYellow, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!);
                              },
                            );

                            if (start != null) {
                              setState(() {
                                calenderController.text =
                                    DateFormat('yyyy-MM-dd').format(start);
                              });
                            }
                          },
                        )),
                      ],
                    ),
                  )),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: buildTitleWithPadding(context, "Add New"),
              ),
              buildMaterialButton(context, () { }, "Create")
            ],
          ),
        ),
      ),
    );
  }
}
