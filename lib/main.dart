import 'package:budget_tracker_app/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Default text color
          bodyMedium: TextStyle(color: Colors.white), // Another text style
        ),
        iconTheme:
            const IconThemeData(color: Colors.white), // Default icon color
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
        navigationBarTheme: NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          indicatorColor: Colors.transparent,
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
            (Set<MaterialState> states) {
              // Define different IconThemeData based on different states
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(
                  size: 45.0, // Set the size of the selected icons
                  color: Colors.indigo, // Set the color of the selected icons
                );
              } else {
                return const IconThemeData(
                  size: 45.0, // Set the size of the unselected icons
                  color: Colors.grey, // Set the color of the unselected icons
                );
              }
            },
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
