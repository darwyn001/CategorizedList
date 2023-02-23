import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListController extends RxController {
  RxInt position = 0.obs;
  RxInt selected = 0.obs;
  Rx<ScrollController> contentScroll = ScrollController().obs;
  Rx<ScrollController> headerScroll = ScrollController().obs;
  RxList sized = <double>[].obs;
  RxMap<int, double> itemsOffset = <int, double>{}.obs;

  void fillList() {
    for (final itemSize in sized) {
      if (position.value == 0) itemsOffset.putIfAbsent(0, () => 0);
      itemsOffset.putIfAbsent(position.value, () => _getListPosition(position.value, itemSize));
    }
  }

  double _getListPosition(int index, double val) => itemsOffset[index - 1]! + val;
}
