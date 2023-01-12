import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testu_state.dart';

class TestuCubit extends Cubit<TestuState> {
  TestuCubit() : super(TestuState('basic'));

  void changeBig() => emit(TestuState('BIGGG'));
}
