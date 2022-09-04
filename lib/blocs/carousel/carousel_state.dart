part of 'carousel_bloc.dart';

class CarouselState extends Equatable {
  int carouoselValue;

  CarouselState({required this.carouoselValue});

  @override
  List<Object> get props => [carouoselValue];
}

class CarouselInitial extends CarouselState {
  CarouselInitial() : super(carouoselValue: 0);
}
