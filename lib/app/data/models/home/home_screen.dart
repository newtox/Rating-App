import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_app/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Screen!'),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.createRoom);
              },
              child: const Text('Go to Create Room'),
            ),
          ],
        ),
      ),
    );
  }
}
