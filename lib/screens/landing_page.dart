import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:learn_ai/screens/chat_page.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:learn_ai/screens/student_survey.dart';
import 'package:learn_ai/screens/teacher_login.dart';
import 'package:learn_ai/screens/teacher_page.dart';

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
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Let's Get started",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color(0xffFF9E2C),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //   child: SizedBox(
          //     height: 60,
          //     width: double.infinity,
          //     child: SignInButton(Buttons.Google,
          //         elevation: 10,
          //         text: 'Login with Google',
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30)), onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: ((context) => ChatPage())));
          //     }),
          //   ),
          // ),
          SizedBox(
            height: 125,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 65,
                  child: TextButton(
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherPage()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherLoginPage()));
                        }
                      },
                      child: Text('Teacher',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 25))),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffF8774A)),
                          elevation: MaterialStateProperty.all(1))),
                ),
                SizedBox(
                  width: 150,
                  height: 65,
                  child: TextButton(
                      onPressed: ()async {

 try {
                  dynamic conversationObject = {
                    'appId': '1c494d99b9708a89953ed64c8966c3ca0',
                    'botids': [
                      'learn-ai-6e3pd'
                    ] // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                  };
                  dynamic result =
                      await KommunicateFlutterPlugin.buildConversation(
                          conversationObject);

                  print("Conversation builder success : " + result.toString());
                } on Exception catch (e) {
                  print(
                      "Conversation builder error occurred : " + e.toString());
                }

                      },
                      child: Text(
                        'Student',
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffF8774A)),
                          elevation: MaterialStateProperty.all(1))),
                )
              ],
            ),
          ),
          // TextButton(
          //     onPressed: () async {
          //       try {
          //         dynamic conversationObject = {
          //           'appId': '1c494d99b9708a89953ed64c8966c3ca0',
          //           'botids': [
          //             'learn-ai-syxjx'
          //           ] // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
          //         };
          //         dynamic result =
          //             await KommunicateFlutterPlugin.buildConversation(
          //                 conversationObject);

          //         print("Conversation builder success : " + result.toString());
          //       } on Exception catch (e) {
          //         print(
          //             "Conversation builder error occurred : " + e.toString());
          //       }
          //     },
          //     child: Text('login')),
          // TextButton(
          //     onPressed: () async {
          //       try {
          //         dynamic conversationObject = {
          //           'appId': '1c494d99b9708a89953ed64c8966c3ca0',
          //           'botids': [
          //             'learn-ai-6e3pd'
          //           ] // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
          //         };
          //         dynamic result =
          //             await KommunicateFlutterPlugin.buildConversation(
          //                 conversationObject);

          //         print("Conversation builder success : " + result.toString());
          //       } on Exception catch (e) {
          //         print(
          //             "Conversation builder error occurred : " + e.toString());
          //       }
          //     },
          //     child: Text('infra')),
          // TextButton(
          //     onPressed: () async {
          //       KommunicateFlutterPlugin.logout();
          //     },
          //     child: Text('logout chat'))
        ],
      ),
    );
  }
}
