
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/log_manager.dart';
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
            title: Faker().job.title(),
            info: Faker().vehicle.yearMakeModel()));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Obour Land",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        toolbarHeight: 60,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 185,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/home_1.png"),
                              fit: BoxFit.cover)),
                    )),

                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage("assets/images/abd.jpeg"),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: const [
              Text("Abdalluh Essam" ,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              Text("About..." ,style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 100),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                    onPressed: () {},
                        style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(const Size(110, 35))),
                    child: const Text(
                      "Like",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                  ),
                      const Text(
                        "500",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                    onPressed: () {},
                        style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(const Size(110, 35))),

                        child: const Text(
                      "Views Profile",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                  ),
                      const Text(
                        "200",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                    onPressed: () {},
                        style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(const Size(110, 35))),

                        child: const Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                  ),
                      const Text(
                        "4K",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent)),
                  icon: const Icon(Icons.add),
                  label: const Text("Follow")),
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
                  icon: const Icon(Icons.block),
                  label: const Text("Block")),
              OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Update Profile",
                  )), //OutlineButton(),
            ],
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            alignment: Alignment.centerLeft,
            child: const Text("Friends" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myUsers.length,
              itemBuilder: (_, int index) {
                var user = myUsers[index];
                return ContactCard(name: user.name, subtitle: user.title, info: user.info);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.grey,
                thickness: 2,
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
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
