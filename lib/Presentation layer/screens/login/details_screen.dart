import 'dart:io';
import 'package:craft_my_plate/Data layer/models/user_model.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../menu.dart';
import '../../utils/utils.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider
            .of<AuthProvider>(context, listen: true)
            .isLoading;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 70, 0, 0),
                    child: Text(
                      'Just a step away !',
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: 25,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                SafeArea(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        textfeld(
                            hintText: 'Full Name',
                            inputType: TextInputType.name,
                            controller: nameController),
                        SizedBox(height: 10,),
                        textfeld(
                            hintText: 'Email ID',
                            inputType: TextInputType.emailAddress,
                            controller: emailController),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 320,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    width: double.infinity,
                    height: 90,
                    child:

                    ClipRect(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Menu(),
                            ),
                                (route) => false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,

                        ),
                        child: Text(
                          'Let\'s Start',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                      ),
                    ),

                  ),
                ),
              ]
          ),
        ),

      ),

    );
  }

  Widget textfeld({required String hintText,
    required TextInputType inputType,
    required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.deepPurple,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFFC9C4C9),
                )),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16, letterSpacing: 1)),
      ),
    );
  }

}
