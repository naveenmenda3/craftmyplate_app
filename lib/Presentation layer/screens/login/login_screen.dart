import 'dart:math';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';
import 'package:craft_my_plate/Presentation layer/screens/login/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Country selectedCountry = Country(
      phoneCode: "+91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Positioned(
                      child: Container(child: Image.asset(
                        'assets/frame4.png', fit: BoxFit.cover,), width: 400,)),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                'Log In or Sign Up with Craft My Plate',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                cursorColor: Colors.purple,
                cursorHeight: 25,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.only(top: 12.0, left: 8, right: 8),
                    child: Text(
                      " ${selectedCountry.phoneCode}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 90,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ),
                              (route) => false),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text('By continuing, I accept '
                  ,style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),),
                ),
                Text('Terms & Conditions ',style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),),
                Text('and ',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),),
              ],
            ),
            Text('Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),),
          ]
      ),

    );
  }
}