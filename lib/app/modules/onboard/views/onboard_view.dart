import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
   const OnboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('OnboardView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            pageSnapping: true,
                            height: 0.6 * MediaQuery.of(context).size.height,
                            aspectRatio: 16/4,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            // autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.1,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              controller.updateIndex(index);
                            },
                          ),
                          itemCount: thug.length, itemBuilder: (BuildContext context, int index, int realIndex) {
                          return ListView(
                           physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 0 * MediaQuery.of(context).size.height,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0,bottom: 20),
                                child: Container(
                                  height: 0.3 * MediaQuery.of(context).size.height,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(thug[index].image),fit: BoxFit.fill,
                                    ),
                                  ),
                                  // child: Row(
                                  //   children: [
                                  //     Column(
                                  //       children: [
                                  //         Icon(Icons.star_border_purple500,color: Colors.yellow,),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(thug[index].text,style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    color: Theme.of(context).primaryColor,fontWeight: FontWeight.w900,
                                  ),),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(thug[index].text2,style: const TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w400),)),
                              ),
                               const SizedBox(
                                height: 2,
                              ),
                              Obx(() => DotsIndicator(
                                dotsCount: thug.length,
                                position: controller.currentIndex.value.toDouble(),
                                decorator: DotsDecorator(
                                  // color: Theme.of(context).splashColor, // Inactive color
                                  activeColor: Theme.of(context).primaryColorDark,
                                ),
                              )),
                            ],
                          );
                        },
                        ),
                      ),
                    ),
                  ]
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/Ilustration.jpg"),
              //
              //       fit: BoxFit.fill,
              //     ),
              //     color: Theme.of(context).primaryColor,
              //   ),
              // ),
              // Text("Gain total control \n of your money",style: TextStyle(
              //   fontFamily: 'Roboto',
              //   fontSize: 32,
              //   color: Theme.of(context).primaryColor,
              // ),),
              // Text("Become your own money manager and make \n every cent count",style: TextStyle(fontFamily: 'Roboto',fontSize: 16),),
            // SizedBox(
            //   height: 40,
            // ),
              const SizedBox(
                // height: 0 * MediaQuery.of(context).size.height,
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
                      Sign();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Sign()));
                    }, child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(child: Text('Sign Up',style: TextStyle(fontFamily: 'Roboto',color: Theme.of(context).primaryColorLight,fontSize: 16,fontWeight: FontWeight.bold),)))),
              ),
              const SizedBox(height: 23,),
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
                      login();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                    }, child:  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(child: Text('Login',style: TextStyle(fontFamily: 'Roboto',color: Theme.of(context).primaryColorLight,fontSize: 16,fontWeight: FontWeight.bold),)))),
              ),
                const SizedBox(
                  height: 10,
                ),
            ],
          ),
        ),
      ),
    );
  }

}
class Modele
{
  String? image;
  String? text;
  String? text2;


  Modele(this.image,this.text,this.text2);
}

List thug = modeleData.map((e) => Modele(e["image"],e["text"],e["text2"])).toList();

var modeleData = [
  {"image":"assets/images/Ilustration1.png","text":"Gain total control of your money","text2":"Become your own money manager and make  every cent count"},
  {"image":"assets/images/Illustration.png","text":"Know where Your money goes","text2": "Track your transaction easily, with categories and financial report"},
  {"image":"assets/images/Illustration3.png","text":"Planning ahead","text2" : "Setup your budget for each category so you in control"},
  // {"image":"assets/mov5.jpg","text":"New Season"},
  // {"image":"assets/mov 8.jpg","text":"Play Now"},
  // {"image":"assets/mov3.jpg","text":""}
  //


];
Sign() {
  Get.toNamed(
    Routes.SIGNUP,
  );

}
Allset() {
  Get.toNamed(
    Routes.ALLSET,
  );
}

// Login() {
//   Get.toNamed(
//     Routes.LOGIN,
//   );
// }
Future<void> login() async {
  await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.LOGIN);
}
Future<void> Reset() async {
  await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.RESET);
}
 addac() async {
  await
  Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.ADDNEW);
}
 Home() async {
  await
  // Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.HOME);
}
 Transaction() async {
  // await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.TRANSACTIONS);
}
 Statistics() async {
  // await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.STATISTICS);
}
profile() async {
  // await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.PROFILE);
}
Botto() async {
  await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.BOTTOM);
}
Addtr() async {
  await Future.delayed(const Duration(microseconds: 1)); // Change the duration as needed
  Get.toNamed(Routes.TAB);
}