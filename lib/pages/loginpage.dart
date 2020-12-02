import 'package:AGROGRAM/pages/reset-password-page.dart';
import 'package:AGROGRAM/pages/signup.page.dart';
import 'package:AGROGRAM/pages/telaPrincipal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  var _form = GlobalKey<FormState>();
  var _snack = GlobalKey<ScaffoldState>();

  Future login() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: _emailEditingController.text,
          password: _passwordEditingController.text);
    } catch (e) {
      if (e.code == "invalid-email") {
        snackBar("Email inválido");
      } else if (e.code == "user-not-found") {
        snackBar("Usuário não encontrado");
      }
    }
  }

  snackBar(String message) {
    _snack.currentState.showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(fontSize: 16)),
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF9eb647),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _snack,
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            color: Colors.white,
            child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    child: Image.asset("assets/logotipo.png"),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                  ),
                  TextFormField(
                    controller: _emailEditingController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo Vazio";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  TextFormField(
                    controller: _passwordEditingController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo Vazio";
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        "Recuperar senha",
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.5, 1],
                          colors: [
                            Color(0xFF9eb647),
                            Color(0xFF9eb647),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("assets/tamanh.png"),
                                height: 28,
                                width: 28,
                              ),
                            )
                          ],
                        ),
                        onPressed: () async {
                          if (_form.currentState.validate()) {
                            print(
                                "---------------------Valido-------------------------");
                            await login();
                            await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaPrincipal()),
                                (route) => false);
                          }
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaPrincipal(),
                              ),
                            ); */
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: FlatButton(
                      child: Text(
                        "Cadastre-se",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
