import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../onboard/views/onboard_view.dart';
import '../controllers/emailonway_controller.dart';

class EmailonwayView extends GetView<EmailonwayController> {
  const EmailonwayView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mail1.png"),
                    // fit: BoxFit.fill,
                  ),
                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Your email is on the way",
                      style: TextStyle(fontSize: 24,fontFamily: 'Roboto',fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Check your email test@test.com and follow the instructions to reset your password.",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Theme.of(context).splashColor,
                  ),
                  onPressed: (){
                    login();

                  }, child: const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text('Back to Login',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
            ),
            const SizedBox(
              height: 20,
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
                    Reset();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
                  }, child: const SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Center(child: Text('Reset password',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
            ),
          ],
        ),
      ),
    );
  }
}
