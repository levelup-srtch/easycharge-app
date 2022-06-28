import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;

  const DrawerTitle({required this.icon, required this.text, required this.page});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => page,
            ),
              (route) => false,
          );
        },
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Colors.white,
              ),
              const SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
