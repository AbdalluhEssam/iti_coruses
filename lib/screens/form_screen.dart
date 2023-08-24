
import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/color_manager.dart';
import '../constants/route_names.dart';
import '../services/enum.dart';
import '../services/log_manager.dart';
import '../services/validator.dart';
import '../widgets/default_app_bar.dart';

// TODO: Day 6:
// -navigation extra
// Futures
// follow up UI

//TODO: InputDecoration inside TextFormField : all properties
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  GlobalKey<FormState>? _formKey;
  UserGender _gender = UserGender.undefined;
  PaymentMethod _paymentMethod = PaymentMethod.notSelected;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>(debugLabel: "form_key");
    _nameController = TextEditingController(
        // text: "hamada@gmail.com"
        );
    _emailController = TextEditingController(
        // text: "hamada@gmail.com"
        );
  }

  @override
  Widget build(BuildContext context) {
    var myCal = List<String>.generate(10, (index) {
      if (index < 5) {
        return DateTime.now()
            .subtract(Duration(days: 5 - index))
            .abbrDayWithNumber();
      } else {
        return DateTime.now()
            .add(Duration(days: index - 5))
            .abbrDayWithNumber();
      }
    });
    var myBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green.withOpacity(0.6), width: 5),
    );
    return Scaffold(
      appBar: const MyAppBar(
        titleText: "Form Screen",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // autovalidateMode:AutovalidateMode.onUserInteraction ,//[form scope]
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                // autocorrect: ,
                // autofillHints: ,
                // autovalidateMode: ??,
                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(10)
                // ],
                // buildCounter: (context,
                //     {int? currentLength, bool isFocused = false, int? maxLength}) {
                //       return null;

                // maxLength: 11,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Colors.red,
                cursorWidth: 10,
                keyboardType: TextInputType.name,
                controller: _nameController,
                textCapitalization: TextCapitalization.characters,
                // obscureText: true,
                // obscuringCharacter: "!",
                onChanged: (String keyPress) {
                  LogManager.logToConsole(
                      "onChanged(): pressed key: $keyPress");
                },
                onFieldSubmitted: (String submittedText) {
                  LogManager.logToConsole(
                      "onFieldSubmitted(): pressed key: $submittedText");
                },
                readOnly: false,
                //!Extra
                validator: Validator.validateName,
                //!Extra
                decoration: InputDecoration(
                  label: const Text("Name"),
                  hintText: "Please enter your name is FULL CAPS",
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.1), width: 1),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder.copyWith(
                      borderSide: BorderSide(
                          color: Colors.indigo.withOpacity(0.6), width: 5)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                // autocorrect: ,
                // autofillHints: ,
                // autovalidateMode: ??,
                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(10)
                // ],
                // buildCounter: (context,
                //     {int? currentLength, bool isFocused = false, int? maxLength}) {
                //       return null;

                // maxLength: 11,
                cursorColor: Colors.red,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 10,
                keyboardType: TextInputType.name,
                controller: _emailController,
                // obscureText: true,
                // obscuringCharacter: "!",
                onChanged: (String keyPress) {
                  LogManager.logToConsole(
                      "onChanged(): pressed key: $keyPress");
                },
                onFieldSubmitted: (String submittedText) {
                  LogManager.logToConsole(
                      "onFieldSubmitted(): pressed key: $submittedText");
                },
                readOnly: false,
                validator: (String? valEmail) {
                  return (valEmail?.trim().contains("@") == true &&
                          valEmail?.trim().contains(".") == true &&
                          valEmail?.trim().split("@").length == 2 &&
                          valEmail?.trim().contains("com") == true)
                      ? null
                      : "Please enter a valid email";
                },
                decoration: InputDecoration(
                  label: const Text("Email"),
                  hintText: "Please enter your email",
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.1), width: 1),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder.copyWith(
                      borderSide: BorderSide(
                          color: Colors.indigo.withOpacity(0.6), width: 5)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LimitedBox(
                maxHeight: 60,
                child: ListView.separated(
                  itemCount: myCal.length,
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap:true ,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    var day = myCal[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: index == 5
                            ? ColorManager.mustardYellow
                            : ColorManager.textField,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              day.split(" ")[1],
                              style: TextStyle(
                                  color: index == 5
                                      ? ColorManager.textField
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(day.split(" ")[0],
                                style: TextStyle(
                                    color: index == 5
                                        ? ColorManager.textField
                                        : Colors.white,
                                    fontSize: 8)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              IconButton(
                  onPressed: () {
                    context.navigator.pushNamed(RouteNames.testScreen);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) {
                    //       return const ThirdScreen(
                    //         title: "Third Page",
                    //       );
                    //     },
                    //     fullscreenDialog: false));
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined)),

              // const DefaultCheckboxWithTitle(),
              // SexSelectionRadioWithTitle(
              //   title: UserGender.male.type!,
              //   itemValue: UserGender.male,
              //   groupValue: _gender,
              //   onChanged: (maleVal) {
              //     setState(() {
              //       _gender = UserGender.male;
              //     });
              //   },
              // ),
              // SexSelectionRadioWithTitle(
              //   title: UserGender.female.type!,
              //   itemValue: UserGender.female,
              //   groupValue: _gender,
              //   onChanged: (maleVal) {
              //     setState(() {
              //       _gender = UserGender.female;
              //     });
              //   },
              // ),
              GeneralSelectionRadioWithTitle<UserGender>(
                title: UserGender.male.type!,
                itemValue: UserGender.male,
                groupValue: _gender,
                onChanged: (maleVal) {
                  setState(() {
                    _gender = UserGender.male;
                  });
                },
              ),
              GeneralSelectionRadioWithTitle<UserGender>(
                title: UserGender.female.type!,
                itemValue: UserGender.female,
                groupValue: _gender,
                onChanged: (maleVal) {
                  setState(() {
                    _gender = UserGender.female;
                  });
                },
              ),

              GeneralSelectionRadioWithTitle<PaymentMethod>(
                groupValue: _paymentMethod,
                itemValue: PaymentMethod.credit,
                title: PaymentMethod.credit.type!,
                onChanged: (paymentVal) {
                  setState(() {
                    _paymentMethod = paymentVal ?? PaymentMethod.notSelected;
                  });
                },
              ),
              const Divider(),
              ...(PaymentMethod.values.map((method) {
                if (method.type != null) {
                  return GeneralSelectionRadioWithTitle<PaymentMethod>(
                    groupValue: _paymentMethod,
                    itemValue: method,
                    title: method.type!,
                    onChanged: (paymentVal) {
                      setState(() {
                        _paymentMethod =
                            paymentVal ?? PaymentMethod.notSelected;
                      });
                    },
                  );
                }
                return const SizedBox();
              }).toList()),

              // GeneralSelectionRadioWithTitle<PaymentMethod>(
              //     groupValue: _paymentMethod,
              //     itemValue: PaymentMethod.tamara,
              //     title: PaymentMethod.tamara.type!,
              //     onChanged: (paymentVal) {
              //       setState(() {
              //         _paymentMethod = paymentVal ?? PaymentMethod.notSelected;
              //       });
              //     }),
              // GeneralSelectionRadioWithTitle<PaymentMethod>(
              //     groupValue: _paymentMethod,
              //     itemValue: PaymentMethod.cash,
              //     title: PaymentMethod.cash.type!,
              //     onChanged: (paymentVal) {
              //       setState(() {
              //         _paymentMethod = paymentVal ?? PaymentMethod.notSelected;
              //       });
              //     }
              //     ),

              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    // if (_formKey?.currentState?.validate() ?? false) {
                    //   var user1 = const User(
                    //       id: 1,
                    //       info: "__",
                    //       isActive: true,
                    //       title: "Dr.",
                    //       name: "Ahmed");
                    //   var user2 = user1.copyWith(name: "Ezat");

                    //   LogManager.logToConsole(user1);
                    //   LogManager.logToConsole(user2);
                    // }
                    LogManager.logToConsole(DateTime.now().abbrDayWithNumber());
                  },
                  child: const Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}

class SexSelectionRadioWithTitle extends StatelessWidget {
  const SexSelectionRadioWithTitle(
      {super.key,
      required this.groupValue,
      required this.itemValue,
      this.onChanged,
      required this.title});
  final UserGender groupValue;
  final UserGender itemValue;
  final Function(UserGender?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: itemValue,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}

class PaymentSelectionRadioWithTitle extends StatelessWidget {
  const PaymentSelectionRadioWithTitle(
      {super.key,
      required this.groupValue,
      required this.itemValue,
      this.onChanged,
      required this.title});
  final PaymentMethod groupValue;
  final PaymentMethod itemValue;
  final Function(PaymentMethod?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: itemValue,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}

class GeneralSelectionRadioWithTitle<T> extends StatelessWidget {
  const GeneralSelectionRadioWithTitle(
      {super.key,
      required this.groupValue,
      required this.itemValue,
      this.onChanged,
      required this.title});
  final T groupValue;
  final T itemValue;
  final Function(T?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: itemValue,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
