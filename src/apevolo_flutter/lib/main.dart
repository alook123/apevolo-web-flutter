import 'package:apevolo_flutter/app/service/system_service.dart';
import 'package:apevolo_flutter/app/service/user_service.dart';
import 'package:apevolo_flutter/app/theme/dart_theme.dart';
import 'package:apevolo_flutter/app/theme/light_theme.dart';
import 'package:apevolo_flutter/app/utilities/logger_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      onInit: onInitialize,
      logWriterCallback: Logger.write,
      theme: lightTheme,
      darkTheme: darkTheme,
      // scrollBehavior: MyCustomScrollBehavior(),
    ),
  );
}

Future<void> onInitialize() async {
  // GetStorage.init();
  // GetStorage.init('userData');
  Get.put(SystemService(), permanent: true);
  Get.put(UserService(), permanent: true);
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
