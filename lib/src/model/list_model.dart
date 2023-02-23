class ListItemModel {
  late final dynamic title;
  late final List<dynamic> content;
  double position = 0;

  ListItemModel(MapEntry mapEntry) {
    title = mapEntry.key;
    content = mapEntry.value;
  }
}
