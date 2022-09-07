import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

final absoluteDateFormat = DateFormat.yMMMd().add_Hms();

class Timestamp extends StatefulWidget {
  final DateTime timestamp;

  const Timestamp({Key? key, required this.timestamp}) : super(key: key);

  @override
  State<Timestamp> createState() => _TimestampState();
}

class _TimestampState extends State<Timestamp> {
  bool _useRelativeTimestamp = true;

  late String formattedTime;

  @override
  void initState() {
    super.initState();
    formattedTime = createRelativeDate(widget.timestamp);
  }

  String createRelativeDate(DateTime dateTime) {
    return timeago.format(dateTime, locale: Intl.shortLocale(Intl.getCurrentLocale()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(formattedTime),
      onTap: () {
        setState(() {
          if (_useRelativeTimestamp) {
            formattedTime = createRelativeDate(widget.timestamp);
          } else {
            formattedTime = absoluteDateFormat.format(widget.timestamp);
          }

          _useRelativeTimestamp = !_useRelativeTimestamp;
        });
      },
    );
  }
}