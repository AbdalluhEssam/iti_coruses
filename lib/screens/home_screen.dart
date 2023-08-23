import '../models/user.dart';
import '../services/log_manager.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widgets/contact_card.dart';

//! TODO:
///! 1- [MaterialApp] : 5 +
/// 2- [Scaffold] : 10 +
/// 3 [visbility]
/// 4-[Flexibile]/// 5-[Expanded]/// 6-[Spacer]: DIrect parent Col/ROw
/// 7-[Opacity]
/// 8-[Con]:
/// 9-[Text]:
/// 10-[AppBar]:
///! 11[ InkWell] 12 +vs [GestureDetector]
/// 13[ typedef]
/// 14[TEAR-OFF]
///!!15[ElevatedButton]
///!! 16[TextButton]
///!! 17[OutlinedButton]
///!!18[Positioned]:name const
///!!19[Stack]
///!!20-[Positioned]
///!!21-[Align]
///!!22-[Padding]
///!![23][ConstrainedBox]
///!!!!24[ ElevatedButton.styleFrom() vs Button Style]
//////!!!!25[Widget Extraction]BoxedBox
///named constructor List : List.unmodifiable
///!!!26ListTile
///!!!27 [ListView.builder]
///!!!28 [ListView()]
///!!!29 [ListView.separated]
//!!!30 [Divider()]
//!!!31 [Image]
///Abdullah(51):copyWith vs merge
///20[show vs hide]: with example
///[Human Guideline Interface] = [Material Design 3 ]
///https://www.youtube.com/@DevMENA/search?query=flutter
///https://www.youtube.com/watch?v=IOyq-eTRhvo&vl=ent
/// /// 6-[Spacer]
///
///

//Stateless vs stateful : DOne
//text field: Done
//form:DOne
//building ui
//Navigation

typedef Feature = String;

void clickME() {
  LogManager.logToConsole("You can click me");
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> myUsers = List.generate(
        20,
        (index) => User(
          
            name: Faker().person.name(),
            id: index,
            isActive: false,
            title: Faker().job.title(),
            info: Faker().vehicle.yearMakeModel()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Obour Land",
          style: TextStyle(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    // style: const ButtonStyle(
                    //     backgroundColor: MaterialStatePropertyAll(Colors.amber),
                    //     minimumSize: MaterialStatePropertyAll(Size(70, 35)),
                    //     maximumSize: MaterialStatePropertyAll(Size(105, 35)
                    //         //..
                    //         //..
                    //         //..
                    //         )
                    //     // alignment:
                    //     ),
                    onPressed: () {},
                    child: Text("Sign" * 3)),
              ), //RaisedButton()
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(),
                  icon: const Icon(Icons.abc),
                  label: const Text("Elevated with icon")),
              TextButton(
                  onPressed: () {},
                  child: const Text("TextButton")), //FlatButton()
              OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "OutlineButton",
                  )), //OutlineButton(),
              MaterialButton(
                  onPressed: () {}, child: const Text("MaterialButton"))
            ],
          ),
          // Container(
          //   color: Colors.blue,
          //   width: 200,
          //   height: 200,
          //   alignment: AlignmentDirectional.topCenter,
          //   child: const Icon(Icons.person),
          // ),
          Transform.rotate(
            angle: math.pi * .5,
            child: Opacity(
              opacity: 0.1,
              child: Container(
                width: 150,
                // height: 100,
                constraints: const BoxConstraints(minHeight: 75),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  //  shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Element 1",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Offstage(
            offstage: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onLongPress: () {
                      LogManager.logToConsole("long press");
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      alignment: Alignment.center,
                      color: Colors.blue[100],
                      child: const Text(
                        "Element 2a",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                //TEAR-OFF
                InkWell(
                  onTap: clickME,
                  hoverColor: Colors.blue,
                  focusColor: Colors.blue,
                  onHover: (value) {
                    print("hovering");
                  },
                  child: Container(
                    width: 75,
                    height: 75,
                    alignment: Alignment.center,
                    color: Colors.red[300],
                    child: const Text(
                      "Element 2b",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 75,
                    height: 75,
                    alignment: Alignment.center,
                    color: Colors.green[200],
                    child: const Text(
                      "Element 2c",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const ContactCard(),
          // Expanded(
          //   child: ListView(
          //     children: myUsers
          //         .map((user) => ContactCard(
          //               name: user.name,
          //               info: user.info,
          //               subtitle: user.title,
          //             ))
          //         .toList(),
          //   ),
          // )
          Offstage(
            offstage: true,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(-1, -2),
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/images/home_1.png"),
                  )),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: myUsers.length,
              itemBuilder: (_, int index) {
                var user = myUsers[index];
                return ContactCard(
                    id: index.toString(),
                    name: "$index ${user.name}",
                    subtitle: user.title,
                    info: user.info);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.indigo,
                thickness: 3,
                endIndent: 20,
                indent: 20,
              ),
            ),
          )
          //  const BoxedBox(
          //   title: "OI + FA",
          //   color: Colors.indigo,
          //  ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Click me"),
      ),
    );
  }
}
