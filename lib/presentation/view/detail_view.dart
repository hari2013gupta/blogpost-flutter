import 'package:flutter/material.dart';
import 'package:flutter_test21jun/presentation/controller/controllers.dart';
import 'package:get/get.dart';

import 'post_item_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = DetailController.to;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Post Detail',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () => c.fetchPostbyId(),
              icon: const Icon(Icons.refresh, color: Colors.white))
        ],
      ),
      body: Center(
        child: GetBuilder<DetailController>(
            init: c,
            builder: (controller) => controller.isLoading.isTrue
                ? const CircularProgressIndicator()
                : PostItemWidget(item: controller.seletedPost)),
      ),
    );
  }
}
