import 'dart:io';

import 'package:AGROGRAM/pages/telaPrincipal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();

  var _form = GlobalKey<FormState>();
  var _snack = GlobalKey<ScaffoldState>();
  var image;

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
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: Form(
          key: _form,
          child: ListView(children: <Widget>[
            Stack(
              alignment: Alignment(0, 1),
              children: [
                image == null
                    ? Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment(0.0, 1.15),
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage("assets/profile-picture.png"),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                            child: Image.file(
                          File(image),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )),
                      ),
                Container(
                  height: 56,
                  width: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1.0],
                        colors: [
                          Color(0xFF9eb647),
                          Color(0XFFF927bf),
                        ],
                      ),
                      border: Border.all(
                        width: 2.0,
                        color: const Color(0xFFFFFFFF),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(56),
                      )),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        try {
                          var file = await ImagePicker.platform
                              .pickImage(source: ImageSource.camera);
                          setState(() {
                            image = file.path;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo Vazio";
                }
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo vazio";
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo vazio";
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF9eb647),
                    Color(0xFF9eb647),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    try {
                      await firebaseAuth.createUserWithEmailAndPassword(
                          email: _emailEditingController.text,
                          password: _passwordEditingController.text);
                      await FirebaseStorage.instance
                          .ref(
                              "photoUsers/${FirebaseAuth.instance.currentUser.uid}")
                          .putFile(File(image));
                      var imageLink = await FirebaseStorage.instance
                          .ref("photoUsers")
                          .child(FirebaseAuth.instance.currentUser.uid)
                          .getDownloadURL();
                      await firebaseAuth.currentUser.updateProfile(
                          displayName: _nameEditingController.text,
                          photoURL: imageLink);
                      print("ImageURL: ${firebaseAuth.currentUser.photoURL}");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaPrincipal()),
                          (route) => false);
                    } catch (e) {
                      if (e.code == "email-already-in-use") {
                        snackBar("Email já está sendo utilizado");
                        Future.delayed(
                            Duration(seconds: 3), () => Navigator.pop(context));
                      } else {
                        print("${e.code}");
                      }
                    }
                  },
                ),
              ),
            ),
            Divider(
              height: 10,
              color: Colors.white,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Logar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
