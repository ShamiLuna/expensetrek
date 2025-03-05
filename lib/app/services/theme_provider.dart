// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeProvider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.system;
//   ThemeData currentTheme = MyThemes.lightTheme;
//
//   ThemeProvider() {
//     _loadTheme();
//   }
//
//   bool get isDarkMode {
//     if (themeMode == ThemeMode.system) {
//       final brightness = SchedulerBinding.instance.window.platformBrightness;
//       return brightness == Brightness.dark;
//     } else {
//       return themeMode == ThemeMode.dark;
//     }
//   }
//
//   void toggleTheme(bool isOn) async {
//     themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//     _saveTheme();
//   }
//
//   void setTheme(ThemeData theme) async {
//     currentTheme = theme;
//     notifyListeners();
//     _saveTheme();
//   }
//
//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final themeModeIndex = prefs.getInt('themeMode') ?? ThemeMode.system.index;
//     final themeIndex = prefs.getInt('theme') ?? 0;
//
//     themeMode = ThemeMode.values[themeModeIndex];
//     currentTheme = MyThemes.themes[themeIndex];
//     notifyListeners();
//   }
//
//   Future<void> _saveTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('themeMode', themeMode.index);
//     await prefs.setInt('theme', MyThemes.themes.indexOf(currentTheme));
//   }
// }
//
// class MyThemes {
//   static final themes = [lightTheme, darkTheme, blueTheme, greenTheme];
//
//   static final darkTheme = ThemeData(
//     scaffoldBackgroundColor: const Color(0xFF010203),
//     primaryColor: Colors.white,
//     colorScheme: const ColorScheme.dark(),
//     iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
//     unselectedWidgetColor: const Color(0x36363657),
//     primaryColorLight: const Color(0xFF13191C),
//     primaryColorDark: const Color(0xFF2A3F55),
//     splashColor: const Color(0xFFC5DAF1),
//     cardColor: const Color(0xFF6492C3),
//     secondaryHeaderColor: const Color(0xFF2A3F55),
//   );
//
//   static final lightTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     primaryColor: Colors.black,
//     colorScheme: const ColorScheme.light(),
//     primaryColorDark: const Color(0xFF2A3F55),
//     unselectedWidgetColor: const Color(0xFFE7E9EC),
//     primaryColorLight: const Color(0xFFEDF6FF),
//     splashColor: const Color(0xFFC6E1FF),
//     cardColor: const Color(0xFF446A93),
//     secondaryHeaderColor: const Color(0xFFE1EFFF),
//     iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
//   );
//
//   static final blueTheme = ThemeData(
//     scaffoldBackgroundColor: const Color(0xFFEEF8FF),
//     primaryColor: Colors.black,
//     colorScheme: const ColorScheme.light(),
//     iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
//     unselectedWidgetColor: const Color(0xFFD9DEE1),
//     primaryColorLight: const Color(0xFFE1F4FF),
//     primaryColorDark: const Color(0xFF005794),
//     splashColor: const Color(0xFFB4DAF6),
//     cardColor: const Color(0xFF20AFEC),
//     secondaryHeaderColor: const Color(0xFFD6F1FF),
//   );
//
//   static final greenTheme = ThemeData(
//     scaffoldBackgroundColor: const Color(0xFFF7FDF7),
//     primaryColor: Colors.black,
//     colorScheme: const ColorScheme.light(),
//     iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
//     unselectedWidgetColor: const Color(0xFFE4E8E4),
//     primaryColorLight: const Color(0xFFEAFFE9),
//     primaryColorDark: const Color(0xFF006B00),
//     splashColor: const Color(0xFFC5F1CE),
//     cardColor: const Color(0xFF2DC750),
//     secondaryHeaderColor: const Color(0xFFF5FFF5),
//   );
// }
//
// class ThemeSelectionPage extends StatelessWidget {
//   final ThemeProvider themeProvider;
//
//   ThemeSelectionPage({required this.themeProvider});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Theme'),
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(16),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: MyThemes.themes.length,
//         itemBuilder: (context, index) {
//           final theme = MyThemes.themes[index];
//           return GestureDetector(
//             onTap: () {
//               themeProvider.setTheme(theme);
//               Navigator.of(context).pop();
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: theme.splashColor,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: Theme.of(context).primaryColor,
//                   width: 2,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 30,
//                     width: 180,
//                     color: theme.cardColor,
//                   ),
//                   Container(
//                     height: 30,
//                     width: 180,
//                     color: theme.primaryColorDark,
//                   ),
//                   // Icon(Icons.check_box_rounded,),
//                   Center(
//                     child: Text(
//                       theme == MyThemes.lightTheme
//                           ? 'Charcoal Blue'
//                           : theme == MyThemes.darkTheme
//                           ? 'Dark Theme'
//                           : theme == MyThemes.blueTheme
//                           ? 'Blue Theme'
//                           : 'Green Theme',
//                       style: TextStyle(
//                         color: theme.primaryColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 30,
//                     width: 180,
//                     color: theme.secondaryHeaderColor,
//                   ),
//                   Container(
//                     height: 30,
//                     width: 180,
//                     color: theme.scaffoldBackgroundColor,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// ListTile buildThemeDropdownListTile(BuildContext context, ThemeProvider themeProvider) {
//   return ListTile(
//     contentPadding: EdgeInsets.symmetric(horizontal: 16),
//     title: Text(
//       'Select Theme',
//       style: TextStyle(
//         color: Theme.of(context).primaryColor,
//         fontSize: 16,
//         fontFamily: 'Roboto',
//         fontWeight: FontWeight.w500,
//         height: 0,
//       ),
//     ),
//     trailing: Icon(Icons.arrow_forward),
//     onTap: () {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => ThemeSelectionPage(themeProvider: themeProvider),
//         ),
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  ThemeData currentTheme = MyThemes.blueTheme;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    _saveTheme();
  }

  void setTheme(ThemeData theme) async {
    currentTheme = theme;
    notifyListeners();
    _saveTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('themeMode') ?? ThemeMode.system.index;
    final themeIndex = prefs.getInt('theme') ?? 0;

    themeMode = ThemeMode.values[themeModeIndex];
    currentTheme = MyThemes.themes[themeIndex];
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
    await prefs.setInt('theme', MyThemes.themes.indexOf(currentTheme));
  }
}

class MyThemes {
  static final themes = [
    lightTheme,
    darkTheme,
    blueTheme,
    greenTheme,
    purpleTheme,
    orangeTheme,
    redTheme,
    tealTheme,
    pinkTheme,
    yellowTheme,
  ];

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF15263A),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0x36363657),
    primaryColorLight: const Color(0xFF1A2A39),
    primaryColorDark: const Color(0xFF3F5C80),
    splashColor: const Color(0xFF2A3F55),
    cardColor: const Color(0xFF3F5F95),
    secondaryHeaderColor: const Color(0xFF8BC1FA),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: const Color(0xFF1E3A5F),
    unselectedWidgetColor: const Color(0xFFD1D5DB),
    primaryColorLight: const Color(0xFFD6E8FF),
    splashColor: const Color(0xFFAEDFF7),
    cardColor: const Color(0xFF5A8CAE),
    secondaryHeaderColor: const Color(0xFFCCE8FF),
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
  );

  static final blueTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEEF8FF),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFD9DEE1),
    primaryColorLight: const Color(0xFFC9E8FF),
    primaryColorDark: const Color(0xFF005794),
    splashColor: const Color(0xFF98CFF8),
    cardColor: const Color(0xFF20AFEC),
    secondaryHeaderColor: const Color(0xFFD6F1FF),
  );

  static final greenTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF7FDF7),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFC2CBC2),
    primaryColorLight: const Color(0xFFCFFFCD),
    primaryColorDark: const Color(0xFF006B00),
    splashColor: const Color(0xFF93F8A5),
    cardColor: const Color(0xFF4CAF50),
    secondaryHeaderColor: const Color(0xFFE2FFE2),
  );

  static final purpleTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2E5FF),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFE0D4F7),
    primaryColorLight: const Color(0xFFDBCAFF),
    primaryColorDark: const Color(0xFF5A00E8),
    splashColor: const Color(0xFFC08BFA),
    cardColor: const Color(0xFF9A00E6),
    secondaryHeaderColor: const Color(0xFFEADAFF),
  );

  static final orangeTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFF3E5),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFFFD9B3),
    primaryColorLight: const Color(0xFFFFEDCC),
    primaryColorDark: const Color(0xFFEF6C00),
    splashColor: const Color(0xFFFCCC88),
    cardColor: const Color(0xFFFF9800),
    secondaryHeaderColor: const Color(0xFFFFE6C4),
  );

  static final redTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFE5E5),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFFFA9A9),
    primaryColorLight: const Color(0xFFFFC3C3),
    primaryColorDark: const Color(0xFFCC0000),
    splashColor: const Color(0xFFFD8888),
    cardColor: const Color(0xFFFF1212),
    secondaryHeaderColor: const Color(0xFFFFDFDF),
  );


  static final tealTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEEFDFF),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFB3E5E8),
    primaryColorLight: const Color(0xFFB8FEFF),
    primaryColorDark: const Color(0xFF00838F),
    splashColor: const Color(0xFF92F3FF),
    cardColor: const Color(0xFF00BCD4),
    secondaryHeaderColor: const Color(0xFFDBFBFF),
  );

  static final pinkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFF6FA),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFF8BBD0),
    primaryColorLight: const Color(0xFFFFB7D4),
    primaryColorDark: const Color(0xFFC2185B),
    splashColor: const Color(0xFFFD87AA),
    cardColor: const Color(0xFFE91E63),
    secondaryHeaderColor: const Color(0xFFFDD7E6),
  );

  static final yellowTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFDE7),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    unselectedWidgetColor: const Color(0xFFFFF59D),
    primaryColorLight: const Color(0xFFFFF4B3),
    primaryColorDark: const Color(0xFFE8AE00),
    splashColor: const Color(0xFFFFF28B),
    cardColor: const Color(0xFFFFE301),
    secondaryHeaderColor: const Color(0xFFFFFADA),
  );
}

class ThemeSelectionPage extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeSelectionPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Select Theme',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          // childAspectRatio: 0.75, // Adjusted aspect ratio to fit content
        ),
        itemCount: MyThemes.themes.length,
        itemBuilder: (context, index) {
          final theme = MyThemes.themes[index];
          return GestureDetector(
            onTap: () {
              themeProvider.setTheme(theme);
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                color: theme.splashColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: theme.cardColor,
                  ),
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: theme.primaryColorDark,
                  ),
                  Center(
                    child: Text(
                      theme == MyThemes.lightTheme
                          ? 'Char Theme'
                          : theme == MyThemes.darkTheme
                          ? 'Dark Theme'
                          : theme == MyThemes.blueTheme
                          ? 'Blue Theme'
                          : theme == MyThemes.greenTheme
                          ? 'Green Theme'
                          : theme == MyThemes.purpleTheme
                          ? 'Purple Theme'
                          : theme == MyThemes.orangeTheme
                          ? 'Orange Theme'
                          : theme == MyThemes.redTheme
                          ? 'Red Theme'
                          : theme == MyThemes.tealTheme
                          ? 'Teal Theme'
                          : theme == MyThemes.pinkTheme
                          ? 'Pink Theme'
                          : 'Yellow Theme',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto'
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 30,
                  //   width: double.infinity,
                  //   color: theme.secondaryHeaderColor,
                  // ),
                  // Container(
                  //   height: 30,
                  //   width: double.infinity,
                  //   color: theme.scaffoldBackgroundColor,
                  // ),
                  // Container(
                  //   height: 30,
                  //   width: double.infinity,
                  //   color: theme.unselectedWidgetColor,
                  // ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: theme.primaryColorLight,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

ListTile buildThemeDropdownListTile(BuildContext context, ThemeProvider themeProvider) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    title: Text(
      'Select Theme',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    ),
    trailing: const Icon(Icons.arrow_forward),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ThemeSelectionPage(themeProvider: themeProvider),
        ),
      );
    },
  );
}


class MyAnimatedIcon extends StatelessWidget {
  final String animationPath;
  final double height;
  final bool reverse;
  final bool repeat;
  final BoxFit fit;
  final ThemeProvider themeProvider; // Add ThemeProvider instance
  final IconData iconData;

  const MyAnimatedIcon({super.key, 
    required this.animationPath,
    this.height = 60,
    this.reverse = true,
    this.repeat = true,
    this.fit = BoxFit.cover,
    required this.themeProvider,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = _getIconColor(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcATop),
          child: Lottie.asset(
            animationPath,
            height: height,
            reverse: reverse,
            repeat: repeat,
            fit: fit,
          ),
        ),
        Icon(
          iconData,
          color: Colors.white,
          size: height / 2, // Adjust size as needed
        ),
      ],
    );
  }

  Color _getIconColor(BuildContext context) {
    // Adjust this method based on your theme services
    if (themeProvider.isDarkMode) {
      return Theme.of(context).primaryColorDark;
    } else {
      return Theme.of(context).primaryColorDark;
    }
  }
}
