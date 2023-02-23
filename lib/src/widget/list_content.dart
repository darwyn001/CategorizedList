import 'package:categorized_list/src/controller/list_controller.dart';
import 'package:categorized_list/src/widget/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/list_model.dart';

class ListContent extends StatelessWidget {
  final Map<dynamic, List<dynamic>> data;
  final Widget Function(dynamic) itemListBuilder;
  final Widget Function(dynamic) titleListBuilder;

  const ListContent(
    this.data, {
    super.key,
    required this.itemListBuilder,
    required this.titleListBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final listController = Get.find<ListController>();
    final controller = listController.contentScroll.value;

    return ListView.builder(
      controller: controller,
      itemCount: data.length,
      itemBuilder: (_, index) {
        controller.addListener(() {
          final off = controller.offset;
        });
        return _getGeneralItem(data.entries.elementAt(index), index);
      },
    );
  }

  Widget _getGeneralItem(MapEntry<dynamic, List<dynamic>> mapEntry, int index) {
    return ListItem(
      ListItemModel(mapEntry),
      index,
      (val) {
        final lc = Get.find<ListController>();
        lc.sized.add(val);
        lc.position(index);
        lc.fillList();
      },
      titleListBuilder: titleListBuilder,
      itemListBuilder: itemListBuilder,
    );
  }
}
