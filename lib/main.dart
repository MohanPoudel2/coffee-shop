import 'package:coffee_shop/pages/first_user_screen.dart';
import 'package:coffee_shop/provider/bottom_nev_provider/bottom_nev_provider.dart';
import 'package:coffee_shop/provider/coffee_list_provider/coffee_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(create: (_) => CoffeeListNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: AppColors.bgColor),
          scaffoldBackgroundColor: AppColors.bgColor,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
