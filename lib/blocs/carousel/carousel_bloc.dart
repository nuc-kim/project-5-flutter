import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';
part 'carousel_bloc.freezed.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(_Initial()) {
    on<CarouselEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
