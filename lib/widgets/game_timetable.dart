import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nma_games/models/event.dart';
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

  Widget _buildTimetable(
      BuildContext context, List<QueryDocumentSnapshot> docs) {
    return Timetable(
      controller: myController(docs
          .map((event) => buildBasicEvent(event.data()))
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
