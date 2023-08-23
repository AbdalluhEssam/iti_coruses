import 'package:flutter/material.dart';

import '../services/log_manager.dart';

typedef UserId = String?;

// TODO: Day 5
///![task] AppLifecycleState
//!Value Key,UniqueKey,Global KEy,Key,...keys
//![task] All Widget life cycle
//! Enable 30 - 40 lint rules :
//?+ compare lifecycle Widget vs Activity(Android) vs ViewController (ios)

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.info,
    this.id,
  });
  final String name;
  final String subtitle;
  final String info;
  final UserId id;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogManager.logToConsole("initState(): ${widget.name}  ");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    LogManager.logToConsole("didChangeDependencies(): ${widget.name}  ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LogManager.logToConsole("dispose(): ${widget.name}  ");
  }

  @override
  Widget build(BuildContext context) {
    LogManager.logToConsole("build(): ${widget.name}  ");
    return Dismissible(
      key: ValueKey(widget.id),
      child: Card(
        child: ListTile(
          selected: isClicked,
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          title: Text(widget.name),
          subtitle: Text(widget.subtitle),
          trailing: Text(widget.info),
        ),
      ),
    );
  }
}
