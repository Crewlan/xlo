import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacementNamed('/login');
      },
      child: Container(
        height: 115,
        padding: EdgeInsets.only(left: 40),
        color: Colors.blue,
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Acesse sua conta agora!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    'Clique aqui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
