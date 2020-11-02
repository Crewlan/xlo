import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  
  final BoxDecoration boxDecoration;
  final String label;
  final VoidCallback onPressed;


  const BarButton({Key key, this.boxDecoration, this.label, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width/40),
          decoration: boxDecoration,
          child: Text(
            label,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}