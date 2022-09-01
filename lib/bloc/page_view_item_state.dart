import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/page_view_item.dart';

@immutable
abstract class PageViewItemState extends Equatable {}

class Empty extends PageViewItemState {
  @override
  List<Object> get props => [];
}

class Loading extends PageViewItemState {
  @override
  List<Object> get props => [];
}

class Error extends PageViewItemState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends PageViewItemState {
  final List<PageViewItem> pageViewItems;

  Loaded({
    required this.pageViewItems,
  });

  @override
  List<Object> get props => [this.pageViewItems];
}
