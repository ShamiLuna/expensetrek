import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String amount;
  final String time;
  final String account;
  final String fileBase64;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
    required this.account,
    required this.fileBase64,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor = getColorFromString(title);

    IconData iconData = getIconFromString(title);
    switch (title.toLowerCase()) {


      case 'food':
        iconData = Icons.restaurant;
        containerColor = Colors.red;
        break;
      case 'transport':
        containerColor = Colors.blue;
        iconData = Icons.directions_car;
        break;
      case 'education':
        containerColor = Colors.yellow;
        iconData = Icons.school;
        break;
      case 'office':
        containerColor = Colors.purple;
        iconData = Icons.laptop;
        break;
      case 'vehicle':
        containerColor = Colors.green;
        iconData = Icons.car_rental;
        break;
      case 'electronic':
        containerColor = Colors.grey;
        iconData = Icons.headphones;
        break;
      case 'shopping':
        containerColor = Colors.orange;
        iconData = Icons.shopping_cart;
        break;
      case 'entertainment':
        containerColor = Colors.pink;
        iconData = Icons.movie;
        break;
      case 'bills':
        containerColor = Colors.brown;
        iconData = Icons.receipt;
        break;
      case 'home':
        containerColor = Colors.teal;
        iconData = Icons.home;
        break;
      case 'groceries':
        containerColor = Colors.greenAccent;
        iconData = Icons.local_grocery_store;
        break;
      case 'pets':
        containerColor = Colors.blueAccent;
        iconData = Icons.pets;
        break;
      case 'sports':
        containerColor = Colors.orangeAccent;
        iconData = Icons.sports_soccer;
        break;
      case 'work':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.work;
        break;
      case 'travel':
        containerColor = Colors.lightBlueAccent;
        iconData = Icons.travel_explore;
        break;
      case 'utilities':
        containerColor = Colors.amber;
        iconData = Icons.flash_on;
        break;
      case 'health':
        containerColor = Colors.lightGreen;
        iconData = Icons.local_hospital;
        break;
      case 'beauty':
        containerColor = Colors.purpleAccent;
        iconData = Icons.brush;
        break;
      case 'gift':
        containerColor = Colors.redAccent;
        iconData = Icons.card_giftcard;
        break;
      case 'investment':
        containerColor = Colors.green;
        iconData = Icons.trending_up;
        break;
      case 'insurance':
        containerColor = Colors.cyan;
        iconData = Icons.security;
        break;
      case 'charity':
        containerColor = Colors.lightBlue;
        iconData = Icons.volunteer_activism;
        break;
      case 'taxes':
        containerColor = Colors.deepOrange;
        iconData = Icons.account_balance_wallet;
        break;
      case 'childcare':
        containerColor = Colors.pinkAccent;
        iconData = Icons.child_care;
        break;
      case 'personal care':
        containerColor = Colors.lime;
        iconData = Icons.spa;
        break;
      case 'fitness':
        containerColor = Colors.deepPurple;
        iconData = Icons.fitness_center;
        break;
      case 'entertainment':
        containerColor = Colors.redAccent;
        iconData = Icons.movie;
        break;
      case 'subscription':
        containerColor = Colors.teal;
        iconData = Icons.subscriptions;
        break;
      case 'clothing':
        containerColor = Colors.indigo;
        iconData = Icons.shopping_bag;
        break;
      case 'rent':
        containerColor = Colors.blueGrey;
        iconData = Icons.home_work;
        break;
      case 'mortgage':
        containerColor = Colors.brown;
        iconData = Icons.house;
        break;
      case 'clothing':
        containerColor = Colors.blueAccent;
        iconData = Icons.shopping_bag;
        break;
      case 'loan':
        containerColor = Colors.greenAccent;
        iconData = Icons.attach_money;
        break;
      case 'office':
        containerColor = Colors.grey;
        iconData = Icons.work;
      case 'savings':
        containerColor = Colors.greenAccent;
        iconData = Icons.savings;
        break;
      case 'loans':
        containerColor = Colors.blue;
        iconData = Icons.money;
        break;
      case 'furniture':
        containerColor = Colors.deepOrangeAccent;
        iconData = Icons.chair;
        break;
      case 'gifts':
        containerColor = Colors.red;
        iconData = Icons.card_giftcard;
        break;
      case 'holiday':
        containerColor = Colors.orangeAccent;
        iconData = Icons.beach_access;
        break;
      case 'books':
        containerColor = Colors.brown;
        iconData = Icons.menu_book;
        break;
      case 'music':
        containerColor = Colors.deepPurple;
        iconData = Icons.music_note;
        break;
      case 'art':
        containerColor = Colors.orange;
        iconData = Icons.palette;
        break;
      case 'hobbies':
        containerColor = Colors.lightGreen;
        iconData = Icons.sports_esports;
        break;
      case 'games':
        containerColor = Colors.blue;
        iconData = Icons.games;
        break;
      case 'events':
        containerColor = Colors.indigo;
        iconData = Icons.event;
        break;
      case 'gift cards':
        containerColor = Colors.pink;
        iconData = Icons.card_giftcard;
        break;
      case 'subscriptions':
        containerColor = Colors.teal;
        iconData = Icons.subscriptions;
        break;
      case 'donations':
        containerColor = Colors.green;
        iconData = Icons.favorite;
        break;
      case 'pet supplies':
        containerColor = Colors.brown;
        iconData = Icons.pets;
        break;
      case 'stationery':
        containerColor = Colors.orangeAccent;
        iconData = Icons.edit;
        break;
      case 'tools':
        containerColor = Colors.blueAccent;
        iconData = Icons.build;
        break;
      case 'gardening':
        containerColor = Colors.green;
        iconData = Icons.eco;
        break;
      case 'crafts':
        containerColor = Colors.amber;
        iconData = Icons.color_lens;
        break;
      case 'party supplies':
        containerColor = Colors.pinkAccent;
        iconData = Icons.party_mode;
        break;
      case 'fitness equipment':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.fitness_center;
        break;
      case 'baby supplies':
        containerColor = Colors.lightBlue;
        iconData = Icons.child_friendly;
        break;
      case 'office supplies':
        containerColor = Colors.blueGrey;
        iconData = Icons.work;
        break;
      case 'school supplies':
        containerColor = Colors.deepOrange;
        iconData = Icons.school;
        break;
      case 'home improvement':
        containerColor = Colors.brown;
        iconData = Icons.home_repair_service;
        break;
      case 'home decor':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.lightbulb;
        break;
      case 'home maintenance':
        containerColor = Colors.brown;
        iconData = Icons.home_repair_service;
        break;
      case 'cleaning supplies':
        containerColor = Colors.lightGreen;
        iconData = Icons.cleaning_services;
        break;
      case 'laundry':
        containerColor = Colors.blueGrey;
        iconData = Icons.local_laundry_service;
        break;
      case 'car maintenance':
        containerColor = Colors.blueAccent;
        iconData = Icons.car_repair;
        break;
      case 'car wash':
        containerColor = Colors.blueAccent;
        iconData = Icons.local_car_wash;
        break;
      case 'pet grooming':
        containerColor = Colors.brown;
        iconData = Icons.pets;
        break;
      case 'personal development':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.psychology;
        break;
      case 'online services':
        containerColor = Colors.blueAccent;
        iconData = Icons.computer;
        break;
      case 'miscellaneous':
        containerColor = Colors.grey;
        iconData = Icons.category;
        break;

      default:
        iconData = getIconFromString(title);
        containerColor = getColorFromString(title);
    // Add more cases for other titles and corresponding icons as needed
    }
    return Align(
      heightFactor: 0.9,
      child: ListTile(

        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 60,
          height:  110,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(iconData, size: 30, color: Colors.white),
        ),
        title:
        SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // width: 350,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                  maxLines: 1,
                ),
              ),
              // const SizedBox(height: 4),
              SizedBox(
                // width: 350,
                child: Text(
                  subTitle,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        // ConstrainedBox(
        //   constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        //   child: Text(
        //     title,
        //     style: TextStyle(
        //       color: Theme.of(context).primaryColor,
        //       fontSize: MediaQuery.of(context).size.width * 0.04,
        //       fontFamily: 'Roboto',
        //       fontWeight: FontWeight.w600,
        //     ),
        //     overflow: TextOverflow.ellipsis,
        //     maxLines: 1,
        //   ),
        // ),
        trailing: SizedBox(
          // width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- \u{20B9}$amount',
                style:  TextStyle(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 20,
                // width: 70,
                child: Text(
                  time,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColorFromString(String input) {
    final hash = input.hashCode;
    final random = Random(hash);

    // Generate more vibrant colors
    int r = 120 + random.nextInt(136); // 120-255 (Avoid dark colors)
    int g = 100 + random.nextInt(156); // 100-255
    int b = 130 + random.nextInt(126); // 130-255

    return Color.fromARGB(255, r, g, b);
  }


  IconData getIconFromString(String input) {
    final icons = [
      Icons.shopping_bag,
      Icons.restaurant,
      Icons.directions_car,
      Icons.note_alt_sharp,
      Icons.laptop,
      Icons.car_rental,
      Icons.headphones,
      Icons.home,
      Icons.local_grocery_store,
      Icons.pets,
      Icons.sports_soccer,
      Icons.work,
      Icons.travel_explore,
      Icons.movie,
      Icons.receipt,
      Icons.school,
      Icons.category,
      Icons.attach_money,
      Icons.savings,
      Icons.trending_up,
      Icons.favorite,
      Icons.volunteer_activism,
      Icons.build,
      Icons.music_note,
      Icons.palette,
      Icons.event,
      Icons.eco,
      Icons.psychology,
      Icons.computer,
      Icons.lightbulb,
    ];

    final hash = input.hashCode;
    return icons[hash % icons.length]; // Assigns a unique icon
  }

}


class CustomListTile1 extends StatelessWidget {
  final String title;
  final String subTitle;
  final String amount;
  final String time;

  const CustomListTile1({
    super.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor = getColorFromString(title);
    IconData iconData = getIconFromString(title);// Default icon
    switch (title.toLowerCase()) {
      case 'food':
        iconData = Icons.restaurant;
        containerColor = Colors.red;
        break;
      case 'transport':
        containerColor = Colors.blue;
        iconData = Icons.directions_car;
        break;
      case 'education':
        containerColor = Colors.yellow;
        iconData = Icons.school;
        break;
      case 'office':
        containerColor = Colors.purple;
        iconData = Icons.laptop;
        break;
      case 'vehicle':
        containerColor = Colors.green;
        iconData = Icons.car_rental;
        break;
      case 'electronic':
        containerColor = Colors.grey;
        iconData = Icons.headphones;
        break;
      case 'shopping':
        containerColor = Colors.orange;
        iconData = Icons.shopping_cart;
        break;
      case 'entertainment':
        containerColor = Colors.pink;
        iconData = Icons.movie;
        break;
      case 'bills':
        containerColor = Colors.brown;
        iconData = Icons.receipt;
        break;
      case 'home':
        containerColor = Colors.teal;
        iconData = Icons.home;
        break;
      case 'groceries':
        containerColor = Colors.greenAccent;
        iconData = Icons.local_grocery_store;
        break;
      case 'pets':
        containerColor = Colors.blueAccent;
        iconData = Icons.pets;
        break;
      case 'sports':
        containerColor = Colors.orangeAccent;
        iconData = Icons.sports_soccer;
        break;
      case 'books':
        containerColor = Colors.brown;
        iconData = Icons.menu_book;
        break;
      case 'music':
        containerColor = Colors.deepPurple;
        iconData = Icons.music_note;
        break;
      case 'art':
        containerColor = Colors.orange;
        iconData = Icons.palette;
        break;
      case 'hobbies':
        containerColor = Colors.lightGreen;
        iconData = Icons.sports_esports;
        break;
      case 'games':
        containerColor = Colors.blue;
        iconData = Icons.games;
        break;
      case 'events':
        containerColor = Colors.indigo;
        iconData = Icons.event;
        break;
      case 'gift cards':
        containerColor = Colors.pink;
        iconData = Icons.card_giftcard;
        break;
      case 'subscriptions':
        containerColor = Colors.teal;
        iconData = Icons.subscriptions;
        break;
      case 'donations':
        containerColor = Colors.green;
        iconData = Icons.favorite;
        break;
      case 'pet supplies':
        containerColor = Colors.brown;
        iconData = Icons.pets;
        break;
      case 'stationery':
        containerColor = Colors.orangeAccent;
        iconData = Icons.edit;
        break;
      case 'tools':
        containerColor = Colors.blueAccent;
        iconData = Icons.build;
        break;
      case 'gardening':
        containerColor = Colors.green;
        iconData = Icons.eco;
        break;
      case 'crafts':
        containerColor = Colors.amber;
        iconData = Icons.color_lens;
        break;
      case 'party supplies':
        containerColor = Colors.pinkAccent;
        iconData = Icons.party_mode;
        break;
      case 'fitness equipment':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.fitness_center;
        break;
      case 'baby supplies':
        containerColor = Colors.lightBlue;
        iconData = Icons.child_friendly;
        break;
      case 'office supplies':
        containerColor = Colors.blueGrey;
        iconData = Icons.work;
        break;
      case 'school supplies':
        containerColor = Colors.deepOrange;
        iconData = Icons.school;
        break;
      case 'home improvement':
        containerColor = Colors.brown;
        iconData = Icons.home_repair_service;
        break;
      case 'home decor':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.lightbulb;
        break;
      case 'home maintenance':
        containerColor = Colors.brown;
        iconData = Icons.home_repair_service;
        break;
      case 'cleaning supplies':
        containerColor = Colors.lightGreen;
        iconData = Icons.cleaning_services;
        break;
      case 'laundry':
        containerColor = Colors.blueGrey;
        iconData = Icons.local_laundry_service;
        break;
      case 'car maintenance':
        containerColor = Colors.blueAccent;
        iconData = Icons.car_repair;
        break;
      case 'car wash':
        containerColor = Colors.blueAccent;
        iconData = Icons.local_car_wash;
        break;
      case 'pet grooming':
        containerColor = Colors.brown;
        iconData = Icons.pets;
        break;
      case 'personal development':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.psychology;
        break;
      case 'online services':
        containerColor = Colors.blueAccent;
        iconData = Icons.computer;
        break;
      case 'work':
        containerColor = Colors.deepPurpleAccent;
        iconData = Icons.work;
        break;
      case 'travel':
        containerColor = Colors.lightBlueAccent;
        iconData = Icons.travel_explore;
        break;
      case 'utilities':
        containerColor = Colors.amber;
        iconData = Icons.flash_on;
        break;
      case 'health':
        containerColor = Colors.lightGreen;
        iconData = Icons.local_hospital;
        break;
      case 'beauty':
        containerColor = Colors.purpleAccent;
        iconData = Icons.brush;
        break;
      case 'gift':
        containerColor = Colors.redAccent;
        iconData = Icons.card_giftcard;
        break;
      case 'investment':
        containerColor = Colors.green;
        iconData = Icons.trending_up;
        break;
      case 'insurance':
        containerColor = Colors.cyan;
        iconData = Icons.security;
        break;
      case 'charity':
        containerColor = Colors.lightBlue;
        iconData = Icons.volunteer_activism;
        break;
      case 'taxes':
        containerColor = Colors.deepOrange;
        iconData = Icons.account_balance_wallet;
        break;
      case 'childcare':
        containerColor = Colors.pinkAccent;
        iconData = Icons.child_care;
        break;
      case 'personal care':
        containerColor = Colors.lime;
        iconData = Icons.spa;
        break;
      case 'fitness':
        containerColor = Colors.deepPurple;
        iconData = Icons.fitness_center;
        break;
      case 'entertainment':
        containerColor = Colors.redAccent;
        iconData = Icons.movie;
        break;
      case 'subscription':
        containerColor = Colors.teal;
        iconData = Icons.subscriptions;
        break;
      case 'clothing':
        containerColor = Colors.indigo;
        iconData = Icons.shopping_bag;
        break;
      case 'rent':
        containerColor = Colors.blueGrey;
        iconData = Icons.home_work;
        break;
      case 'mortgage':
        containerColor = Colors.brown;
        iconData = Icons.house;
        break;
      case 'savings':
        containerColor = Colors.greenAccent;
        iconData = Icons.savings;
        break;
      case 'loans':
        containerColor = Colors.blue;
        iconData = Icons.money;
        break;
      case 'furniture':
        containerColor = Colors.deepOrangeAccent;
        iconData = Icons.chair;
        break;
      case 'gifts':
        containerColor = Colors.red;
        iconData = Icons.card_giftcard;
        break;
      case 'holiday':
        containerColor = Colors.orangeAccent;
        iconData = Icons.beach_access;
        break;
      case 'clothing':
        containerColor = Colors.blueAccent;
        iconData = Icons.shopping_bag;
        break;
      case 'loan':
        containerColor = Colors.greenAccent;
        iconData = Icons.attach_money;
        break;
      case 'office':
        containerColor = Colors.grey;
        iconData = Icons.work;
      case 'miscellaneous':
        containerColor = Colors.grey;
        iconData = Icons.category;
        break;
      default:
        iconData = getIconFromString(title);
        containerColor = getColorFromString(title);
    // Add more cases for other titles and corresponding icons as needed
    }
    return Align(
      heightFactor: 0.9,
      child: ListTile(
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 60,
          height: 110,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(iconData, size: 30, color: Colors.white),
        ),
        title: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                maxLines: 1,
              ),

              SizedBox(
                // width: 350,
                child: Text(
                  subTitle,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        trailing: SizedBox(
          // width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '+ \u{20B9}$amount',
                style: TextStyle(
                  color: Colors.green,
                  fontSize:  MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                // overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 20,
                // width: 70,
                child: Text(
                  time,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize:  MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color getColorFromString(String input) {
    final hash = input.hashCode;
    final random = Random(hash);

    // Generate more vibrant colors
    int r = 120 + random.nextInt(136); // 120-255 (Avoid dark colors)
    int g = 100 + random.nextInt(156); // 100-255
    int b = 130 + random.nextInt(126); // 130-255

    return Color.fromARGB(255, r, g, b);
  }


  IconData getIconFromString(String input) {
    final icons = [
      Icons.shopping_bag,
      Icons.restaurant,
      Icons.directions_car,
      Icons.note_alt_sharp,
      Icons.laptop,
      Icons.car_rental,
      Icons.headphones,
      Icons.home,
      Icons.local_grocery_store,
      Icons.pets,
      Icons.sports_soccer,
      Icons.work,
      Icons.travel_explore,
      Icons.movie,
      Icons.receipt,
      Icons.school,
      Icons.category,
      Icons.attach_money,
      Icons.savings,
      Icons.trending_up,
      Icons.favorite,
      Icons.volunteer_activism,
      Icons.build,
      Icons.music_note,
      Icons.palette,
      Icons.event,
      Icons.eco,
      Icons.psychology,
      Icons.computer,
      Icons.lightbulb,
    ];

    final hash = input.hashCode;
    return icons[hash % icons.length]; // Assigns a unique icon
  }

}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ShoppingTransactions extends StatelessWidget {
  final totalAmount1 = 0.0.obs;
  final String title;
  final String subTitle;
  final String amount;
  final String time;
  final double differenceProportion;

  ShoppingTransactions({
    super.key,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
    required this.differenceProportion,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controllerr = Get.put(HomeController());
    final Color titleColor = controllerr.getColorByTitle(title);

    return Container(
      width:  1 * MediaQuery.of(context).size.width,
      height: 222,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Theme.of(context).splashColor, // Changed to cardColor
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: titleColor,
                          shape: BoxShape.circle, // Changed to BoxShape.circle
                        ),
                      ),
                      const SizedBox(width: 7),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                if (differenceProportion > 1.0)
                  Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red, // Changed to red color
                      shape: BoxShape.circle, // Changed to BoxShape.circle
                    ),
                    child: const Icon(Icons.notification_important_sharp, color: Colors.white),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: differenceProportion,
                  backgroundColor: Colors.grey[200],
                  valueColor:  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor), // Changed to primaryColor
                ),
              ],
            ),
          ),
          const SizedBox(height: 1),
          Text(
            amount,
            style: TextStyle(
              color: Theme.of(context).primaryColor, // Changed to accentColor
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          if (differenceProportion > 1.0) // Optional: Show warning if over budget
            Text(
              'You’ve exceed the limit!',
              style: TextStyle(
                color: Colors.red, // Changed to red color
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}

