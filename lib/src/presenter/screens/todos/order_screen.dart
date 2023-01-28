import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadu/src/presenter/controller/count_controller.dart';

class OrderScreen extends GetView<CountController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주문'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hello World'.tr),
            Obx(() => Text(
              '클릭수: ${controller.count}',
              style: const TextStyle(fontSize: 20),
            )),
            OutlinedButton(
              onPressed: () {
                Get.snackbar(
                  'Title',
                  'Message',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                  animationDuration: const Duration(milliseconds: 500),
                );
              },
              child: const Text('Get.snackbar'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Title',
                  middleText: 'Message',
                  textConfirm: 'Confirm',
                  textCancel: 'Cancel',
                  onConfirm: () {},
                  onCancel: () {},
                );
              },
              child: const Text('Get.defaultDialog'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: const Center(
                      child: Text('BottomSheet'),
                    ),
                  ),
                );
              },
              child: const Text('Get.bottomSheet'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/order');
                    },
                    child: const Text('Get.toNamed'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/order', arguments: 'Hello');
                    },
                    child: const Text('Get.toNamed with arguments'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => controller.increment(),
                    child: const Text('increase'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
