import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';


class NewMassageScreen extends StatelessWidget  {
  const NewMassageScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  context.navigator.pop();
                },
                icon: const Icon(IconBroken.Arrow___Left))),
        title: const Text("New Message"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Search)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric( vertical: 10),
              iconColor: Colors.black,
              leading:  CircleAvatar(
                radius: 30,
                backgroundColor: ColorManager.mustardYellow,
                child: const Icon(IconBroken.User,color: Colors.black,size: 35,),
              ),
              title: const Text("Create a group",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String name =Faker().person.name();
                  return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      iconColor: Colors.black,
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/img_7.png"),
                      ),
                      title:  Text(name,
                          style: const TextStyle(color: Colors.white, fontSize: 18,),maxLines: 1),
                      trailing: Text(
                        name.characters.first,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16),
                      ),
                    );
                },
                itemCount: 50),
          ],
        ),
      ),
    );
  }
}
