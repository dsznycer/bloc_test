// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final Color color;
  final int size;

  SettingsInitial(this.color, this.size);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color.value,
      'size': size,
    };
  }

  factory SettingsInitial.fromMap(Map<String, dynamic> map) {
    return SettingsInitial(
      Color(map['color'] as int),
      map['size'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsInitial.fromJson(String source) =>
      SettingsInitial.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SettingsUnique extends SettingsState {
  final Color color;
  final int size;

  SettingsUnique(this.color, this.size);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color.value,
      'size': size,
    };
  }

  factory SettingsUnique.fromMap(Map<String, dynamic> map) {
    return SettingsUnique(
      Color(map['color'] as int),
      map['size'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsUnique.fromJson(String source) =>
      SettingsUnique.fromMap(json.decode(source) as Map<String, dynamic>);
}
