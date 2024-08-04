import 'dart:io';
import 'package:craft_my_plate/Data layer/models/user_model.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craft_my_plate/Presentation layer/menu.dart';
import 'package:craft_my_plate/Presentation layer/utils/utils.dart';
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
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        )
            : SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 5),
          child: Center(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Just a step away !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF030303),
                          fontSize: 20,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => selectImage(),
                  child: image == null
                      ? const CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 50,
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                      : CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 50,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      textfeld(
                          hintText: 'Full Name',
                          inputType: TextInputType.name,
                          controller: nameController),
                      textfeld(
                          hintText: 'Email ID',
                          inputType: TextInputType.emailAddress,
                          controller: emailController),
                    ],
                  ),
                ),
                SizedBox(
                  height: 310,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    width: double.infinity,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ElevatedButton(
                        onPressed: () => storeData(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textfeld(
      {required String hintText,
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

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "");
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                  (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                      (route) => false),
            ),
          );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
