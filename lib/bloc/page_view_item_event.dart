import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_5_flutter/model/page_view_item.dart';

@immutable
abstract class PageViewItemEvent extends Equatable {}

class ListPageViewItemsEvent extends PageViewItemEvent {
  @override
  List<Object> get props => [];
}

class CreatePageViewItemEvent extends PageViewItemEvent {
  final String id;
  final String imgPath;

  CreatePageViewItemEvent({
    required this.id,
    required this.imgPath,
  });

  @override
  List<Object> get props => [this.id, this.imgPath];
}

class DeletePageViewItemEvent extends PageViewItemEvent {
  final PageViewItem pageViewItem;

  DeletePageViewItemEvent({
    required this.pageViewItem,
  });

  @override
  List<Object?> get props => [this.pageViewItem];
}
