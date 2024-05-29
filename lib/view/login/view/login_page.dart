import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:systel/core/resources/color_manager.dart';
import 'package:systel/core/resources/font_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/string_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes/app_routes_fun.dart';
import '../../../../core/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _error = false;
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = true;

  // Regular expression pattern to match email addresses
  RegExp regex = RegExp(r'\@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.background), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _error == true
                ? Center(
                    child: Container(
                        height: 5.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.error,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgAssets.error,
                                  fit: BoxFit.scaleDown),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  StringsManager.incorrect,
                                  style: lightTajawalStyle(
                                      fontSize: FontSize.s11,
                                      color: ColorManager.white),
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                : Container(),
            SizedBox(
              height: 3.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                    width: 84.w,
                    child: TextFormField(
                      controller: controllerUsername,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      autofocus: false,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: ColorManager.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        label: Center(
                          child: Text(
                            StringsManager.username,
                            style: regularTajawalStyle(
                                fontSize: FontSize.s16,
                                color: ColorManager.black),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username.'; // Return an error message if the name is empty
                        }
                        return null; // Return null if the name is valid
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 84.w,
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: isLoggedIn,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textAlignVertical: TextAlignVertical.top,
                      style: regularTajawalStyle(
                          fontSize: FontSize.s19, color: ColorManager.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManager.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        label: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              StringsManager.password,
                              style: regularTajawalStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isLoggedIn = !isLoggedIn;
                              });
                            },
                            iconSize: 15,
                            icon: isLoggedIn
                                ? SvgPicture.asset(
                                    SvgAssets.lock,
                                    height: 15,
                                    width: 15,
                                  )
                                : SvgPicture.asset(
                                    SvgAssets.unlock,
                                    height: 15,
                                    width: 15,
                                  )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Container(
          height: 8.h,
          width: 84.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.blue,
          ),
          child: Center(
            child: TextButton(
              onPressed:
                  _submitForm, // Call the _submitForm function when the button is pressed
              child: Text(
                StringsManager.login,
                style: blodTajawalStyle(
                    fontSize: FontSize.s18, color: ColorManager.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // function to login or start register
  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final username = controllerUsername.text.trim();
      final password = controllerPassword.text.trim();
      if (await InternetConnectionChecker().hasConnection) {
        final user = ParseUser(username, password, null);

        var response = await user.login();

        if (response.success) {
          _showSuccess("User was successfully login!");
          setState(() {
            isLoggedIn = true;
          });
        } else {
          _doUserRegistration();
        }
      } else {
        _showError("No Internet");
      }
    } else {
      setState(() {
        _error = true;
      });
    }
  }

  // function to register
  _doUserRegistration() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final username = controllerUsername.text.trim();
      final password = controllerPassword.text.trim();
      final user = ParseUser.createUser(
          username.replaceAll(regex, ''), password, username);

      var response = await user.signUp();
      if (response.success) {
        _showSuccess("User was successfully Register!");
        setState(() {
          isLoggedIn = true;
        });
      } else {
        _showError(response.error!.message);
      }
    } else {
      setState(() {
        _error = true;
      });
    }
  }

//show pop dialog when login or register success
  _showSuccess(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () async {
                Navigator.of(context).pop();
                await push(NamedRoutes.main);
              },
            ),
          ],
        );
      },
    );
  }

//show pop dialog when login or register feild
  _showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
