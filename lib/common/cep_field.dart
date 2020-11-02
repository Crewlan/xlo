import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepField extends StatefulWidget {

  final InputDecoration decoration;

  const CepField({Key key, this.decoration}) : super(key: key);
  @override
  _CepFieldState createState() => _CepFieldState();
}

class _CepFieldState extends State<CepField> {

  InputDecoration get decoration => widget.decoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: decoration,
          keyboardType: TextInputType.number,
          inputFormatters: [
            CepInputFormatter(),
            // ignore: deprecated_member_use
            WhitelistingTextInputFormatter.digitsOnly
          ],
        )
      ],
    );
  }
}