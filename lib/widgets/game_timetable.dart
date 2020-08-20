import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

class GameTimetable extends StatelessWidget {
  LocalTime getStartHour() {
    LocalTime currentTime = LocalTime.currentClockTime();

    if (currentTime.hourOfDay < 5) return LocalTime(0, 0, 0);
    if (currentTime.hourOfDay >= 14) return LocalTime(13, 59, 59);

    return currentTime.subtractHours(5);
  }

  TimetableController myController(var events) {
    print("Number of events ${events.length}");
    print(events.toString());
    return TimetableController(
      eventProvider: EventProvider.list(events),
      initialTimeRange: InitialTimeRange.range(
        startTime: getStartHour(),
        endTime: getStartHour().addHours(10),
      ),
      initialDate: LocalDate.today(),
      visibleRange: VisibleRange.days(3),
      firstDayOfWeek: LocalDate.today().dayOfWeek,
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("events").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildTimetable(context, snapshot.data.docs);
      },
    );
  }

  BasicEvent _buildBasicEvent(BuildContext context, Map<String, dynamic> data) {
    assert(data['start_time'] != null);
    assert(data['end_time'] != null);
    assert(data['color'] != null);
    assert(data['title'] != null);

    DateTime startDate = DateTime.fromMicrosecondsSinceEpoch(
            data["start_time"].microsecondsSinceEpoch)
        .toLocal();
    DateTime endDate = DateTime.fromMicrosecondsSinceEpoch(
            data["end_time"].microsecondsSinceEpoch)
        .toLocal();

    LocalDateTime start = LocalDateTime(startDate.year, startDate.month,
        startDate.day, startDate.hour, startDate.minute, startDate.second);
    LocalDateTime end = LocalDateTime(endDate.year, endDate.month, endDate.day,
        endDate.hour, endDate.minute, endDate.second);

    return BasicEvent(
        start: start,
        end: end,
        color: Color(data["color"]),
        id: {},
        title: data["title"]);
  }

  Widget _buildTimetable(
      BuildContext context, List<QueryDocumentSnapshot> docs) {
    return Timetable(
      controller: myController(docs
          .map((event) => _buildBasicEvent(context, event.data()))
          .toList()),
      eventBuilder: (event) => BasicEventWidget(event),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(context),
    );
  }
}
