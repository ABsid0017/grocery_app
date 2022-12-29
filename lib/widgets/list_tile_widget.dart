import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    Key? key,
    required this.title,
    this.subtitle = "",
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  String subtitle;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
      ),
      subtitle: Text(subtitle),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
