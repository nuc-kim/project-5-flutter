import 'package:bloc/bloc.dart';
import 'package:project_5_flutter/bloc/page_view_item_event.dart';
import 'package:project_5_flutter/bloc/page_view_item_state.dart';
import 'package:project_5_flutter/repository/page_view_item_repository.dart';

class PageViewItemBloc extends Bloc<PageViewItemEvent, PageViewItemState> {
  final PageViewItemRepository repository;

  PageViewItemBloc({
    required this.repository,
  }) : super(Empty());

  @override
  Stream<PageViewItemState> mapEventToState(PageViewItemEvent event) async* {

  }
}
