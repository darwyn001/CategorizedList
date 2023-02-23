import 'package:categorized_list/src/controller/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHeader extends StatelessWidget {
  final List<dynamic> headerItems;
  final Function(int, dynamic)? onSelectedItem;
  final Widget Function(dynamic, bool) headerBuilder;

  ListHeader(
    this.headerItems, {
    super.key,
    this.onSelectedItem,
    required this.headerBuilder,
  });

  final listController = Get.find<ListController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: headerItems.length,
      controller: listController.headerScroll.value,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => _getHeaderItemList(index),
    );
  }

  Widget _getHeaderItemList(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Obx(
        () => GestureDetector(
          onTap: () {
            listController.selected(index);
            listController.contentScroll.value.animateTo(
              Get.find<ListController>().itemsOffset[index]!,
              duration: const Duration(seconds: 1),
              curve: Curves.ease,
            );
          },
          child: headerBuilder(headerItems[index], listController.selected.value == index),
        ),
      ),
    );
  }
}
