import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/auth/auth_controller.dart';
import 'package:flutter_test1/globals/constant.dart';
import 'package:flutter_test1/widgets/header1.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String validatePass(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');
    if (!regex.hasMatch(value)) {
      return "Masukan password yang kuat";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: [
            const SizedBox(height: 100.0),
            Center(
              child: Header1(
                text: 'Login',
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              width: 100.0,
              height: 300.0,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      height: 80.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: kInputBorder,
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Tidak boleh kosong"),
                            EmailValidator(
                                errorText: "Masukan format email yang benar"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      height: 80.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Password"),
                          border: kInputBorder,
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'Tidak boleh kosong'),
                            MinLengthValidator(6,
                                errorText: 'Harus lebih dari 6 karakter'),
                            PatternValidator(r'^(?=.*?[A-Z])(?=.*?[0-9])',
                                errorText: 'Password tidak cukup kuat')
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        margin: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              controller.redirect();
                            }
                          },
                          child: !(controller.isLoading.value)
                              ? Center(
                                  child: Text("Login"),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: LinearProgressIndicator(),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
