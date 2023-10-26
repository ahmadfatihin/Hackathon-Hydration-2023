// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DrinkRecord {
  final int day;
  final int drinkCount;
  DrinkRecord({
    required this.day,
    required this.drinkCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'drinkCount': drinkCount,
    };
  }

  factory DrinkRecord.fromMap(Map<String, dynamic> map) {
    return DrinkRecord(
      day: map['day'] as int,
      drinkCount: map['drinkCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrinkRecord.fromJson(String source) =>
      DrinkRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DrinkRecord(day: $day, drinkCount: $drinkCount)';

  @override
  bool operator ==(covariant DrinkRecord other) {
    if (identical(this, other)) return true;

    return other.day == day && other.drinkCount == drinkCount;
  }

  @override
  int get hashCode => day.hashCode ^ drinkCount.hashCode;
}
