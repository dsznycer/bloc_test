// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final Color color;
  final int size;

  SettingsInitial(this.color, this.size);

  @override
  String toString() => 'SettingsInitial(color: $color, size: $size)';
}

class SettingsUnique extends SettingsState {
  final Color color;
  final int size;

  SettingsUnique(this.color, this.size);

  @override
  String toString() => 'SettingsUnique(color: $color, size: $size)';
}
