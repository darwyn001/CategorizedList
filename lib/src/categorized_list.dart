import 'package:categorized_list/src/controller/list_controller.dart';
import 'package:categorized_list/src/widget/list_content.dart';
import 'package:categorized_list/src/widget/list_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorizedList extends StatelessWidget {
  final Map<dynamic, List<dynamic>> data;
  final double headerHeight;
  final Function(int, dynamic)? onSelectedItem;
  final Widget Function(dynamic) itemListBuilder;
  final Widget Function(dynamic) titleListBuilder;
  final Widget Function(dynamic, bool) headerBuilder;

  const CategorizedList(
    this.data, {
    super.key,
    this.headerHeight = 50,
    this.onSelectedItem,
    required this.itemListBuilder,
    required this.titleListBuilder,
    required this.headerBuilder,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ListController());
    return Column(
      children: [
        const SizedBox(height: 7),
        SizedBox(
          height: headerHeight,
          child: ListHeader(
            data.keys.toList(),
            onSelectedItem: onSelectedItem,
            headerBuilder: headerBuilder,
          ),
        ),
        const Divider(),
        Expanded(
          child: ListContent(
            data,
            titleListBuilder: titleListBuilder,
            itemListBuilder: itemListBuilder,
          ),
        ),
      ],
    );
  }
}
