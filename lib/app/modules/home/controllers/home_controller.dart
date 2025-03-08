import 'dart:convert';
import 'dart:io';
import 'dart:math';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Budget/controllers/budget_controller.dart';
import '../../Tab/controllers/tab_controller.dart';




class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final FlutterSecureStorage _secureStorage;
  // ✅ Allow dependency injection
  HomeController({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();
  var fmitems = <CustomListItem>[].obs;
  var items = <CustomListItem>[].obs;
  var items1 = <CustomListItem1>[].obs;
  var bitems = <CustombudListItem1>[].obs;
  //BUDGET
  var currentMonth = DateTime.now().obs;
  /// LINEAR
  var selectedType = 'Monthly'.obs;
  ///linear
  var data = <String, double>{}.obs;
  ///TAB1
  var selectedDate = DateTime.now().obs;
  ///TAB2
  var selectedDatefi = DateTime.now().obs;
  final totalAmount = 0.0.obs;
  final totalAmount1 = 0.0.obs;
  final balance = 0.0.obs;
  ///HOMEPAGE
  var groupedItems = <String, List<CustomListItem>>{}.obs;
  var groupedItems1 = <String, List<CustomListItem1>>{}.obs;
  DateTime? selectedDatee;
  DateTime? selectedDate3;
  ///MONTH
  var selectedDate1 = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;
  //
  final TabBarController controller = Get.put(TabBarController());
  final BudgetController BController = Get.put(BudgetController());
  // final selectedDate = ValueNotifier<DateTime>(DateTime.now()).obs;
  //MONTH DATE
  var filteredItems = <CustomListItem>[].obs;
  var filteredItems1 = <CustomListItem1>[].obs;
  var differenceAmount = 0.0.obs;
  var ina =0.0.obs;
  var differenceProportion = 0.0.obs;
  //MONTH
  var isListViewVisible = false.obs;
  var isListViewVisiblei = false.obs;
  var isListViewVisiblem = false.obs;
  var isListViewVisiblemi = false.obs;
  var isFilterApplied = false.obs;
  var isFilterApplied1 = false.obs;
  var isFilterAppliedm = false.obs;
  var isFilterAppliedm1 = false.obs;
  //MONTH
  var filteredItemsm = <CustomListItem>[].obs;
  // var filteredItemsmstore = <CustomListItem>[].obs;
  var filteredItemsm1 = <CustomListItem1>[].obs;
  var filtercategorye = <CustomListItem>[].obs;
  // var filteredItemsm1store = <CustomListItem1>[].obs;
  var filtercategoryi = <CustomListItem1>[].obs;
  //transition
  var isExpensesListVisible = true.obs;
  var isIncomeListVisible = true.obs;
  var titleFilter = ''.obs;
  var titleFilter1 = ''.obs;
  // filterfinal
  var filteredTransactions = <Map<String, dynamic>>[].obs;// Stores filtered transactions
  var filteredIncomeTransactions = <Map<String, dynamic>>[].obs;
  var selectedFilter = 'Daily'.obs; // Default filter type
  var pickedDate = DateTime.now().obs;
  var pickedDate1 = DateTime.now().obs;
  List<CustomListItem> lastFilteredItemsm = [];
  List<CustomListItem1> lastFilteredItemsm1 = [];
  // var selectedTimePeriod = 'Daily'.obs;
  // var selectedDate = DateTime.now().obs;
  final ImagePicker _picker = ImagePicker();

  // final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // var selectedFile = Rx<File?>(null);
  final selectedFile = Rxn<File>();
  final selectedFile1 = Rxn<File>();
  // void applyFilter() {
  //   DateTime now = DateTime.now();
  //   DateFormat formatter = DateFormat('yyyy-MM-dd');
  //
  //   filteredTransactions.value = [...items, ...items1]
  //       .where((transaction) {
  //     if (transaction is CustomListItem) {
  //       DateTime transactionDate = DateTime.parse(transaction.time);
  //
  //       if (selectedFilter.value == 'Daily') {
  //         return formatter.format(transactionDate) == formatter.format(now);
  //       } else if (selectedFilter.value == 'Weekly') {
  //         DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  //         DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
  //         return transactionDate.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
  //             transactionDate.isBefore(endOfWeek.add(Duration(days: 1)));
  //       } else if (selectedFilter.value == 'Monthly') {
  //         return transactionDate.year == now.year && transactionDate.month == now.month;
  //       }
  //     }
  //     return false;
  //   })
  //       .map((transaction) => (transaction as CustomListItem).toMap()) // Convert to Map
  //       .toList();
  // }
  //linearchart
  Future<Map<String, double>> aggregateData(Future<List<CustomListItem>> futureItems, String type) async {
    Map<String, double> data = {};
    List<CustomListItem> items = await futureItems;

    for (var item in items) {
      DateTime date = DateTime.parse(item.time);
      String key;

      if (type == 'Monthly') {
        key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
      } else if (type == 'Daily') {
        key = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      } else { // Yearly
        key = '${date.year}';
      }

      double amount = double.tryParse(item.amount) ?? 0.0;
      if (data.containsKey(key)) {
        data[key] = data[key]! + amount;
      } else {
        data[key] = amount;
      }
    }

    return data;
  }

  void applyFilter() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    filteredTransactions.value = items
        .where((transaction) {
      DateTime transactionDate = DateTime.parse(transaction.time);
      if (selectedFilter.value == 'Daily') {
        return formatter.format(transactionDate) == formatter.format(now);
      } else if (selectedFilter.value == 'Weekly') {
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
        return transactionDate.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            transactionDate.isBefore(endOfWeek.add(Duration(days: 1)));
      } else if (selectedFilter.value == 'Monthly') {
        return transactionDate.year == now.year && transactionDate.month == now.month;
      }
      return false;
    })
        .map((transaction) => transaction.toMap())
        .toList();

    filteredIncomeTransactions.value = items1
        .where((transaction) {
      DateTime transactionDate = DateTime.parse(transaction.time);
      if (selectedFilter.value == 'Daily') {
        return formatter.format(transactionDate) == formatter.format(now);
      } else if (selectedFilter.value == 'Weekly') {
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
        return transactionDate.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            transactionDate.isBefore(endOfWeek.add(Duration(days: 1)));
      } else if (selectedFilter.value == 'Monthly') {
        return transactionDate.year == now.year && transactionDate.month == now.month;
      }
      return false;
    })
        .map((transaction) => transaction.toMap())
        .toList();
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
    applyFilter();
  }


  ///budget page
  void nextMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1, 1);
  }
  // Method to decrement the month
  void previousMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1, 1);
  }
 void updateType(String type) async {
    selectedType.value = type;
    fetchTitlesFromStorage();
    data.value = await aggregateData(Future.value(items), selectedType.value);
    print("Updated data: ${data.value}");

 }
  ///budget page
  // Method to filter budget items for the current month
  // List<CustombudListItem1> get filteredBitems {
  //   return bitems.where((item) {
  //     DateTime itemDate = DateTime.parse(item.time);
  //     return itemDate.year == currentMonth.value.year && itemDate.month == currentMonth.value.month;
  //   }).toList();
  // }

  ///main list BUDGET
  List<CustombudListItem1> get filteredBitems {
    return bitems.where((item) {
      DateTime itemDate = DateTime.parse(item.time);
      return itemDate.year == currentMonth.value.year && itemDate.month == currentMonth.value.month;
    }).toList();
  }

  // Function to format the date
  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat.yMMMd().format(dateTime); // Customize the format as needed
  }

  Future<void> pickImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        selectedFile.value = File(pickedFile.path);
        // await saveFileSecurely(selectedFile.value!,'');
      }
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> pickImageFromCamera1() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        selectedFile1.value = File(pickedFile.path);
        // await saveFileSecurely(selectedFile.value!,'');
      }
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedFile.value = File(pickedFile.path);
        // await saveFileSecurely(selectedFile.value!,'');
      }
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> pickImageFromGallery1() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedFile1.value = File(pickedFile.path);
        // await saveFileSecurely(selectedFile.value!,'');
      }
    } catch (e) {
      _showError(e);
    }
  }

  Future<File?> pickDocument() async {
    if (await _requestStoragePermission()) {
      try {
        final result = await FilePicker.platform.pickFiles(type: FileType.any);
        if (result != null && result.files.single.path != null) {
          selectedFile.value = File(result.files.single.path!);

          // await saveFileSecurely(selectedFile.value!,'');
        } else {
          selectedFile.value = null;

          Get.snackbar('Error', 'No file selected or file path is invalid.');
        }
      } catch (e) {
        // openAppSettings();
        _showError(e);
      }
    } else {
      // Inform the user about the need for storage permission
      Get.defaultDialog(
        title: 'Permission Required',
        middleText:
        'To pick files, please grant the storage permission in the app settings.',
        actions: [
          TextButton(
            onPressed: () {
              // Open app settings for the user to grant permission
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      );
    }
    return null;
  }

  Future<File?> pickDocumenti() async {
    if (await _requestStoragePermission()) {
      try {
        final result = await FilePicker.platform.pickFiles(type: FileType.any);
        if (result != null && result.files.single.path != null) {
          final pickedFile = File(result.files.single.path!);
          // selectedFile1.value = File(result.files.single.path!);
          selectedFile1.value = pickedFile;
          print('Picked file: ${pickedFile.path}');
          // await saveFileSecurely(selectedFile.value!,'');
        } else {
          selectedFile1.value = null;

          Get.snackbar('Error', 'No file selected or file path is invalid.');
        }
      } catch (e) {
        // openAppSettings();
        _showError(e);
      }
    } else {
      // Inform the user about the need for storage permission
      Get.defaultDialog(
        title: 'Permission Required',
        middleText:
        'To pick files, please grant the storage permission in the app settings.',
        actions: [
          TextButton(
            onPressed: () {
              // Open app settings for the user to grant permission
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      );
    }
    return null;
  }

  Future<bool> _requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
      return true;
    } else {
      if (await Permission.storage.request().isGranted) {
        return true;
      } else if (await Permission.manageExternalStorage.isGranted) {
        return true;
      } else if (await Permission.manageExternalStorage.request().isGranted) {
        return true;
      } else {
        openAppSettings();
        Get.snackbar('Permission Denied',
            'Storage permission is required to pick files');
        return false;
      }
    }
  }

  Future<void> downloadFile(File file) async {
    if (await _requestStoragePermission()) {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final newFilePath = '${directory.path}/${file.path.split('/').last}';
        final newFile = await file.copy(newFilePath);
        Get.snackbar(
            'Download Complete', 'File downloaded to: ${newFile.path}');
      } else {
        Get.snackbar('Error', 'Failed to get external storage directory.');
      }
    }
  }

  void _showError(dynamic error) {
    Get.snackbar('Error', error.toString());
  }

//filter transaction page
  void filterItemsByDate(DateTime date) async{
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    // filteredItems.value = allitems.where((item) => item.date == selectedDate.value).toList();
    filteredItems.value = items.where((item) {
      String itemDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(item.time));
      print('Comparing item date: $itemDate');
      return itemDate == formattedDate;
    }).toList();
    isFilterApplied.value = true;
    print('Filtered items: ${filteredItems.length}');
  }


// Method to filter items by month and year
  void filterItemsByMonthYear(DateTime date) async {
    String month = DateFormat('MM').format(date);
    String year = DateFormat('yyyy').format(date);
    filteredItemsm.value = items.where((item) {
      String itemMonth = DateFormat('MM').format(DateTime.parse(item.time));
      String itemYear = DateFormat('yyyy').format(DateTime.parse(item.time));
      return itemMonth == month && itemYear == year;
    }).toList();
    isFilterAppliedm.value = true;

    // Save the filtered items only if it's not empty
    if (filteredItemsm.isNotEmpty) {
      lastFilteredItemsm = filteredItemsm;
    }
  }

// Method to filter items by date
  void filterItemsByDate1(DateTime date) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    print('Filtering items for date: $formattedDate');
    filteredItems1.value = items1.where((item) {
      String itemDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(item.time));
      print('Comparing item date: $itemDate');
      return itemDate == formattedDate;
    }).toList();
    isFilterApplied1.value = true;
    print('Filtered Income items: ${filteredItems1.length}');

    // Save the filtered items only if it's not empty
    if (filteredItems1.isNotEmpty) {
      lastFilteredItemsm1 = filteredItems1;
    }
  }

// Method to apply title filter
  void applyTitleFilter() async {
    filterItemsByMonthYear(pickedDate.value);

    if (titleFilter.value.isEmpty) {
      // No title filter applied, use the full list
      filteredItemsm.assignAll(lastFilteredItemsm); // Replace with actual full list variable
    } else {
      // Split the title filter by comma to handle multiple titles
      List<String> titles = titleFilter.value.toLowerCase().split(',');

      // Apply title filter
      var filtered = filteredItemsm.where((item) {
        String itemTitleLower = item.title.toLowerCase();
        for (var title in titles) {
          if (!itemTitleLower.contains(title)) {
            return false; // If any title does not match, exclude this item
          }
        }
        return true; // Include item if all titles match
      }).toList();

      // Check if the filtered list is empty
      if (filtered.isEmpty) {
        print("No matches found");
        // Show a dialog box to inform the user
        Get.defaultDialog(
            title: "No matches found",
            middleText: "No items matched your filter criteria.",
            onConfirm: () => Get.back(),
            textConfirm: "OK"
        );
      } else {
        filteredItemsm.assignAll(filtered);
      }
    }
    fetchTitlesFromStorage();
    fetchTitlesFromStorage1();
  }


// Method to apply title filter 1
  void applyTitleFilter1() async {
    filterItemsByMonthYear1(pickedDate1.value);

    if (titleFilter1.value.isEmpty) {
      // No title filter applied, use the full list
      filteredItemsm1.assignAll(lastFilteredItemsm1); // Replace with actual full list variable
    } else {
      // Split the title filter by comma to handle multiple titles
      List<String> titles = titleFilter1.value.toLowerCase().split(',');

      // Apply title filter
      var filtered = filteredItemsm1.where((item) {
        String itemTitleLower = item.title.toLowerCase();
        for (var title in titles) {
          if (!itemTitleLower.contains(title)) {
            return false; // If any title does not match, exclude this item
          }
        }
        return true; // Include item if all titles match
      }).toList();

      // Check if the filtered list is empty
      if (filtered.isEmpty) {
        print("No matches found");
        // Show a dialog box to inform the user
        Get.defaultDialog(
            title: "No matches found",
            middleText: "No items matched your filter criteria.",
            onConfirm: () => Get.back(),
            textConfirm: "OK"
        );
      } else {
        filteredItemsm1.assignAll(filtered);
      }
    }
    fetchTitlesFromStorage();
    fetchTitlesFromStorage1();
  }



  void updatePickedDate1(DateTime date) {
    pickedDate1.value = date;
    applyTitleFilter1();
  }
  void updatePickedDate(DateTime date) {
    pickedDate.value = date;
    applyTitleFilter();
  }
  void filterItemsByMonthYear1(DateTime date) async{
    String month = DateFormat('MM').format(date);
    String year = DateFormat('yyyy').format(date);
    filteredItemsm1.value = items1.where((item) {
      String itemMonth = DateFormat('MM').format(DateTime.parse(item.time));
      String itemYear = DateFormat('yyyy').format(DateTime.parse(item.time));
      return itemMonth == month && itemYear == year;
    }).toList();
    isFilterAppliedm1.value = true;
    lastFilteredItemsm1 = filteredItemsm1;
  }

  CustomListItem? getHighestAmountItem() {
    if (filteredItemsm.isEmpty) {
      return null; // Return null if the list is empty
    }
    return filteredItemsm.reduce((curr, next) => double.parse(curr.amount) > double.parse(next.amount) ? curr : next);
  }

  CustomListItem1? getHighestAmountItem1() {
    if (filteredItemsm1.isEmpty) {
      return null; // Return null if the list is empty
    }
    return filteredItemsm1.reduce((curr, next) => double.parse(curr.amount) > double.parse(next.amount) ? curr : next);
  }
///date filter transaction page
  void updateSelectedDate(DateTime date) {
    fetchTitlesFromStorage();
    // filteredItems;
    selectedDate1.value = date;
    // filteredItems();
    filteredItemsm;
    filterItemsByDate(date);
  }
  ///date filter transaction page
  void updateSelectedDate2(DateTime date) {
    fetchTitlesFromStorage1();
    // filteredItems1;
    selectedDate2.value = date;
    // filteredItems1();
    filterItemsByDate1(date);
    filteredItemsm1;
  }

//filter transaction page

  @override
  Future<void> onInit() async {
    super.onInit();
    // Fetch titles from secured storage
    await fetchTitlesFromStorage();
    await fetchTitlesFromStorage1();
    await fetchbudTitlesFromStorage();
    items();
    items1();
    differenceAmount;
    ina;
    updateTotalAmount();
    updateTotalAmount1();
    updateBalance();
    deleteTitleFromStorage;
    deleteTitleFromStorage1;
    deletebTitleFromStorage;
    updateSelectedDate;
    updateSelectedDate2;
    filteredItems();
    filteredItems1();
    filteredItemsm();
    filteredItemsm1();
    categorizeItems();
    categorizeItems1();
    data.value = await aggregateData(Future.value(items), selectedType.value);
  }


  Future<void> migrateStorageIfNeeded() async {
    const versionKey = 'app_version';
    const currentVersion = '1.1.0'; // Example: new version
    final storedVersion = await _secureStorage.read(key: versionKey);

    if (storedVersion != currentVersion) {
      // Perform necessary migrations
      // Update the stored version
      await _secureStorage.write(key: versionKey, value: currentVersion);
    }
  }

  ///pie
  List<PieChartSectionData> getPieChartData() {
    Map<String, double> categoryTotals = {};

    for (var item in items) {
      // Normalize the title to lowercase to avoid case sensitivity issues
      String normalizedTitle = item.title.toLowerCase();

      if (categoryTotals.containsKey(normalizedTitle)) {
        categoryTotals[normalizedTitle] =
            categoryTotals[normalizedTitle]! + double.parse(item.amount);
      } else {
        categoryTotals[normalizedTitle] = double.parse(item.amount);
      }
    }

    if (categoryTotals.isEmpty) {
      return []; // Return an empty list if there are no category totals
    }

    double minAmount = categoryTotals.values.reduce((a, b) => a < b ? a : b);
    double maxAmount = categoryTotals.values.reduce((a, b) => a > b ? a : b);

    return categoryTotals.entries.map((entry) {
      return PieChartSectionData(
        color: getColorBasedOnAmount(entry.key, entry.value, minAmount, maxAmount),
        value: entry.value,
        title: '',
        radius: 30,
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
  List<Map<String, dynamic>> getSortedCategories() {
    Map<String, double> categorySums = {};

    for (var item in items) {
      String category = item.title.toLowerCase();
      double amount = double.tryParse(item.amount) ?? 0.0;

      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }

    List<Map<String, dynamic>> sortedList = categorySums.entries.map((entry) {
      return {
        "category": entry.key,
        "amount": entry.value,
        "color": categoryColors[entry.key] ?? getColorFromString(entry.key),
      };
    }).toList();

    sortedList.sort((a, b) => b["amount"].compareTo(a["amount"])); // Sort descending

    return sortedList;
  }

  Color getColorBasedOnAmount(String title, double amount, double minAmount, double maxAmount) {
    // Normalize the title to lowercase to avoid case sensitivity issues
    String normalizedTitle = title.toLowerCase();
    Color baseColor = categoryColors[normalizedTitle] ?? getColorFromString(normalizedTitle); // Default to teal if the category is not found
    return baseColor;
  }

  final Map<String, Color> categoryColors = {
    "food": Colors.red,
    "transport": Colors.blue,
    "entertainment": Colors.green,
    "shopping": Colors.orange,
    "bills": Colors.purple,
    // "other": Colors.grey,
    "education": Colors.yellow,
    "office": Colors.pink,
  };


  List<PieChartSectionData> getPieChartData1() {
    Map<String, double> categoryTotals = {};

    for (var item in items1) {
      // Normalize the title to lowercase to avoid case sensitivity issues
      String normalizedTitle = item.title.toLowerCase();

      if (categoryTotals.containsKey(normalizedTitle)) {
        categoryTotals[normalizedTitle] =
            categoryTotals[normalizedTitle]! + double.parse(item.amount);
      } else {
        categoryTotals[normalizedTitle] = double.parse(item.amount);
      }
    }

    if (categoryTotals.isEmpty) {
      return []; // Return an empty list if there are no category totals
    }

    double minAmount = categoryTotals.values.reduce((a, b) => a < b ? a : b);
    double maxAmount = categoryTotals.values.reduce((a, b) => a > b ? a : b);

    return categoryTotals.entries.map((entry) {
      return PieChartSectionData(
        color: getColorBasedOnAmount(entry.key, entry.value, minAmount, maxAmount),
        value: entry.value,
        title: '',
        radius: 30,
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
  Color getColorFromString(String input) {
    final hash = input.hashCode;
    final random = Random(hash);
    return Color.fromARGB(
      255, // Full opacity
      100 + random.nextInt(156), // Red value between 100 and 255
      100 + random.nextInt(156), // Green value between 100 and 255
      100 + random.nextInt(156), // Blue value between 100 and 255
    );
  }
  List<Map<String, dynamic>> getSortedCategories1() {
    Map<String, double> categorySums = {};

    for (var item in items1) {
      String category = item.title.toLowerCase();
      double amount = double.tryParse(item.amount) ?? 0.0; // ✅ Fix parsing issue

      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }

    List<Map<String, dynamic>> sortedList = categorySums.entries.map((entry) {
      return {
        "category": entry.key,
        "amount": entry.value,
        "color": categoryColors[entry.key] ?? getColorFromString(entry.key),
      };
    }).toList();

    sortedList.sort((a, b) => b["amount"].compareTo(a["amount"])); // ✅ Fix null error

    return sortedList;
  }


  ///pie

  Future<void> fetchTitlesFromStorage1() async {
    try {
      // Fetch keys from secured storage
      List<String> keys =
      await _secureStorage.readAll().then((value) => value.keys.toList());
      print('All keys: $keys');
      items1.clear();

      // Iterate through keys and add titles to the list
      for (String key in keys) {
        if (!key.startsWith("income_")) {
          continue; // Skip non-income keys
        }

        String? title = await _secureStorage.read(key: key);
        String? subTitle = await _secureStorage.read(key: "${key}_subTitle");
        String? amount = await _secureStorage.read(key: "${key}_amount");
        String? time = await _secureStorage.read(key: "${key}_time");
        String? tag = await _secureStorage.read(key: "${key}_tag");
        String? fileBase64 = await _secureStorage.read(key: "${key}_file");

        if (title != null && amount != null && time != null) {
          items1.add(CustomListItem1(
            key: key,
            title: title,
            subTitle: subTitle ?? '',
            amount: amount,
            time: time,
            tag: tag ?? '',
            fileBase64: fileBase64 ?? '',
          ));
        }
      }

      getHighestAmountTitle;
      filterByTitle;
      filterByMonth;
      filteredItems;
      filteredItemsm;
      updateSelectedDate2;
      updateTotalAmount1();
      categorizeItems1();
      selectedDate1();
    } catch (e) {
      print('Error fetching income titles: $e');
    }
  }

  Future<void> fetchTitlesFromStorage() async {
    try {
      Map<String, String> storageData = await _secureStorage.readAll() ?? <String, String>{};

      List<String> keys = storageData.keys.toList();
      print('All keys: $keys');

      items.clear();
      for (String key in keys) {
        if (!key.startsWith("expense_")) continue;

        String? title = storageData[key];
        String? amount = storageData["${key}_amount"];
        String? time = storageData["${key}_time"];

        if (title != null && amount != null && time != null) {
          items.add(CustomListItem(
            key: key,
            title: title,
            subTitle: storageData["${key}_subTitle"] ?? '',
            amount: amount,
            time: time,
            gst: storageData["${key}_gst"] ?? '',
            receipt: storageData["${key}_receipt"] ?? '',
            invoice: storageData["${key}_invoice"] ?? '',
            vendor: storageData["${key}_vendor"] ?? '',
            tag: storageData["${key}_tag"] ?? '',
            account: storageData["${key}_account"] ?? '',
            fileBase64: storageData["${key}_file"] ?? '',
          ));
        }
      }

      totalAmount.value = calculateTotalAmount();
      data.value = await aggregateData(Future.value(items), selectedType.value);

      updateSelectedDate;
      updateTotalAmount();
      categorizeItems();
      applyFilter();
    } catch (e) {
      print('Error fetching expense titles: $e');
    }
  }



  ///today,yesterday main
  void categorizeItems() {
    final now = DateTime.now();
    final Map<String, List<CustomListItem>> categorized = {};

    for (final item in items) {
      final itemDate = DateTime.parse(item.time);
      String key;

      if (isSameDay(itemDate, now)) {
        key = 'Today';
      } else if (isSameDay(itemDate, now.subtract(const Duration(days: 1)))) {
        key = 'Yesterday';
      } else {
        key = DateFormat('EEEE, MMMM d').format(itemDate);
      }

      if (categorized.containsKey(key)) {
        categorized[key]!.add(item);
      } else {
        categorized[key] = [item];
      }
    }

    groupedItems.value = categorized;
  }
  ///today,yesterday main
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  ///today,yesterday main
  void setSelectedDate(DateTime? date) {
    selectedDatee = date;
    updateFilteredItems();
  }





///date wise in home list
  void updateFilteredItems() {
    if (selectedDatee == null) {
      categorizeItems();
    } else {
      final filtered = items.where((item) {
        final itemDate = DateTime.parse(item.time);
        return isSameDay(itemDate, selectedDatee!);
      }).toList();
      final categorized = <String, List<CustomListItem>>{
        DateFormat('EEEE, MMMM d').format(selectedDatee!): filtered
      };
      groupedItems.value = categorized;
    }
  }

  ///today,yesterday main
  void categorizeItems1() {
    final now = DateTime.now();
    final Map<String, List<CustomListItem1>> categorized1 = {};

    for (final item in items1) {
      final itemDate = DateTime.parse(item.time);
      String key1;

      if (isSameDay1(itemDate, now)) {
        key1 = 'Today';
      } else if (isSameDay1(itemDate, now.subtract(const Duration(days: 1)))) {
        key1 = 'Yesterday';
      } else {
        key1 = DateFormat('EEEE, MMMM d').format(itemDate);
      }

      if (categorized1.containsKey(key1)) {
        categorized1[key1]!.add(item);
      } else {
        categorized1[key1] = [item];
      }
    }

    groupedItems1.value = categorized1;
  }
///today,yesterday main
  bool isSameDay1(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  ///today,yesterday main

  ///datewise in home list
  void setSelectedDate1(DateTime? date) {
    selectedDate3 = date;
    updateFilteredItems1();
  }
  ///datewise in home list
  void updateFilteredItems1() {
    if (selectedDate3 == null) {
      categorizeItems1();
    } else {
      final filtered1 = items1.where((item) {
        final itemDate = DateTime.parse(item.time);
        return isSameDay1(itemDate, selectedDate3!);
      }).toList();
      final categorized1 = <String, List<CustomListItem1>>{
        DateFormat('EEEE, MMMM d').format(selectedDate3!): filtered1
      };
      groupedItems1.value = categorized1;
    }
  }
  ///datewise in home list

  Future<void> addItem({
    required String key,
    required String title,
    required String subTitle,
    required String amount,
    required String time,
    required String gst,
    required String receipt,
    required String invoice,
    required String vendor,
    required String tag,
    required String account,
    String? fileBase64,
  }) async {
    items.add(CustomListItem(
      key: key,
      title: title,
      subTitle: subTitle,
      amount: amount,
      time: time,
      gst: gst,
      receipt: receipt,
      invoice: invoice,
      vendor: vendor,
      tag: tag,
      account: account,
      fileBase64: fileBase64 ?? '',
    ));
    // Await the aggregateData method
    data.value = await aggregateData(Future.value(items), selectedType.value);
    // data.value = aggregateData(items, selectedType.value);
    filteredItems();
    differenceAmount;
    data;
    updateTotalAmount();
    selectedDate2();
    groupedItems();
    categorizeItems();
    print('Item added: $title');
    print('Item added with key: $key');
  }

  Future<void> addItem1({
    required String key,
    required String title,
    required String subTitle,
    required String amount,
    required String time,
    required String tag,
    String? fileBase64,
  }) async {
    items1.add(CustomListItem1(
      key: key,
      title: title,
      subTitle: subTitle,
      amount: amount,
      time: time,
      // category: category, receipt: receipt,
      // invoice: invoice,
      tag: tag,
      fileBase64: fileBase64 ?? '',
    ));
    filteredItems();
    updateTotalAmount1();
    selectedDate1();
    // selectedDate2();
    groupedItems1();
    categorizeItems1();

  }

  Future<void> writeExpenseToStorage(
      String title, String subTitle, String amount, String time, String gst,
      String receipt, String invoice, String vendor, String tag, String account, File? file) async {
    await fetchTitlesFromStorage();
    filteredItems;
    deleteTitleFromStorage;
    try {
      String key = "expense_${DateTime.now().millisecondsSinceEpoch}";

      await _secureStorage.write(key: key, value: title);
      await _secureStorage.write(key: "${key}_amount", value: amount);
      await _secureStorage.write(key: "${key}_time", value: time);

      if (file != null) {
        final bytes = await file.readAsBytes();
        final base64File = base64Encode(bytes);
        await _secureStorage.write(key: "${key}_file", value: base64File);
      }

      addItem(
        key: key, title: title, subTitle: subTitle, amount: amount, time: time,
        gst: gst, receipt: receipt, invoice: invoice, vendor: vendor, tag: tag, account: account,
        fileBase64: file != null ? base64Encode(await file.readAsBytes()) : '',
      );

      await fetchTitlesFromStorage();
      updateTotalAmount();
      calculateAndSetDifference(title,DateTime.parse(time));
      print('Data successfully written to storage with key: $key');
    } catch (e) {
      print('Error writing title to storage: $e');
    }
  }


  Future<void> writeIncomeToStorage(String title, String subTitle,
      String amount, String time, String tag, File? file) async {
    filteredItems1;
    await fetchTitlesFromStorage1();
    deleteTitleFromStorage;
    // await _secureStorage.deleteAll();
    // Generate a unique key for the title
    try {
      String currentTime = DateTime.now().toIso8601String();
      // Generate a unique key for the title
      String key = "income_${DateTime.now().millisecondsSinceEpoch}";
      // String key1 = DateTime.now()
      //     .millisecondsSinceEpoch
      //     .toString(); //income, only wording
      // await _secureStorage.write(key: key, value: title);
      // Write the title and other details to secured storage
      await _secureStorage.write(key: key, value: title);
      await _secureStorage.write(key: "${key}_subTitle", value: subTitle);
      await _secureStorage.write(key: "${key}_amount", value: amount);
      await _secureStorage.write(key: "${key}_time", value: time);
      await _secureStorage.write(key: "${key}_tag", value: tag);
      String? fileBase64;
      if (file != null) {
        final bytes = await file.readAsBytes();
        final base64File = base64Encode(bytes);
        await _secureStorage.write(key: "${key}_file", value: base64File);
        print('File stored: ${file.path}');
      }
      // await _secureStorage.write(key: "${key}_receipt", value: receipt);
      // await _secureStorage.write(key: "${key}_receipt", value: invoice);
      // Add the title and details to the list
      addItem1(
        key: key,
        title: title,
        subTitle: subTitle,
        amount: amount,
        time: time,
        // gst: gst, receipt: receipt, invoice: invoice,
        tag: tag,
        fileBase64: fileBase64,
      );

      await fetchTitlesFromStorage1();
      updateSelectedDate2;
      updateFilter(selectedFilter.value);
      // data.value = aggregateData(items, selectedType.value);
      //   calculateAndSetDifference(title);
      print('Added');
    } catch (e) {
      print('Error writing title to storage: $e');
    }
  }

  Future<void> deleteTitleFromStorage(String key) async {
    try {
      await _secureStorage.delete(key: key);
      await _secureStorage.delete(key: "${key}_title");
      await _secureStorage.delete(key: "${key}_subTitle");
      await _secureStorage.delete(key: "${key}_amount");
      await _secureStorage.delete(key: "${key}_time");
      await _secureStorage.delete(key: "${key}_receipt");
      await _secureStorage.delete(key: "${key}_gst");
      await _secureStorage.delete(key: "${key}_account");
      await _secureStorage.delete(key: "${key}_invoice");
      await _secureStorage.delete(key: "${key}_vendor");
      await _secureStorage.delete(key: "${key}_tag");
      await _secureStorage.delete(key: "${key}_file");
      items.removeWhere((item) => item.key == key);
      updateTotalAmount();
      filterItemsByDate(selectedDate1.value);
      categorizeItems();
    } catch (e) {
      print('Error deleting title from storage: $e');
    }
  }


///expenses
  void updateTotalAmount() {
    double sum = items.fold(0, (sum, item) => sum + double.parse(item.amount));
    totalAmount.value = sum;
    updateBalance();
  }

  Future<void> deleteTitleFromStorage1(String key) async {
    try {
      await _secureStorage.delete(key: key);
      await _secureStorage.delete(key: "${key}_title");
      await _secureStorage.delete(key: "${key}_subTitle");
      await _secureStorage.delete(key: "${key}_amount");
      await _secureStorage.delete(key: "${key}_time");
      await _secureStorage.delete(key: "${key}_tag");
      await _secureStorage.delete(key: "${key}_file");
      // await _secureStorage.delete(key: "${key}_category" );
      // await _secureStorage.delete(key: "${key}_receipt" );
      // await _secureStorage.delete(key: "${key}_invoice" );
      items1.removeWhere((item) => item.key == key);
      updateTotalAmount1();
      filterItemsByDate1(selectedDate2.value);
      categorizeItems1();
    } catch (e) {
      print('Error deleting title from storage: $e');
    }
  }


///income
  void updateTotalAmount1() {
    double sum = items1.fold(0, (sum, item) => sum + double.parse(item.amount));
    totalAmount1.value = sum;
    updateBalance();
  }
///main
  void updateBalance() {
    balance.value = totalAmount1.value - totalAmount.value;
  }
///tab 1
  void updateSelectedDaten(DateTime date) {
    selectedDate.value = date;
  }

  ///tab2
  void updateSelectedDatefi(DateTime date) {
    selectedDatefi.value = date;
  }


///for budget
  Map<String, double> calculateAndSetDifference(String title, DateTime selectedDate) {
    double itemAmount = getItemAmountByTitleAndMonth(title, selectedDate);
    double bitemAmount = getBitemAmountByTitleAndMonth(title, selectedDate);
    double difference = bitemAmount - itemAmount;

    if (bitemAmount != 0) {
      differenceProportion.value = itemAmount / bitemAmount;
    } else {
      differenceProportion.value = 0.0;
    }

    // Debug logs
    print('Total item amount for $title in ${DateFormat.yMMM().format(selectedDate)}: $itemAmount');
    print('Total budget item amount for $title in ${DateFormat.yMMM().format(selectedDate)}: $bitemAmount');
    print('Difference amount for $title in ${DateFormat.yMMM().format(selectedDate)}: $difference');
    print('Difference proportion for $title in ${DateFormat.yMMM().format(selectedDate)}: ${differenceProportion.value}');

    return {
      'differenceAmount': difference,
      'ina': itemAmount,
    };
  }
  ///for budget
  double getItemAmountByTitleAndMonth(String title, DateTime selectedDate) {
    return items
        .where((item) => item.title == title && isSameMonthAndYear(item.time, selectedDate))
        .map((item) => double.tryParse(item.amount) ?? 0)
        .fold(0, (prev, amount) => prev + amount);
  }
///for budget
  double getBitemAmountByTitleAndMonth(String title, DateTime selectedDate) {
    return bitems
        .where((bitem) => bitem.title == title && isSameMonthAndYear(bitem.time, selectedDate))
        .map((bitem) => double.tryParse(bitem.amount) ?? 0)
        .fold(0, (prev, amount) => prev + amount);
  }
  ///budget same month or year
  bool isSameMonthAndYear(String time, DateTime selectedDate) {
    DateTime date = DateTime.parse(time);
    return date.year == selectedDate.year && date.month == selectedDate.month;
  }
 ///budget same month or year
  ///colour for budget
  Color getColorByTitle(String title) {
    int hash = _hashCode(title);
    return Color((hash & 0xFFFFFF) | 0xFF000000); // Ensuring the color is fully opaque
  }

  int _hashCode(String title) {
    // Simple hash function to generate a unique hash code for the string
    int hash = 0;
    for (int i = 0; i < title.length; i++) {
      hash = 31 * hash + title.codeUnitAt(i);
    }
    return hash;
  }
///colour for budget


  Future<void> fetchbudTitlesFromStorage() async {
    try {
      // Fetch keys from secured storage
      List<String> keys = await _secureStorage.readAll().then((value) => value.keys.toList());
      print('All keys: $keys');
      bitems.clear();
      // Iterate through keys and add titles to the list
      for (String key in keys) {
        if (!key.startsWith("budget_")) {
          continue; // Skip keys meant for other types of items1
        }
        String? title = await _secureStorage.read(key: key);
        String? subTitle = await _secureStorage.read(key: "${key}_subTitle");
        String? amount = await _secureStorage.read(key: "${key}_amount");
        String? time = await _secureStorage.read(key: "${key}_time");
        String? category = await _secureStorage.read(key: "${key}_category");
        if (title != null && amount != null) {
          bitems.add(CustombudListItem1(
            key: key,
            title: title,
            subTitle: subTitle ??'',
            amount: amount,
            time: time ??'',
            category: category ??'',
          ));
        }
      }

      // calculateAndSetDifference(bitems.title);
      // calculateAndSetDifference();
      updateTotalAmount();
    } catch (e) {
      print('Error fetching titles: $e');
    }
  }
  void addbItem({required String key,required String title, required String subTitle,required String amount,required String time,required String category,}) {
    bitems.add(CustombudListItem1(key: key,title: title, subTitle: subTitle, amount: amount, time: time,category: category,));

  }


  Future<void> writebudTitleToStorage(String title,String subTitle, String amount, String time,String category) async {
    await fetchbudTitlesFromStorage();
    deletebTitleFromStorage;
    // await _secureStorage.deleteAll();
    // Generate a unique key for the title
    try {
      String currentTime = DateTime.now().toString();
      // Generate a unique key for the title
      String key = "budget_${DateTime.now().millisecondsSinceEpoch}";
      // Write the title and other details to secured storage
      await _secureStorage.write(key: key, value: title);
      await _secureStorage.write(key: "${key}_subTitle", value: subTitle);
      await _secureStorage.write(key: "${key}_amount", value: amount);
      await _secureStorage.write(key: "${key}_time", value: time);
      await _secureStorage.write(key: "${key}_category", value: category);
      // Add the title and details to the list
      addbItem(
        key: key,
        title: title, subTitle: subTitle, amount: amount, time: time,category: category,);
      await fetchbudTitlesFromStorage();
      calculateAndSetDifference(title,DateTime.parse(time));
    } catch (e) {
      print('Error writing title to storage: $e');
    }
  }

//budget items delete method
  Future<void> deletebTitleFromStorage(String key) async {
    try {
      await _secureStorage.delete(key: key);
      await _secureStorage.delete(key: "${key}_subTitle");
      await _secureStorage.delete(key: "${key}_amount");
      await _secureStorage.delete(key: "${key}_time");
      await _secureStorage.delete(key: "${key}_category" );
      bitems.removeWhere((item) => item.key == key);
      updateTotalAmount();
      // calculateAndSetDifference();
    } catch (e) {
      print('Error deleting title from storage: $e');
    }
  }
//edit update income
  Future<void> updateIncome(
      String key,
      String title,
      String subTitle,
      String amount,
      String time,
      String tag,
      File? file,
      ) async {
    try {
      await _secureStorage.write(key: key, value: title);
      await _secureStorage.write(key: "${key}_subTitle", value: subTitle);
      await _secureStorage.write(key: "${key}_amount", value: amount);
      await _secureStorage.write(key: "${key}_time", value: time);
      await _secureStorage.write(key: "${key}_tag", value: tag);

      if (file != null) {
        final bytes = await file.readAsBytes();
        final base64File = base64Encode(bytes);
        await _secureStorage.write(key: "${key}_file", value: base64File);
      }

      // Update the local item list if necessary
      fetchTitlesFromStorage1();
    } catch (e) {
      print('Error updating income: $e');
    }
  }
//edit update income end

//transaction page filter month settings
  List<CustomListItem> filterByMonth(int month, int year) {
    return items.where((item) {
      DateTime itemDate = DateTime.parse(item.time);
      return itemDate.month == month && itemDate.year == year;
    }).toList();
  }

  List<CustomListItem> filterByTitle(String title) {
    return items.where((item) => item.title == title).toList();
  }

  CustomListItem? getHighestAmountTitle(int month, int year) {
    List<CustomListItem> monthlyItems = filterByMonth(month, year);
    if (monthlyItems.isEmpty) return null;

    monthlyItems.sort((a, b) => double.parse(b.amount).compareTo(double.parse(a.amount)));
    return monthlyItems.first;
  }

  double calculateTotalAmount() {
    double total = 0.0;
    for (var item in items) {
      total += double.parse(item.amount);
    }
    return total;
  }
//transaction page filter month settings end

}

//class for budget
class CustombudListItem1 {
  final String key;
  final String title;
  final String subTitle;
  final String amount;
  final String time;
  final String category;

  CustombudListItem1({
    required this.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
    required this.category,
  });
}

//class for items
class CustomListItem {
  final String key;
  final String title;
  final String subTitle;
  final String amount;
  final String time;
  final String gst;
  final String receipt;
  final String invoice;
  final String vendor;
  final String tag;
  final String account;

  // final String? filePath;
  final String fileBase64;

  CustomListItem({
    required this.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
    required this.gst,
    required this.receipt,
    required this.invoice,
    required this.vendor,
    required this.tag,
    required this.account,
    required this.fileBase64,
  });
  // Convert CustomListItem to a Map
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title,
      'subTitle': subTitle,
      'amount': amount,
      'time': time,
      'gst': gst,
      'receipt': receipt,
      'invoice': invoice,
      'vendor': vendor,
      'tag': tag,
      'account': account,
      'fileBase64': fileBase64,
    };
  }
}



class CustomListItem1 {
  final String key;
  final String title;
  final String subTitle;
  final String amount;
  final String time;

  // final String category;
  // final String receipt;
  // final String invoice;
  final String tag;
  final String fileBase64;

  CustomListItem1({
    required this.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
    // required this.category,
    // required this.receipt,
    // required this.invoice,
    required this.tag,
    required this.fileBase64,
  });
  // Convert CustomListItem to a Map
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title,
      'subTitle': subTitle,
      'amount': amount,
      'time': time,
      'tag': tag,
      'fileBase64': fileBase64,
    };
  }
}

// class GroupedItemsList1 extends StatelessWidget {
//   final Map<String, List<CustomListItem>> groupedItems;
//   final Map<String, double> totalsByDate;
//
//   const GroupedItemsList1(
//       {super.key, required this.groupedItems, required this.totalsByDate});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 400,
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         children: groupedItems.entries.map((entry) {
//           String date = entry.key;
//           List<CustomListItem> items = entry.value;
//           double total = totalsByDate[date] ?? 0.0;
//           return Card(
//             color: Theme.of(context).cardColor,
//             child: ExpansionTile(
//               title: Text(
//                   '$date (Total Expenses By Date: \u{20B9}${total.toStringAsFixed(2)})'),
//               children: items.map((item) {
//                 return ListTile(
//                   title: Text(item.title),
//                   subtitle: Text(item.vendor),
//                   trailing: Text('\u{20B9}${item.amount}'),
//                 );
//               }).toList(),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }


// the HomeController contains several methods to manage the data and business logic of your application. Here's a summary of the methods present in the HomeController class:
//
// addItem1: Adds an income item to the list.
// writeTitleToStorage: Writes an expense item to the secured storage.
// writeTitleToStorage1: Writes an income item to the secured storage.
// deleteTitleFromStorage: Deletes an expense item from the secured storage.
// updateTotalAmount: Updates the total amount of expenses.
// deleteTitleFromStorage1: Deletes an income item from the secured storage.
// updateTotalAmount1: Updates the total amount of income.
// updateBalance: Updates the balance by calculating the difference between total income and total expenses.
// updateSelectedDaten: Updates the selected date for expense items.
// updateSelectedDatefi: Updates the selected date for income items.
// calculateAndSetDifference: Calculates and sets the difference between total expense and total income for a specific title.
// getItemAmountByTitle: Calculates the total amount for a specific expense title.
// getBitemAmountByTitle: Calculates the total amount for a specific income title.
// fetchTitlesFromStorage: Fetches expense items from secured storage.
// fetchTitlesFromStorage1: Fetches income items from secured storage.
// fetchbudTitlesFromStorage: Fetches budget items from secured storage.
// addbItem: Adds a budget item to the list.
// writebudTitleToStorage: Writes a budget item to secured storage.
// deletebTitleFromStorage: Deletes a budget item from secured storage.
// aggregateData: Aggregates the data based on type (Monthly, Daily, or Yearly).
// These methods handle various operations related to managing, writing, reading, and deleting items from the secured storage, calculating totals, and updating the UI accordingly.
//
// It's a comprehensive set of methods that seem to handle the storage, modification, and retrieval of data related to expenses, incomes, and budgets. Here's what each method does:
//
// addItem1: Adds an income item to the list of income items.
//
// writeTitleToStorage: Writes an expense item to the secure storage.
//
// writeTitleToStorage1: Writes an income item to the secure storage.
//
// deleteTitleFromStorage: Deletes an expense item from the secure storage.
//
// updateTotalAmount: Calculates and updates the total amount of expenses.
//
// deleteTitleFromStorage1: Deletes an income item from the secure storage.
//
// updateTotalAmount1: Calculates and updates the total amount of income.
//
// updateBalance: Calculates and updates the balance by subtracting the total expenses from the total income.
//
// updateSelectedDaten: Updates the selected date for expense items.
//
// updateSelectedDatefi: Updates the selected date for income items.
//
// calculateAndSetDifference: Calculates and sets the difference between the total expenses and total incomes for a specific title.
//
// getItemAmountByTitle: Calculates the total amount for a specific expense title.
//
// getBitemAmountByTitle: Calculates the total amount for a specific income title.
//
// fetchTitlesFromStorage: Fetches expense items from secure storage.
//
// fetchTitlesFromStorage1: Fetches income items from secure storage.
//
// fetchbudTitlesFromStorage: Fetches budget items from secure storage.
//
// addbItem: Adds a budget item to the list of budget items.
//
// writebudTitleToStorage: Writes a budget item to secure storage.
//
// deletebTitleFromStorage: Deletes a budget item from secure storage.
//
// aggregateData: Aggregates the data based on the type (Monthly, Daily, or Yearly).
//
// This collection of methods facilitates the complete lifecycle of managing data for your application, from adding and storing items to deleting and updating totals. Let me know if you need further clarification on any specific method or functionality!
// applyfilter allows to filter by date month and year
//
//
//
//
//

