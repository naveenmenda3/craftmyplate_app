import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';

import '../../utils/utils.dart';
import 'package:craft_my_plate/Presentation layer/screens/login/details_screen.dart';

class OtpScreen extends StatefulWidget {


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider
            .of<AuthProvider>(context, listen: true)
            .isLoading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: isLoading == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        )
            : Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'We have sent a verification code to',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '+91-XXXXXX',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                  width: 45,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.deepPurple,
                      )),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              onCompleted: (value) {
                setState(() {
                  otpCode = value;
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (otpCode != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailsScreen()),
                              (route) => false);
                    } else {
                      showSnackBar(context, "Enter 6-Digit code");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    'Submit',
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
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Text(
                    'Didn\'t receive code?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend Again.',
                      style: TextStyle(
                        color: Color(0xFF6318AF),
                        fontSize: 16,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
