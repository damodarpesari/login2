import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Future<void> _createUser() async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInAnonymously();
  //   } on FirebaseAuthException catch (e) {
  //     print('Error: $e');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  String _email;
  String _password;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                _email = value;
              },
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(hintText: 'Enter Password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Text('Log In'),
                ),
                MaterialButton(
                  onPressed: _createUser,
                  child: Text('Create An Account'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
