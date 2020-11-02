import 'package:flutter/material.dart';
import 'package:xlo/blocs/login/signup_bloc.dart';
import 'package:xlo/pages/signup/widgets/field_title.dart';
import 'package:xlo/pages/signup/widgets/password_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();

    _signUpBloc = SignUpBloc();
  }

  @override
  void dispose() {
    _signUpBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<SignUpBlocState>(
          stream: _signUpBloc.outState,
          builder: (context, snapshot) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const FieldTitle(
                  title: 'Apelido',
                  subtitle: 'Como aparecera em seus anuncios.',
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Exemplo: Miguel A.',
                  ),
                  validator: (text) {
                    if (text.length < 6) return 'Apelido muito curto';
                    return null;
                  },
                  initialValue: '',
                  onSaved: _signUpBloc.setName,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                const SizedBox(
                  height: 26,
                ),
                const FieldTitle(
                  title: 'E-Mail',
                  subtitle: 'Enviaremos um e-mail de confirmação.',
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (text) {
                    if (text.length < 6 || !text.contains('@'))
                      return 'E-mail invalido';
                    return null;
                  },
                  onSaved: _signUpBloc.setEmail,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                const SizedBox(
                  height: 26,
                ),
                const FieldTitle(
                  title: 'Senha',
                  subtitle: 'Use letras, numero e caracteres especiais.',
                ),
                PasswordField(
                  onSaved: _signUpBloc.setPassword,
                  enabled: snapshot.data.state != SignUpState.LOADING,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  height: 50,
                  child: RaisedButton(
                    color: Colors.pink,
                    disabledColor: Colors.pink.withAlpha(150),
                    child: snapshot.data.state == SignUpState.LOADING ? CircularProgressIndicator() : Text(
                      'Cadastre-se',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: snapshot.data.state == SignUpState.LOADING ? _signUp : null,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ja tem uma conta? ',
                      style: TextStyle(
                        fontSize: 16
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('Entrar',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 16
                        ),),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _signUpBloc.signUp();
    }
  }
}
