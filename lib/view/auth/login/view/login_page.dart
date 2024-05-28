import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  bool _error = false;
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final username = controllerUsername.text.trim();
      final password = controllerPassword.text.trim();
      final user = ParseUser(username, password, null);

      var response = await user.login();

      if (response.success) {
        showSuccess("User was successfully login!");
        setState(() {
          isLoggedIn = true;
        });
      } else {
        doUserRegistration();
      }
    } else {
      setState(() {
        _error = true;
      });
    }
  }

  void doUserRegistration() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final username = controllerUsername.text.trim();
      final password = controllerPassword.text.trim();
      final user = ParseUser.createUser(username, password, username);

      var response = await user.signUp();
      if (response.success) {
        showSuccess("User was successfully login!");
        setState(() {
          isLoggedIn = true;
        });
      } else {
        showError(response.error!.message);
      }
    } else {
      setState(() {
        _error = true;
      });
    }
  }

  void showSuccess(String message) async {
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

  void showError(String errorMessage) {
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
                      enabled: !isLoggedIn,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      autofocus: false,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        filled: true,
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
                      onSaved: (value) {
                        _name = value!; // Save the entered name
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
                      enabled: !isLoggedIn,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textAlignVertical: TextAlignVertical.top,
                      style: regularTajawalStyle(
                          fontSize: FontSize.s19, color: ColorManager.black),
                      decoration: InputDecoration(
                        filled: true,
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
                            StringsManager.password,
                            style: regularTajawalStyle(
                                fontSize: FontSize.s16,
                                color: ColorManager.black),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
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
}
