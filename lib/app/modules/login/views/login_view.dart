// import 'package:expensetrek/app/modules/onboard/views/onboard_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../controllers/login_controller.dart';
//
// class LoginView extends GetView<LoginController> {
//   const LoginView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).primaryColorLight,
//           title: const Text('Login',style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w700)),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: ListView(
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: controller.emailController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter email address";
//                     } else if (!value.contains("@")) {
//                       return "Please Enter Valid Email";
//                     } else if (!value.contains(".com")) {
//                       return "Please Enter Valid Email";
//                     }
//                     return null;
//                   },
//                   cursorColor: const Color(0xFF008080),
//                   decoration: InputDecoration(
//                     icon: const Icon(Icons.email),
//                     hintText: "Enter your email",
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 20.0),
//                     // filled: true,
//                     // fillColor: Colors.green.withOpacity(0.5),
//                     border: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Colors.white70),
//                         borderRadius: BorderRadius.circular(10)),
//                         focusedBorder: OutlineInputBorder(
//                         borderSide:
//                          BorderSide(color: Theme.of(context).cardColor),
//                         borderRadius: BorderRadius.circular(10)),
//                     // suffixIcon:  Icon(
//                     //   Icons.email_outlined,
//                     //   // color: Theme.of(context).brightness == Brightness.light ? const Color(0xFF000000) :Colors.white,
//                     // ),
//                   ),
//                   // hitText: "Email",
//                   // icon: "assets/img/email.png",
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: controller.passwordController,
//                   obscureText: controller.passToggle,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter Password";
//                     } else if (value.length < 6) {
//                       return "Please enter at least 6 digit";
//                     }
//                     return null;
//                   },
//                   cursorColor: const Color(0xFF008080),
//                   decoration: InputDecoration(
//                       icon: const Icon(Icons.password),
//                       hintText: "Enter Password",
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 15.0, horizontal: 20.0),
//                       // filled: true,
//                       // fillColor: Colors.white.withOpacity(0.5),
//                       border: OutlineInputBorder(
//                           borderSide:
//                           const BorderSide(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Theme.of(context).cardColor),
//                           borderRadius: BorderRadius.circular(10)),
//                     suffix: Obx(()=>
//                         InkWell(
//                           child: Icon(
//                               controller.isShowPassword.value ? Icons.visibility : Icons
//                                   .visibility_off),
//                           onTap: () {
//                             controller.isShowPassword.value =
//                             !controller.isShowPassword.value;
//                           },
//                         ),
//                     ),),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       backgroundColor: Theme.of(context).primaryColorDark,
//                     ),
//                     onPressed: (){
//                       Pass();
//                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
//                     }, child: const SizedBox(
//                     height: 56,
//                     width: double.infinity,
//                     child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),)))),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//                   onTap: (){
//                     Forget();
//                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> Forget()));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 16.0),
//                     child: Text("Forget Password?",style: TextStyle(color: Theme.of(context).cardColor,fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Roboto'),),
//                   )),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                    Center(
//                      child: Text(
//                       "Don’t have an account yet?",
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700
//                       ),
//                                        ),
//                    ),
//                   GestureDetector(
//                     onTap: (){
//                       Sign();
//                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> Sign()));
//                     },
//                     child: Text(
//                       " Sign Up",
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                           color:  Theme.of(context).cardColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// Forget() {
//   Get.toNamed(
//     Routes.FORGETPASSWORD,
//   );
// }
//
// Pass() {
//   Get.toNamed(
//     Routes.PASSPIN,
//   );
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: const Text('Login', style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700)),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100.0,right: 100,top: 10,bottom: 10),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                      ),
                      child: Image.asset('assets/images/logo.jpeg',fit: BoxFit.fill,)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email address";
                    } else if (!value.contains("@")) {
                      return "Please Enter Valid Email";
                    } else if (!value.contains(".com")) {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                  cursorColor: const Color(0xFF008080),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: "Enter your email",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).cardColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  ()=> TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.isShowPassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Password";
                      } else if (value.length < 6) {
                        return "Please enter at least 6 digit";
                      }
                      return null;
                    },
                    cursorColor: const Color(0xFF008080),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: "Enter Password",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).cardColor),
                          borderRadius: BorderRadius.circular(10)),
                      suffix: Obx(() =>
                          InkWell(
                            child: Icon(
                                controller.isShowPassword.value ? Icons.visibility : Icons.visibility_off),
                            onTap: () {
                              controller.isShowPassword.value = !controller.isShowPassword.value;
                            },
                          ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() => controller.errorMessage.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
                  : const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    controller.validateLogin();
                  },
                  child:  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(child: Text('Login', style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto'))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Forget();
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 16.0),
              //     child: Text("Forget Password?", style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Roboto')),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Don’t have an account yet?",
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
                      Sign();
                    },
                    child: Text(
                      " Sign Up",
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
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Forget() {
  Get.toNamed(Routes.FORGETPASSWORD);
}

Sign() {
  Get.toNamed(Routes.SIGNUP);
}
