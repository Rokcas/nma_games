import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

LocalDateTime timestampToDate(Timestamp timestamp) {
  DateTime dateTime =
      DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch)
          .toLocal();

  return LocalDateTime(dateTime.year, dateTime.month, dateTime.day,
      dateTime.hour, dateTime.minute, dateTime.second);
}

Timestamp dateToTimestamp(LocalDateTime localDateTime){
  return Timestamp.fromMicrosecondsSinceEpoch(localDateTime.toDateTimeLocal().microsecondsSinceEpoch);
}

BasicEvent buildBasicEvent(Map<String, dynamic> data) {
  assert(data['start_time'] != null);
  assert(data['end_time'] != null);
  assert(data['color'] != null);
  assert(data['title'] != null);

  return BasicEvent(
      start: timestampToDate(data["start_time"]),
      end: timestampToDate(data["end_time"]),
      color: Color(data["color"]),
      id: {},
      title: data["title"]);
}

void addToDatabase(BasicEvent event) {
  FirebaseFirestore.instance.collection("events").add({
    "start_time": dateToTimestamp(event.start),
    "end_time": dateToTimestamp(event.end),
    "color": event.color.value,
    "title": event.title,
  });
}
