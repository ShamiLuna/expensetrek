import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  const ForgetpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Forget Password',style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w700),)),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Don't worry.\nEnter your email and we’ll send you a link to reset your \npassword.",
                      style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w600),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
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
                    hintText: "Enter your email",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    // fillColor: Colors.green.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon:  Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).brightness == Brightness.light ? const Color(0xFF000000) :Colors.white,
                    )),
                // hitText: "Email",
                // icon: "assets/img/email.png",
                keyboardType: TextInputType.emailAddress,
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
                    Mail();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Mail()));
                  }, child: const SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
            ),
          ],
        ),
      ),
    );
  }
}
Mail() {
  Get.toNamed(
    Routes.EMAILONWAY,
  );
}