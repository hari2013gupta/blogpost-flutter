import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test21jun/common/app_const.dart';
import 'package:flutter_test21jun/presentation/app_route.dart';
import 'package:get/get.dart';

import 'domain/client/dio_client.dart';
import 'domain/client/dio_client_impl.dart';
import 'presentation/binding/initial_binding.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // dio clinet service
    await Get.putAsync<DioClient>(() => DioClientImpl().init());
    return runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blog Post Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(),
      initialRoute: initialRoute,
      getPages: setRoute,
    );
  }
}
