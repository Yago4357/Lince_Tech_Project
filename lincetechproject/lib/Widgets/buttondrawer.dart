import 'package:flutter/material.dart';

///Drawer Buttons widget
class DrawerButton extends StatelessWidget {
  ///Text of the buttons
  final String text;

  ///Icon of the buttons
  final IconData icon;

  ///Variable for take the link of the page that will redirect
  final String linkPage;

  ///Constructor of Drawer Buttons
  const DrawerButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.linkPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50,
        onPressed: () async {
          await Navigator.popAndPushNamed(context, linkPage);
        },
        child: SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
