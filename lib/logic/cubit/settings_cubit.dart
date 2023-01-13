import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(Colors.black26, 25));

  void toBlue() => emit(SettingsUnique(Colors.blue, 25));
  void toPink() => emit(SettingsUnique(Colors.pink, 30));
  void toInitail() => emit(SettingsInitial(Colors.black26, 25));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    if (SettingsState is SettingsUnique) {
      log('el');
      return SettingsUnique.fromMap(json);
    } else if (state is SettingsInitial) {
      log('el');
      return SettingsInitial.fromMap(json);
    }
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    if (state is SettingsUnique) {
      log('Zapisanie do jsona');
      return state.toMap();
    } else if (state is SettingsInitial) {
      return state.toMap();
    }

    throw UnimplementedError();
  }
}
