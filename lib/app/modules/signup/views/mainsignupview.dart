import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:your_project_name/controllers/signup_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signupcontrollersecured.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          leading: GestureDetector(
              child: const Icon(Icons.arrow_back)),
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Name',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email address";
                    } else if (!value.contains("@") ||
                        !value.contains(".com")) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  cursorColor: const Color(0xFF008080),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: "Enter your email",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  ()=> TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.isShowPassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                    cursorColor: const Color(0xFF008080),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: "Enter Password",
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffix: Obx(
                        () => InkWell(
                          child: Icon(
                            controller.isShowPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onTap: () {
                            controller.togglePasswordVisibility();
                          },
                        ),

                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Obx(() {
                      IconData iconData = controller.isCheck.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank;
                      return IconButton(
                        icon: Icon(iconData),
                        onPressed: () {
                          controller.toggleCheckbox();
                        },
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.PRIVACY);
                              },
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: " By signing up, you agree to the,",
                                  children: [
                                    TextSpan(
                                      text:
                                          " Terms of \n Service and Privacy Policy.",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                        color: Theme.of(context).cardColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () async {
                    // ✅ Check if Terms and Conditions are accepted
                    if (!controller.isCheck.value) {
                      Get.snackbar(
                        "Terms and Conditions",
                        "You must accept the terms to sign up.",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    // ✅ Validate Email Format & Password Length
                    if (!GetUtils.isEmail(controller.emailController.text) ||
                        controller.passwordController.text.length < 6) {
                      Get.snackbar(
                        "Invalid Input",
                        "Please enter a valid email and a password with at least 6 characters.",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    // ✅ Get user inputs
                    String name = controller.nameController.text;
                    String email = controller.emailController.text;
                    String password = controller.passwordController.text;

                    // ✅ Sign up the user with Firebase Authentication
                    String? userId = await controller.signUpUser(name, email, password);

                    if (userId != null) {
                      // ✅ Store user data securely after successful signup
                      await controller.storeUserData(name, email, password);
                      print('✅ User data stored');

                      // ✅ Navigate to the login screen after signup
                      Get.toNamed(Routes.LOGIN);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Wrong Mail Id",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                    controller.nameController.clear();
                    controller.emailController.clear();
                    controller.passwordController.clear();
                  },

                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Or with", style: TextStyle(fontFamily: 'Roboto')),
              //   ],
              // ),
              // const SizedBox(height: 30),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {},
              //       child: Container(
              //         width: 50,
              //         height: 50,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(
              //             width: 1,
              //             color: Colors.grey.withOpacity(0.4),
              //           ),
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         child: Image.asset(
              //           "assets/images/google.png",
              //           width: 20,
              //           height: 20,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 5,
              //     ),
              //     Text(
              //       "Sign Up with Google",
              //       style: TextStyle(
              //         color: Theme.of(context).primaryColor,
              //         fontSize: 16,
              //         fontFamily: 'Roboto',
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).cardColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
