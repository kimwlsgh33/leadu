import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'controller/count_controller.dart';
import 'view/count_page.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp 을 사용해서, GetX의 기능을 사용할 수 있도록 한다.
    return GetMaterialApp(
      title: 'State Management - GetX',
      home: const CountPage(),
      // initialBinding : 앱이 시작될 때, 미리 생성해둔 Controller를 바인딩한다.
      initialBinding: BindingsBuilder(
        () {
          // Get.put() 을 사용해서, CountController 를 등록한다.
          Get.put(CountController());
          // Get.put(AnotherController());
        },
      ),
    );
  }
}
