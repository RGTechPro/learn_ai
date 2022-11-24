import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ai/auth.dart';
import 'package:learn_ai/database.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class TeacherPage extends StatefulWidget {
  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  TextEditingController _textFieldController = TextEditingController();

  TextEditingController _textFieldController1 = TextEditingController();

  TextEditingController _textFieldController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _displayTextInputDialog(
        BuildContext context, mongo.ObjectId id) async {
      bool isLoading = false;
      double g1 = 0;
      double g2 = 0;
      double g3 = 0;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter Math marks',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
              content: Column(children: [
                Text('Enter Semester 1 marks',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextFormField(
                    controller: _textFieldController,
                    onChanged: (value) {
                      g1 = double.parse(value);
                    },
                    decoration: InputDecoration(hintText: "Semester 1 marks")),
                Text('Enter Semester 2 marks',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextFormField(
                    controller: _textFieldController1,
                    onChanged: (value) {
                      g2 = double.parse(value);
                    },
                    decoration: InputDecoration(hintText: "Semester 2 marks")),
                Text('Enter Semester 3 marks',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextFormField(
                    controller: _textFieldController2,
                    onChanged: (value) {
                      g3 = double.parse(value);
                    },
                    decoration: InputDecoration(hintText: "Semester  marks")),
                // (!isLoading)
                //     ? TextButton(
                //         onPressed: () async {

                //         },
                //         child: Text('Submit',
                //             style: GoogleFonts.lato(
                //                 textStyle: TextStyle(
                //                     color: Colors.black, fontSize: 25))))
                //     : CircularProgressIndicator()
              ]

                  // TextField(
                  //   onChanged: (value) {},
                  //   controller: _textFieldController,
                  //   decoration: InputDecoration(hintText: "Text Field in Dialog"),
                  //    ),
                  ),
              actions: [
                (!isLoading)
                    ? TextButton(
                        style: ButtonStyle(
                            // shape: MaterialStateProperty.all(
                            //     RoundedRectangleBorder(
                            //         borderRadius:
                            //             BorderRadius.circular(32))
                            //             ),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffF8774A)),
                            elevation: MaterialStateProperty.all(1)),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          print('id:$id');
                          await MongoDatabase().update(g1, g2, g3, id);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            Authentication.customSnackBar(
                              content: 'Updated successfully.',
                            ),
                          );
                        },
                        child: Text('Submit',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.black, fontSize: 25))))
                    : CircularProgressIndicator()
              ],
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (() {
                  _signOut();
                }),
                child: Text('Student Marks Updation Platform',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
              ),

              SizedBox(
                height: 30,
              ),

              FutureBuilder(
                future: MongoDatabase().fetchStudents(),
                builder: (context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;

                  print(data);
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Text('Error ');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: Column(
                        children: [
                          Text('${data!.length} students found!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ))),
                          Expanded(
                            child: ListView.builder(
                                itemCount: data!.length,
                                itemBuilder: (context, index) {
                                  return TextButton(
                                      style: ButtonStyle(
                                          // shape: MaterialStateProperty.all(
                                          //     RoundedRectangleBorder(
                                          //         borderRadius:
                                          //             BorderRadius.circular(32))
                                          //             ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xffF8774A)),
                                          elevation:
                                              MaterialStateProperty.all(1)),
                                      onPressed: () {
                                        _displayTextInputDialog(
                                            context, data[index]['_id']);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            data[index]['name'].toString(),
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ),
                                          Text(
                                            "G1: ${data[index]['G1'].toString()}",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ),
                                          Text(
                                            "G2: ${data[index]['G2'].toString()}",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ),
                                          Text(
                                            "G3: ${data[index]['G3'].toString()}",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ));
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),
              //   TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}