import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../home/controllers/home_controller.dart';


class EditIncomeView extends StatefulWidget {
  final String itemKey;

  const EditIncomeView({super.key, required this.itemKey});

  @override
  _EditIncomeViewState createState() => _EditIncomeViewState();
}

class _EditIncomeViewState extends State<EditIncomeView> {
  final HomeController controller = Get.find<HomeController>();
  final _secureStorage = const FlutterSecureStorage();

  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _amountController = TextEditingController();
  final _timeController = TextEditingController();
  final _tagController = TextEditingController();
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _loadIncomeDetails();
  }

  Future<void> _loadIncomeDetails() async {
    try {
      String? title = await _secureStorage.read(key: widget.itemKey);
      String? subTitle = await _secureStorage.read(key: "${widget.itemKey}_subTitle");
      String? amount = await _secureStorage.read(key: "${widget.itemKey}_amount");
      String? time = await _secureStorage.read(key: "${widget.itemKey}_time");
      String? tag = await _secureStorage.read(key: "${widget.itemKey}_tag");

      setState(() {
        _titleController.text = title ?? '';
        _subTitleController.text = subTitle ?? '';
        _amountController.text = amount ?? '';
        _timeController.text = time ?? '';
        _tagController.text = tag ?? '';
      });
    } catch (e) {
      print('Error loading income details: $e');
    }
  }

  Future<void> _updateIncome() async {
    try {
      String title = _titleController.text;
      String subTitle = _subTitleController.text;
      String amount = _amountController.text;
      String time = _timeController.text;
      String tag = _tagController.text;

      await controller.updateIncome(
        widget.itemKey,
        title,
        subTitle,
        amount,
        time,
        tag,
        _selectedFile,
      );

      Get.back();
    } catch (e) {
      print('Error updating income: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Edit Income',style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updateIncome,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _subTitleController,
              decoration: const InputDecoration(labelText: 'Subtitle'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time'),
            ),
            TextField(
              controller: _tagController,
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
          ],
        ),
      ),
    );
  }
}
