import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  const MenuTile({this.label, this.iconData, this.onTap, this.highlighted});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label, style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: highlighted ? Colors.blue : Colors.black
        ),
      ),
      leading: Icon(
        iconData, color: highlighted ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}