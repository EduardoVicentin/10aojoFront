import 'package:abc_tech_app/pages/home_bind.dart';
import 'package:abc_tech_app/pages/home_page.dart';
import 'package:abc_tech_app/pages/order_bind.dart';
import 'package:abc_tech_app/pages/order_page.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  initService();
  runApp(const MyApp());
}

void initService() async{
  await Get.putAsync(() => AssistService().init(AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AbcTech',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: const TextTheme(headlineMedium: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        primarySwatch: Colors.lightGreen,
      ),
      getPages: [
        GetPage(name: "/", page: () =>  const OrderPage(), binding: OrderBind()),
        GetPage(name: "/assists", page: () => const HomePage(), binding: HomeBind())
      ],     
    );
  }
}
