// import 'package:expensetrek/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../controllers/passpin_controller.dart';
//
// class PasspinView extends GetView<PasspinController> {
//    PasspinView({super.key});
//    final formKey = GlobalKey<FormState>();
//    final FocusNode _focusNode = FocusNode();
//
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('PasspinView'),
//       //   centerTitle: true,
//       // ),
//       body:  SafeArea(
//         child: Center(
//           child:  Column(
//             children: [
//               const SizedBox(height: 0,),
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   "Let's setup Your PIN",
//                   style: TextStyle(fontSize: 24,fontFamily: 'Roboto',fontWeight: FontWeight.w600),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Form(
//                 key: formKey,
//                 child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 60),
//                     child:
//                     PinCodeTextField(
//                       onTap: () {
//                         _focusNode.requestFocus();
//                       },
//                       focusNode: _focusNode,
//                       // focusNode: FocusNode(),
//                       appContext: context,
//                       pastedTextStyle: TextStyle(
//                         color: Theme.of(context).cardColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       length: 4,
//                       obscureText: false,
//                       obscuringCharacter: '*',
//                       animationType: AnimationType.fade,
//                       validator: (v) {
//                         if (v!.length < 3) {
//                           return "Wrong Otp";
//                         } else {
//                           return null;
//                         }
//                       },
//                       pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.circle,
//                         // borderRadius: BorderRadius.circular(30),
//                         fieldHeight: 40,
//                         fieldWidth: 40,
//                         inactiveColor: Colors.grey,
//                         inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
//                         activeFillColor:
//                         controller.hasError ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
//                       ),
//                       cursorColor: Theme.of(context).primaryColor,
//                       animationDuration: const Duration(milliseconds: 300),
//                       textStyle:  TextStyle(fontSize: 20, height: 1.6,color: Theme.of(context).primaryColor),
//                       // backgroundColor: Colors.blue.shade50,
//                       enableActiveFill: true,
//                       errorAnimationController: controller.errorController,
//                       controller: controller.textEditingController,
//
//                       keyboardType: TextInputType.number,
//                       boxShadows: const [
//                         BoxShadow(
//                           offset: Offset(0, 1),
//                           color: Colors.black12,
//                           blurRadius: 10,
//                         )
//                       ],
//                       onCompleted: (v) {
//                         print("Completed");
//                         Get.toNamed(Routes.AGAINPIN);
//                       },
//                       // onTap: () {
//                       //   print("Pressed");
//                       // },
//                       onChanged: (value) {
//                         print(value);
//                         // setState(() {
//                         //   currentText = value;
//                         // });
//                       },
//                       beforeTextPaste: (text) {
//                         print("Allowing to paste $text");
//                         //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                         //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                         return true;
//                       },
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../routes/app_pages.dart';
import '../../Againpin/controllers/againpin_controller.dart';
// import '../../services/secure_storage_service.dart';
// import '../../routes/app_pages.dart';

class PasspinView extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  final SecureStorageServicepin _storageService = SecureStorageServicepin();

  PasspinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Set PIN',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please set your PIN',
              style: TextStyle(fontSize: 24.0,fontFamily: 'Roboto',fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 60.0,right: 60,top: 10),
              child: PinCodeTextField(
                keyboardType: const TextInputType.numberWithOptions(),
                appContext: context,
                length: 5,
                obscureText: true,
                obscuringCharacter: '*',
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(30),
                  fieldHeight: 40,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                cursorColor: Theme.of(context).primaryColor,
                controller: _pinController,
                onCompleted: (pin) async {
                  print("Entered PIN in PasspinView: $pin"); // Debugging
                  await _storageService.storePin(pin);
                  Get.offAllNamed(Routes.AGAINPIN); // Navigate to confirm PIN screen
                },
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
