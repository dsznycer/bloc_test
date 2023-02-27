import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(Colors.black26, 25));

  void toBlue() => emit(SettingsUnique(Colors.blue, 25));
  void toPink() => emit(SettingsUnique(Colors.pink, 30));
  void toInitail() => emit(SettingsInitial(Colors.black26, 25));
}
