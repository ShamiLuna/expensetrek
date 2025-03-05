import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import '../../services/secure_storage_service.dart';
import '../../routes/app_pages.dart';
import '../Againpin/controllers/againpin_controller.dart';

class EnterPinScreen extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  final SecureStorageServicepin _storageService = SecureStorageServicepin();

  EnterPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Enter PIN',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children:[ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset('assets/images/logo.jpeg'),
              ),
              const Text(
                'Please enter your PIN',
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
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _pinController,
                  onCompleted: (pin) async {
                    final storedPin = await _storageService.getPin();
                    print("Entered PIN: $pin, Stored PIN: $storedPin"); // Debugging
                    if (storedPin == pin) {
                      Get.offAllNamed(Routes.BOTTOM); // Navigate to SetAccount screen
                    } else {
                      Get.snackbar('Error', 'Incorrect PIN',);
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
            ],
          ),]
        ),
      ),
    );
  }
}
