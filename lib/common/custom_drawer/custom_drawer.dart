import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/widgets/custom_header.dart';
import 'package:xlo/common/custom_drawer/widgets/menu_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomHeader(),
          MenuSection(),
          Divider(color: Colors.grey[500],),
        ],
      ),
    );
  }
}