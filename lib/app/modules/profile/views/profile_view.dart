import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_pages.dart';
import '../../Againpin/controllers/againpin_controller.dart';
import '../../signup/controllers/signupcontrollersecured.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  final SignupController signupController = Get.put(SignupController());
  @override
  final ProfileController controller = Get.put(ProfileController());
  // final Rx<XFile?> _pickedImage = Rx<XFile?>(null);
  // final CustomSecureStorageService _customSecureStorageService = CustomSecureStorageService();
  final SecureStorageServicepin _storageService = SecureStorageServicepin();
  // final SecureStorageService service = SecureStorageService();
  // Future<void> _pickImage(ImageSource source) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: source);
  //   if (image != null) {
  //     _pickedImage.value = image;
  //     await _customSecureStorageService.writeData('profile_image', image.path);
  //   }
  // }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title:  Text('Camera'.tr,style: const TextStyle(fontFamily: 'Roboto'),),
              onTap: () {
                controller.pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title:  Text('Gallery'.tr,style: const TextStyle(fontFamily: 'Roboto'),),
              onTap: () {
                controller.pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _loadProfileImage() async {
  //   final imagePath = await _customSecureStorageService.readData('profile_image');
  //   if (imagePath != null) {
  //     _pickedImage.value = XFile(imagePath);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // Load user data when the ProfileView is built
    signupController.getUserData();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        // Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/profile.jpg'),fit: BoxFit.fill),),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => _showImagePicker(context),
                                child: Obx(
                                      () => CircleAvatar(
                                        // foregroundColor: Theme.of(context).splashColor,
                                    radius: 50,
                                    backgroundImage: controller.pickedImage.value != null
                                        ? FileImage(File(controller.pickedImage.value!.path))
                                        : const AssetImage("assets/images/profile.png") as ImageProvider,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.1 * MediaQuery.of(context).size.width,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text(
                                "User name".tr,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Obx(
                                      () => Text(
                                    signupController.name.value,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.1 * MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.all(16.0),
                    child: Container(
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // color: Theme.of(context).primaryColorLight,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            // const SizedBox(
                            //   height: 40,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
                              child: Container(
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [Theme.of(context).primaryColorDark.withOpacity(0.5),Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)],begin: Alignment.topLeft,end: Alignment.bottomRight,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.SETTING);
                                  },
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child:  Icon(Icons.settings,color: Theme.of(context).secondaryHeaderColor),
                                      ),
                                    ),
                                    title:  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Settings".tr, style:  TextStyle(fontFamily: 'Roboto',fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorDark,)),
                                    ),
                                    trailing:  Icon(Icons.arrow_forward_ios,color:  Theme.of(context).cardColor,),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
                              child: Container(
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [Theme.of(context).primaryColorDark.withOpacity(0.5),Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)],begin: Alignment.topLeft,end: Alignment.bottomRight,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                   Get.toNamed(Routes.LANG);
                                  },
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(

                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Icon(Icons.language,color: Theme.of(context).secondaryHeaderColor),
                                      ),
                                    ),
                                    title:  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Language".tr, style:  TextStyle(fontFamily: 'Roboto',fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorDark,)),
                                    ),
                                    trailing:  Icon(Icons.arrow_forward_ios,color: Theme.of(context).cardColor,),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).primaryColorDark.withOpacity(0.5),
                                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Icon(Icons.import_export, color: Theme.of(context).secondaryHeaderColor),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Export Data".tr,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: MediaQuery.of(context).size.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).cardColor),
                                  onTap: () async {
                                    await controller.exportData(); // Call Export Function
                                  },
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).primaryColorDark.withOpacity(0.5),
                                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Icon(Icons.upload_file, color: Theme.of(context).secondaryHeaderColor),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Import Data".tr,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: MediaQuery.of(context).size.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).cardColor),
                                  onTap: () async {
                                    await controller.importData(); // Call Import Function
                                  },
                                ),
                              ),
                            ),
                            Padding(
                          padding: const EdgeInsets.only(top: 20.0,right: 20,bottom: 20,left: 20),
                          child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [Theme.of(context).primaryColorDark.withOpacity(0.5),Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)],begin: Alignment.topLeft,end: Alignment.bottomRight,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm Deletion",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w600 ),),
                                      content: const Text("Have you backed up your data? Are you sure you want to delete all?",style: TextStyle(fontFamily: 'Roboto'),),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          child: const Text("Cancel",style: TextStyle(fontFamily: 'Roboto'),),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop(); // Close the dialog
                                            await controller.logout();
                                            await _storageService.deletePin();
                                            Get.offNamed(Routes.ONBOARD);
                                          },
                                          child: const Text("Delete",style: TextStyle(fontFamily: 'Roboto',color: Colors.red),),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(Icons.delete_forever_sharp, color: Colors.red),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Delete All".tr, style:  TextStyle(fontFamily: 'Roboto',fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorDark,)),
                                ),
                                trailing:  Icon(Icons.arrow_forward_ios,color:  Theme.of(context).cardColor),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
