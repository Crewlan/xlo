import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/api/api_postalcode.dart';
import 'package:xlo/common/cep_field.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/pages/create/widgets/images_field.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Anuncio'),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ImageField(
              onSaved: (images){

              },
              initalValue: [],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titulo *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text){
                if(text.isEmpty) return 'Campo obrigatorio';
                return null;
              },
              onSaved: (t){

              },
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              validator: (text){
                if(text.trim().isEmpty) return 'Campo obrigatorio';
                if(text.trim().length < 10)
                  return 'Descrição muito curta';
                return null;
              },
              onSaved: (d){
                
              },
            ),
            CepField(
              decoration: InputDecoration(
                labelText: 'Cep *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço *',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              inputFormatters: [
                // ignore: deprecated_member_use
                WhitelistingTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
              validator: (text) {
                if (text.isEmpty) return 'Campo obrigatório';
                if (double.tryParse(text) == null)
                  return 'Utilize valores válidos';
                return null;
              },
              onSaved: (price) {

              },
            ),
            Container(
              height: 50,
              child: RaisedButton(
                color: Colors.pink,
                child: Text('Enviar',
                style: TextStyle(
                  color: Colors.white
                ),),
                onPressed: (){

                  getAdressFromAPI('06775-430');

                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
