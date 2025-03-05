import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import '../../onboard/views/onboard_view.dart';
import '../controllers/addnew_controller.dart';
class AddnewView extends GetView<AddnewController> {
  const AddnewView({super.key});

  // String? _selectedAccountType;
  // List<String> _accountTypes = ['Cash', 'Bank', 'Card'];
  // final AddnewController _controller = Get.put(AddnewController()); // Instantiate the controller
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>AddnewController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          title: const Text('Add new account',style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w700),),
          backgroundColor:  Theme.of(context).cardColor,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 80,),
              const Opacity(
                opacity: 0.64,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Balance',
                      style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Opacity(
                  opacity: 0.64,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: TextFormField(
                      style: TextStyle(fontSize: 80,color: Theme.of(context).primaryColor,fontFamily: 'Roboto'),
                    decoration: const InputDecoration(
                      hintText: "\u{20B9}00.0",
                             border: InputBorder.none,
                             // border: OutlineInputBorder(
                      //   borderSide:
                      //    BorderSide(color: Colors.white),
                      //
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             Expanded(
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),
                     topRight: Radius.circular(20.0),),
                   color: Theme.of(context).scaffoldBackgroundColor,
                 ),
                 child: ListView(children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 35),
                     child: TextFormField(
                       style: const TextStyle(fontFamily: 'Roboto'),
                       decoration: InputDecoration(
                           icon: const Icon(Icons.account_balance_wallet_outlined),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                           ),
                           // icon: Icon(Icons.person),
                           hintText: 'Bank A/c Name',
                       ),
                       // Text(
                       //   'SignupView is working',
                       //   style: TextStyle(fontSize: 20),
                       // ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: DropDownMultiSelect(

                       decoration:  const InputDecoration(
                       ),
                       options: controller.options,
                       whenEmpty: 'Account Type',
                       onChanged: (value) {
                         controller.selectedOptionList.value = value;
                         controller.selectedOption.value = "";
                         for (var element in controller.selectedOptionList.value) {
                           controller.selectedOption.value =
                               "${controller.selectedOption.value} $element";
                         }
                       },
                       selectedValues: controller.selectedOptionList.value,
                     ),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   Obx(() => Text(controller.selectedOption.value)),
                   const SizedBox(),
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
                           Allset();
                           // Mail();
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=> Mail()));
                         }, child: const SizedBox(
                         height: 56,
                         width: double.infinity,
                         child: Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
                   ),
                   const SizedBox(
                     height: 30
                     ,
                   ),
                 ]),
               ),
             ),
              // SizedBox(
              //   height: 40,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
