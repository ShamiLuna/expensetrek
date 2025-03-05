
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class EditExpenseView extends StatefulWidget {
  final String itemKey;
  final Map<String, String> initialDetails;

  const EditExpenseView({super.key, required this.itemKey, required this.initialDetails});

  @override
  _EditExpenseViewState createState() => _EditExpenseViewState();
}

class _EditExpenseViewState extends State<EditExpenseView> {
  final _secureStorage = const FlutterSecureStorage();

  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _amountController = TextEditingController();
  final _timeController = TextEditingController();
  final _gstController = TextEditingController();
  final _receiptController = TextEditingController();
  final _invoiceController = TextEditingController();
  final _vendorController = TextEditingController();
  final _tagController = TextEditingController();
  final _accountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.initialDetails['title'] ?? '';
    _subTitleController.text = widget.initialDetails['subTitle'] ?? '';
    _amountController.text = widget.initialDetails['amount'] ?? '';
    _timeController.text = widget.initialDetails['time'] ?? '';
    _gstController.text = widget.initialDetails['gst'] ?? '';
    _receiptController.text = widget.initialDetails['receipt'] ?? '';
    _invoiceController.text = widget.initialDetails['invoice'] ?? '';
    _vendorController.text = widget.initialDetails['vendor'] ?? '';
    _tagController.text = widget.initialDetails['tag'] ?? '';
    _accountController.text = widget.initialDetails['account'] ?? '';
  }

  Future<void> _updateDetails() async {
    try {
      await _secureStorage.write(key: widget.itemKey, value: _titleController.text);
      await _secureStorage.write(key: "${widget.itemKey}_subTitle", value: _subTitleController.text);
      await _secureStorage.write(key: "${widget.itemKey}_amount", value: _amountController.text);
      await _secureStorage.write(key: "${widget.itemKey}_time", value: _timeController.text);
      await _secureStorage.write(key: "${widget.itemKey}_gst", value: _gstController.text);
      await _secureStorage.write(key: "${widget.itemKey}_receipt", value: _receiptController.text);
      await _secureStorage.write(key: "${widget.itemKey}_invoice", value: _invoiceController.text);
      await _secureStorage.write(key: "${widget.itemKey}_vendor", value: _vendorController.text);
      await _secureStorage.write(key: "${widget.itemKey}_tag", value: _tagController.text);
      await _secureStorage.write(key: "${widget.itemKey}_account", value: _accountController.text);

      Get.back();  // Go back to the previous screen
    } catch (e) {
      print('Error updating details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title:  const Text('Edit Expense',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updateDetails,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title',),
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
              controller: _gstController,
              decoration: const InputDecoration(labelText: 'GST'),
            ),
            TextField(
              controller: _receiptController,
              decoration: const InputDecoration(labelText: 'Receipt'),
            ),
            TextField(
              controller: _invoiceController,
              decoration: const InputDecoration(labelText: 'Invoice'),
            ),
            TextField(
              controller: _vendorController,
              decoration: const InputDecoration(labelText: 'Vendor'),
            ),
            TextField(
              controller: _tagController,
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(labelText: 'Account'),
            ),
          ],
        ),
      ),
    );
  }
}
