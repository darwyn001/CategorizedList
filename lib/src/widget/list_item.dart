import 'package:categorized_list/src/model/list_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final ListItemModel model;
  final int index;
  final Function(double val) onHeight;
  final Widget Function(dynamic) itemListBuilder;
  final Widget Function(dynamic) titleListBuilder;

  const ListItem(
    this.model,
    this.index,
    this.onHeight, {
    super.key,
    required this.itemListBuilder,
    required this.titleListBuilder,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => onHeight(context.size!.height));

    return Column(
      children: [
        titleListBuilder(model.title),
        _getListItem(model.content),
      ],
    );
  }

  Widget _getListItem(List<dynamic> items) => Column(children: items.map((e) => itemListBuilder(e)).toList());
}
