import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/detailincome_controller.dart';
import '../incomeedit.dart';

class DetailincomeView extends GetView<DetailincomeController> {
  final HomeController controllerr = Get.put(HomeController());
  final String itemKey;
  final _secureStorage = const FlutterSecureStorage();

  // DetailedTransactionScreen({required this.itemKey});

  DetailincomeView({super.key, required this.itemKey});

  Future<Map<String, String>> fetchDetails(String key) async {
    try {
      String? title = await _secureStorage.read(key: key);
      String? subTitle = await _secureStorage.read(key: "${key}_subTitle");
      String? amount = await _secureStorage.read(key: "${key}_amount");
      String? time = await _secureStorage.read(key: "${key}_time");
      String? tag = await _secureStorage.read(key: "${key}_tag");
      String? fileBase64 = await _secureStorage.read(key: "${key}_file");

      return {
        'title': title ?? '',
        'subTitle': subTitle ?? '',
        'amount': amount ?? '',
        'time': time ?? '',
        'tag': tag ?? '',
        'file': fileBase64 ?? '',
      };
    } catch (e) {
      print('Error fetching details: $e');
      return {};
    }
  }

  Future<File> _base64ToFile(String base64Str, String fileName) async {
    final decodedBytes = base64Decode(base64Str);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(decodedBytes);
    return file;
  }



  Widget _buildFileWidgeti(String? base64File) {
    if (base64File != null && base64File.isNotEmpty) {
      // Try to decode the file to see if it is an image
      try {
        final decodedBytes = base64Decode(base64File);
        final image = Image.memory(decodedBytes, fit: BoxFit.cover);
        // Check if it can be rendered as an image
        return image;
      } catch (e) {
        print("its a pdf");
      }
      // Handle as PDF
      return const Text('');
    } else {
      return const Text('');
    }
  }

  Widget _buildFileWidget(String? base64File, String fileName) {
    if (base64File != null && base64File.isNotEmpty) {
      // Determine the file type by the extension
      if (fileName.toLowerCase().endsWith('.pdf')) {
        return FutureBuilder<File>(
          future: _base64ToFile(base64File, fileName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error loading PDF',style: TextStyle(fontFamily: 'Roboto'),);
              }
              final file = snapshot.data!;
              return Container(
                color: Theme.of(context).primaryColorLight,
                height: 400,
                child: PDFView(
                  filePath: file.path,
                  fitEachPage: true,
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      } else {
        return const Text('');
      }
    } else {
      return Text('No file selected'.tr,style: const TextStyle(fontFamily: 'Roboto'),);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(children: [
          FutureBuilder<Map<String, String>>(
            future: fetchDetails(itemKey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error fetching details',style: TextStyle(fontFamily: 'Roboto'),));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No details available',style: TextStyle(fontFamily: 'Roboto'),));
              } else {
                final details = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 280,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xfff38dba0),
                                Color(0xFF0E7A53),
                              ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 15, right: 15, bottom: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.arrow_back_rounded,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor)),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Detailed Transaction".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto',
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.edit, color: Theme.of(context).scaffoldBackgroundColor),
                                      onPressed: () {
                                        Get.to(() => EditIncomeView(itemKey: itemKey));
                                      },
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.delete,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      onPressed: () async {
                                        await controllerr
                                            .deleteTitleFromStorage1(itemKey);
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(' \u{20B9}${details['amount']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: 30,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(' ${details['subTitle']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(' ${details['time']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, left: 25, right: 25, bottom: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Column(
                                  children: [
                                    Text(
                                      "Type".tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto',
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Income".tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto',
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                     Text(
                                      "Category".tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto',
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${details['title']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto',
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                // Column(
                                //   children: [
                                //     Text("Account",style: TextStyle( fontFamily: 'Roboto',fontSize: 16),),
                                //     Text("${details['account']}",style: TextStyle( fontFamily: 'Roboto',fontSize: 16),),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Description".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto',
                                            color:
                                                Theme.of(context).primaryColorDark)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('${details['subTitle']}',
                                        style: const TextStyle(fontSize: 18))),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Tag".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto',
                                            color:
                                            Theme.of(context).primaryColorDark)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('${details['tag']}',
                                        style: const TextStyle(fontSize: 18,fontFamily: 'Roboto'))),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Date and time Added".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto',
                                            color:
                                            Theme.of(context).primaryColorDark)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('${details['time']}',
                                        style: const TextStyle(fontSize: 18,fontFamily: 'Roboto'))),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            _buildFileWidgeti(details['file']),
                            const SizedBox(height: 25),
                            _buildFileWidget(details['file'], 'document.pdf'),
                          ],
                        ),
                      ),


                    ],
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }


}
