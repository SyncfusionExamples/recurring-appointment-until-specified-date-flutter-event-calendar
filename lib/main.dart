import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(RecurrenceApp());

class RecurrenceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            dataSource: _getCalendarDataSource(),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Meeting',
        color: Colors.pink,
        recurrenceRule:
            'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,WED,FRI;UNTIL=20201225'));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
