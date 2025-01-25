import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterBlocCubit extends Cubit<CounterBlocState> {
  CounterBlocCubit() : super(CounterBlocState(num: 0));
  void inc() {
    emit(CounterBlocState(num: state.num + 1));
  }

  void dec() {
    emit(CounterBlocState(num: state.num - 1));
  }
}
