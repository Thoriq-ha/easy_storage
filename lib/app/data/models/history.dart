import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  String method;
  int price;
  String title;
  String value;
  Timestamp date;

  History(
      {required this.method,
      required this.price,
      required this.title,
      required this.value,
      required this.date});

  factory History.fromMap(Map map) => History(
      method: map['method'],
      price: map['price'],
      title: map['title'],
      value: map['value'],
      date: map['date']);
}
