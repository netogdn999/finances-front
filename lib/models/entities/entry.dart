import 'dart:convert';

class Entry {
  final double value;
  final DateTime entryDate;
  final bool isRevenue;

  Entry({required this.value, required this.entryDate, required this.isRevenue});

  factory Entry.fromJson(Map<String, dynamic> json) =>
    Entry(
      value: json["value"],
      entryDate: json["entryDate"],
      isRevenue: json["IsRevenue"]
    );

  Map<String, dynamic> get map => {
    "value": this.value,
    "entryDate": this.entryDate,
    "isRevenue": this.isRevenue
  };

  String get toJson => jsonEncode(map);

  @override
  operator ==(Object o) {
    if(identical(this, o)) return true;
    return o is Entry &&
      o.value == this.value &&
      o.entryDate == this.entryDate &&
      o.isRevenue == this.isRevenue;
  }

  @override
  int get hashCode => this.value.hashCode ^ this.entryDate.hashCode ^ this.isRevenue.hashCode;
}