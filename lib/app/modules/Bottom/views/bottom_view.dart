// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:expensetrek/app/modules/Tab/views/tab_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../services/theme_provider.dart';
// import '../../Budget/views/budget_view.dart';
// import '../../Transactions/views/transactions_view.dart';
// import '../../home/views/home_view.dart';
// import '../../profile/views/profile_view.dart';
// import '../controllers/bottom_controller.dart';
//
// class BottomNavBar extends StatelessWidget {
//   final BottomController _controller = Get.put(BottomController());
//
//   BottomNavBar({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Obx(
//               () => IndexedStack(
//             index: _controller.tabIndex.value,
//             children: [
//               HomeView(),
//               const TransactionsView(),
//               Tabn(),
//               BudgetView(),
//               ProfileView(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Obx(
//             () {
//           print('TabIndex: ${_controller.tabIndex.value}');
//           return CurvedNavigationBar(
//             index: _controller.tabIndex.value,
//             onTap: (index) {
//               _controller.changeTabIndex(index);
//             },
//             color: Theme.of(context).primaryColorLight, // Light theme color
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Background color of the navigation bar
//             buttonBackgroundColor: Theme.of(context).secondaryHeaderColor, // Color for the active button
//             items: [
//               Icon(
//                 Icons.home_work_outlined,
//                 color: Theme.of(context).primaryColorDark, // Dark theme color for icon
//                 size: 30,
//               ),
//               Icon(
//                 Icons.compare_arrows,
//                 color: Theme.of(context).primaryColorDark, // Dark theme color for icon
//                 size: 30,
//               ),
//               MyAnimatedIcon( // Use MyAnimatedIcon here
//                 animationPath: 'assets/images/adds.json',
//                 height: 60,
//                 reverse: true,
//                 repeat: true,
//                 fit: BoxFit.cover,
//                 themeProvider: ThemeProvider(), // Pass your theme services instance
//                 iconData: Icons.add, // Pass icon data here
//               ),
//               Icon(
//                 Icons.nature_people_outlined,
//                 color: Theme.of(context).primaryColorDark, // Dark theme color for icon
//                 size: 30,
//               ),
//               Icon(
//                 Icons.person_4_outlined,
//                 color: Theme.of(context).primaryColorDark, // Dark theme color for icon
//                 size: 30,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


//Advanced drawer
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../../../services/theme_provider.dart';
import '../../Budget/views/budget_view.dart';
import '../../Tab/views/tab_view.dart';
import '../../Transactions/views/transactions_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/bottom_controller.dart';
import '../drawercontroller.dart';


class BottomNavBar extends StatelessWidget {
  final BottomController _controller = Get.put(BottomController());
  final MyDrawerController drawerController = Get.put(MyDrawerController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: drawerController.advancedDrawerController,
      drawer: const CustomDrawer(),
      animationDuration: const Duration(milliseconds: 100),
      animationCurve: Curves.easeInOut,
      backdropColor: Colors.black.withOpacity(0.5),
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Obx(
                () => IndexedStack(
              index: _controller.tabIndex.value,
              children: [
                HomeViewWithDrawerToggle(),
          TransactionsViewWithDrawerToggle(),
            TabnWithDrawerToggle(),
           BudgetViewWithDrawerToggle(),
               ProfileViewWithDrawerToggle(),
              ],
            ),
          ),

        ),
        bottomNavigationBar: Obx(
              () {
            print('TabIndex: ${_controller.tabIndex.value}');
            return CurvedNavigationBar(
              index: _controller.tabIndex.value,
              onTap: (index) {
                _controller.changeTabIndex(index);
              },
              color: Theme.of(context).primaryColorLight,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              buttonBackgroundColor: Theme.of(context).secondaryHeaderColor,
              items: [
                Icon(
                  Icons.home_work_outlined,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
                Icon(
                  Icons.compare_arrows,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
                MyAnimatedIcon(
                  animationPath: 'assets/images/adds.json',
                  height: 60,
                  reverse: true,
                  repeat: true,
                  fit: BoxFit.cover,
                  themeProvider: ThemeProvider(),
                  iconData: Icons.add,
                ),
                Icon(
                  Icons.nature_people_outlined,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
                Icon(
                  Icons.person_4_outlined,
                  color: Theme.of(context).primaryColorDark,
                  size: 30,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomeViewWithDrawerToggle extends StatelessWidget {
  final MyDrawerController drawerController = Get.find<MyDrawerController>();

   HomeViewWithDrawerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeView(),
        Positioned(
          top: 35,
          left: 27,
          child: IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).primaryColorDark,),
            onPressed: () {
              drawerController.advancedDrawerController.showDrawer();
            },
          ),
        ),
      ],
    );
  }
}

class TransactionsViewWithDrawerToggle extends StatelessWidget {
  final MyDrawerController drawerController = Get.find<MyDrawerController>();

   TransactionsViewWithDrawerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TransactionsView(),
        Positioned(
          top: 8,
          left: 45,
          child: IconButton(
            icon: Icon(Icons.menu,color: Theme.of(context).primaryColorDark),
            onPressed: () {
              drawerController.advancedDrawerController.showDrawer();
            },
          ),
        ),
      ],
    );
  }
}

class TabnWithDrawerToggle extends StatelessWidget {
  final MyDrawerController drawerController = Get.find<MyDrawerController>();

 TabnWithDrawerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Tabn(),
        Positioned(
          top: 9,
          left: 40,
          child: IconButton(
            icon: Icon(Icons.menu,color: Theme.of(context).primaryColorDark),
            onPressed: () {
              drawerController.advancedDrawerController.showDrawer();
            },
          ),
        ),
      ],
    );
  }
}

class BudgetViewWithDrawerToggle extends StatelessWidget {
  final MyDrawerController drawerController = Get.find<MyDrawerController>();

  BudgetViewWithDrawerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BudgetView(),
        Positioned(
          top: 10,
          left: 20,
          child: IconButton(
            icon: Icon(Icons.menu,color: Theme.of(context).primaryColorDark),
            onPressed: () {
              drawerController.advancedDrawerController.showDrawer();
            },
          ),
        ),
      ],
    );
  }
}

class ProfileViewWithDrawerToggle extends StatelessWidget {
  final MyDrawerController drawerController = Get.find<MyDrawerController>();

   ProfileViewWithDrawerToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileView(),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: Icon(Icons.menu,color: Theme.of(context).primaryColorDark),
            onPressed: () {
              drawerController.advancedDrawerController.showDrawer();
            },
          ),
        ),
      ],
    );

  }
}
