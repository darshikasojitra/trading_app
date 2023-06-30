import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? scheduleTime;
  DateTime? _selectedDay;
  Future<void> _showSelectedDay(selectedDay, focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  Future<void> _showCalenderFormat(format) async {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  Future<void> _showFocusDay(focusedDay) async {
    _focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 490,
            width: 375,
            decoration: const BoxDecoration(
              color: Color(0xffF5F5FD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 25,right: 25,bottom: 30),
                  child: Row(
                    children: [
                      const Text(
                        'Order History',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff03314B),
                        ),
                      ),
                      const SizedBox(width: 140,),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarScreen(),));
                          },
                          child: SvgPicture.asset('asset/images/calendar.svg')),
                    ],
                  ),
                ),
                Expanded(
                  child: TableCalendar(
                    rowHeight: 45,
                    daysOfWeekVisible: true,
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) =>
                          DateFormat.MMMM(locale).format(_focusedDay).toString(),
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: const TextStyle(
                        color: Color(0xffF61C7A),
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      ),
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: Color(0xff6C727F),
                        size: 30,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                        color: Color(0xff6C727F),
                        size: 30,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFCDDEC),
                      ),
                      todayTextStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      selectedDecoration: BoxDecoration(
                        //color: ColorManager.darkblue,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffFCDDEC),),
                      ),
                      selectedTextStyle: const TextStyle(
                          color: Color(0xffF61C7A),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: (DateTime.now()).add(
                      const Duration(days: 60),
                    ),
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) =>
                        _showSelectedDay(selectedDay, focusedDay),
                    onFormatChanged: (format) => _showCalenderFormat(format),
                    onPageChanged: (focusedDay) => _showFocusDay(focusedDay),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
