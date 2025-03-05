import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../routes/app_pages.dart';
import '../controllers/againpin_controller.dart';
// import '../../services/secure_storage_service.dart';
// import '../../routes/app_pages.dart';

class AgainpinView extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  final SecureStorageServicepin _storageService = SecureStorageServicepin();
  final FocusNode _focusNode = FocusNode();

  AgainpinView({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text('Confirm PIN',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please re-enter your PIN',
              style: TextStyle(fontSize: 24.0,fontFamily: 'Roboto',fontWeight: FontWeight.w600 ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 60.0,right: 60,top: 10),
              child: PinCodeTextField(
                keyboardType: const TextInputType.numberWithOptions(),
                onTap: () {
                  _focusNode.requestFocus();
                },
                focusNode: _focusNode,
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
                  inactiveFillColor: Theme.of(context).primaryColorDark,
                ),
                cursorColor: Theme.of(context).primaryColor,
                controller: _pinController,
                onCompleted: (pin) async {
                  final storedPin = await _storageService.getPin();
                  print("Re-entered PIN: $pin, Stored PIN: $storedPin"); // Debugging
                  if (storedPin == pin) {
                    // Get.offAllNamed(Routes.SETUPACCOUNT);
                     Get.offAllNamed(Routes.ALLSET);
                  } else {
                    Get.snackbar('Error', 'PIN does not match');
                  }
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
