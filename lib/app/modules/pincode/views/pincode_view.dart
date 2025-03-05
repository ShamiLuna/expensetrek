import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../routes/app_pages.dart';
import '../controllers/pincode_controller.dart';

class PincodeView extends GetView<PincodeController> {
  PincodeView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:  Theme.of(context).cardColor,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text('Verification',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
          centerTitle: true,
        ),
        body: Center(
          child:  Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Enter your Verification Code",
                        style: TextStyle(fontSize: 34,fontFamily: 'Roboto',fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0,right: 60,top: 10),
                  child: PinCodeTextField(
                    onTap: () {
                      _focusNode.requestFocus();
                    },
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "Wrong Otp";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveColor: Colors.grey,
                      inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
                      activeFillColor:
                      controller.hasError ? Theme.of(context).canvasColor : Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle:  TextStyle(fontSize: 20, height: 1.6,color: Theme.of(context).primaryColor),
                    // backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    errorAnimationController: controller.errorController,
                    controller: controller.textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      print("Completed");
                      Get.toNamed(Routes.RESET);
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      // setState(() {
                      //   currentText = value;
                      // });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  controller.hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Expanded(child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("We send verification code to your email brajoma*****@gmail.com.You can Check your inbox.",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600),),
              )),
              Text("I didn’t received the code? Send again",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600,color: Theme.of(context).cardColor),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: (){
                     retype();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sonym()));
                    }, child: const SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(child: Text('Verify',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)))),
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

retype() {
  Get.toNamed(
    Routes.LOGIN,
  );
}
