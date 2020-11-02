import 'package:flutter/material.dart';
import 'package:xlo/pages/home/widgets/bar_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarButton(
          label: 'Categorias',
          boxDecoration: BoxDecoration(
            color: Colors.white
          ),
          onPressed: (){},
        ),
        BarButton(

          label: 'Filtros',
          boxDecoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: Colors.grey[400])
            )
          ),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/filter_page');
          },
        ),
      ],
    );
  }
}