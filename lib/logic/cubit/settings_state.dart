part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final Color color;
  final int size;

  SettingsInitial(this.color, this.size);
}

class SettingsUnique extends SettingsState {
  final Color color;
  final int size;

  SettingsUnique(this.color, this.size);
}
