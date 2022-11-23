import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:learn_ai/screens/chat_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27214e),
      body: Column(
        children: [
          Image.asset('assets/landing.png'),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Let's Get started",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color(0xffFF9E2C),
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: SizedBox(
              height: 75,
              width: double.infinity,
              child: SignInButton(Buttons.Google,
                  elevation: 10,
                  text: 'Login with Google',
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)), onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ChatPage())));
              }),
            ),
          )
        ],
      ),
    );
  }
}
