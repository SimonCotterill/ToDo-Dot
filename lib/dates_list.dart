import 'package:intl/intl.dart';

List<String> days = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat'
];
List<String> dates = [
  '$formattedDay',
  ' ',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18'
];


List <String> time = [
  '12 AM',
  '1 AM',
  '2 AM',
  '3 AM',
  '4 AM',
  '5 AM',
  '6 AM',
  '7 AM',
  '8 AM',
  '9 AM',
  '10 AM',
  '11 AM',
  '12 PM',
  '1 PM',
  '2 PM',
  '3 PM',
  '4 PM',
  '5 PM',
  '6 PM',
  '7 PM',
  '8 PM',
  '9 PM',
  '10 PM',
  '11 PM',
];

// https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart

//Getting now info
final DateTime now = new DateTime.now();

//Month
final DateFormat month  = DateFormat.MMMM();
final String formattedMonth = month.format(now);

//Year
final DateFormat year = DateFormat.y();
final String formattedYear = year.format(now);

//Day
final DateFormat day  = DateFormat.d();
final String formattedDay = day.format(now);



