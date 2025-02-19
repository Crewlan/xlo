import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  final FormFieldSetter<String> onSaved;
  final bool enabled;

  const PasswordField({Key key, this.onSaved, this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildBar(int n, String pass){
      final int level = _calcScore(pass);
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: n <= level ? _getColor(level) : Colors.transparent,
            border: n > level ? Border.all(color: Colors.grey) : null,
          ),
        ),
        );
    }


    return FormField<String>(
      initialValue: '',
      onSaved: onSaved,
      validator: (text){
        if(text.isEmpty || _calcScore(text) < 2)
          return 'Senha invalida';
        return null;
      },
      builder: (state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: state.didChange,
              enabled: enabled,
            ),
            if(state.value.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 10,
              child: Row(
                children: [
                  _buildBar(0, state.value),
                  _buildBar(1, state.value),
                  _buildBar(2, state.value),
                  _buildBar(3, state.value),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 10),
              child: state.value.isNotEmpty || state.hasError ? Text(
                state.value.isNotEmpty ?  _getText(_calcScore(state.value)) : state.errorText ,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: _getColor(_calcScore(state.value))
                ),
              ) : Container(),
            )
          ],
        );
      },
    );
  }

  int _calcScore(String text){
    int score = 0;
    if(text.length > 8)
      score += 1;
    if(text.contains(RegExp(r'[0-9]')))
      score += 1;
    if(text.contains(RegExp(r'[A-Z]')))
      score += 1;
    return score;
  }

  Color _getColor(int level){
    switch (level){
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.greenAccent;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  String _getText(int level){
     switch (level){
      case 0:
        return 'Senha fraca';
      case 1:
        return'Senha razoavelmente fraca';
      case 2:
        return 'Senha razoavelmente forte';
      case 3:
        return 'Senha forte';
      default:
        return '';
    }
  }

}