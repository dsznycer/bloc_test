// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'testu_cubit.dart';

class TestuState {
  TestuState(this.text);

  final String text;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory TestuState.fromMap(Map<String, dynamic> map) {
    return TestuState(
      map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestuState.fromJson(String source) =>
      TestuState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestuState(text: $text)';
}
