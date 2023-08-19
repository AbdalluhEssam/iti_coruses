import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key, required this.name, required this.subtitle, required this.info,
  });
  final String name;
  final String subtitle;
  final String info;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 6),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/abd.jpeg"),
        ),
        title: Text(name),
        subtitle: Text(subtitle),
        trailing: TextButton(onPressed: (){}, child:  const Icon(Icons.add),),
      ),
    );
  }
}
