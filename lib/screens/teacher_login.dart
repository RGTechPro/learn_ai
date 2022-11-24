import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ai/auth.dart';

class TeacherLoginPage extends StatelessWidget {
  const TeacherLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27214e),
      body: Column(
        children: [
          Image.asset('assets/landing.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Login for registered teachers",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color(0xffFF9E2C),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          FutureBuilder(
            future: Authentication.initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GoogleSignInButton();
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.orange,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });
                final snackBar = new SnackBar(
                    content: new Text('Signed in!'),
                    backgroundColor: Colors.red);

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
