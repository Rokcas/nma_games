import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

class GameTimetable extends StatelessWidget {
  final List<BasicEvent> placeholderEvents = [
    BasicEvent(
        title: "TODO",
        id: {},
        start: LocalDateTime.now(),
        end: LocalDateTime.now().addHours(3),
        color: Colors.red),
    BasicEvent(
        title: "TODO",
        id: {},
        start: LocalDateTime.now().subtractHours(2),
        end: LocalDateTime.now(),
        color: Colors.blue),
    BasicEvent(
        title: "TODO",
        id: {},
        start: LocalDateTime.now().addHours(4),
        end: LocalDateTime.now().addDays(1).addHours(2),
        color: Colors.green),
    BasicEvent(
        title: "TODO",
        id: {},
        start: LocalDateTime.now().addDays(2),
        end: LocalDateTime.now().addDays(2).addHours(3),
        color: Colors.black),
    BasicEvent(
        title: "TODO",
        id: {},
        start: LocalDateTime.now(),
        end: LocalDateTime.now().addHours(5),
        color: Colors.yellow),
  ];

  LocalTime getStartHour(){
    LocalTime currentTime = LocalTime.currentClockTime();

    if (currentTime.hourOfDay < 5)
      return LocalTime(0, 0, 0);
    if (currentTime.hourOfDay >= 14)
      return LocalTime(13, 59, 59);

    return currentTime.subtractHours(5);
  }

  TimetableController myController() {
    return TimetableController(
      eventProvider: EventProvider.list(placeholderEvents),
      // Optional parameters with their default values:
      initialTimeRange: InitialTimeRange.range(
        startTime: getStartHour(),
        endTime: getStartHour().addHours(10),
      ),
      initialDate: LocalDate.today(),
      visibleRange: VisibleRange.days(3),
      firstDayOfWeek: LocalDate.today().dayOfWeek,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Timetable(
        controller: myController(),
        eventBuilder: (event) => BasicEventWidget(event),
      ),
    );
  }
}
