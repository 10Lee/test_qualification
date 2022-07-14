import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/global/dimension.dart';
import 'package:flutter_test1/pages/auth/auth_controller.dart';
import 'package:flutter_test1/globals/constant.dart';
import 'package:flutter_test1/widgets/header1.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: [
            SizedBox(height: Dimension.height100),
            Center(
              child: Header1(
                text: 'SIGN IN',
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimension.width20, vertical: Dimension.height20),
              width: Dimension.width100,
              height: Dimension.height300,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                onChanged: () => controller.enableBtn.value =
                    _globalKey.currentState!.validate(),
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Dimension.height10,
                          horizontal: Dimension.width20),
                      height: Dimension.height80,
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
                      margin: EdgeInsets.symmetric(
                        vertical: Dimension.height10,
                        horizontal: Dimension.width20,
                      ),
                      height: Dimension.height80,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Password"),
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
                        margin: EdgeInsets.symmetric(
                          vertical: Dimension.height20,
                          horizontal: Dimension.width20,
                        ),
                        child: ElevatedButton(
                          onPressed: controller.enableBtn.value
                              ? () => controller.redirect()
                              : null,
                          child: !(controller.isLoading.value)
                              ? const Center(
                                  child: Text("SIGN IN"),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimension.width50,
                                  ),
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
