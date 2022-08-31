import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_view_item.freezed.dart';
part 'page_view_item.g.dart';

@freezed
class PageViewItem with _$PageViewItem {
  factory PageViewItem({
    required int id,
    required String imgPath,
    required String url,
}) = _PageViewItem;

  factory PageViewItem.fromJson(Map<String, dynamic> json) => _$PageViewItemFromJson(json);
}