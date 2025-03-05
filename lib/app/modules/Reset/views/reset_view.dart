import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../onboard/views/onboard_view.dart';
import '../controllers/reset_controller.dart';

class ResetView extends GetView<ResetController> {
  const ResetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password',style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isShowPassword.value,
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
                    // icon: Icon(Icons.password),
                    hintText: "New Password",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)),
                  suffix: Obx(()=>
                      InkWell(
                        child: Icon(
                            controller.isShowPassword.value ? Icons.visibility : Icons
                                .visibility_off),
                        onTap: () {
                          controller.isShowPassword.value =
                          !controller.isShowPassword.value;
                        },
                      ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isShowPassword.value,
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
                    // icon: Icon(Icons.password),
                    hintText: "Retype new Password",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)),
                  suffix: Obx(()=>
                      InkWell(
                        child: Icon(
                            controller.isShowPassword.value ? Icons.visibility : Icons
                                .visibility_off),
                        onTap: () {
                          controller.isShowPassword.value =
                          !controller.isShowPassword.value;
                        },
                      ),
                  ),

                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
                      login();
                    }, child: const SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
