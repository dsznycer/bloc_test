import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(Colors.black26, 25));

  void toBlue() => emit(SettingsUnique(Colors.blue, 25));
  void toPink() => emit(SettingsUnique(Colors.pink, 30));
}
