import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/view_model/user_view_model.dart';
import 'package:bilytica_task/views/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => UserViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initializeRequirements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomeView(),
      ),
    );
  }

  void _initializeRequirements() {
    Future.delayed(const Duration(seconds: 1), () {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ));
      SizeConfig.init(context);
      setState(() {});
    });
  }
}
