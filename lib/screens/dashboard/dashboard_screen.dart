import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/screens/dashboard/exchange/exchange_screen.dart';
import 'package:trading_app/screens/dashboard/history/history_screen.dart';
import 'package:trading_app/screens/dashboard/home/home_screen.dart';
import 'package:trading_app/screens/dashboard/portfolio/portfoluio_screen.dart';
import 'package:trading_app/screens/dashboard/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentTab = 0;
  Widget _currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff7248ef),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.w)),
        onPressed: () {
          setState(() {
            _currentScreen = const ExchangeScreen();
            _currentTab = 2;
          });
        },
        child: const Icon(Icons.autorenew_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 55.h,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w,right: 20),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreen = const HomeScreen();
                    _currentTab = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: _currentTab == 0
                      ? const Color(0xff3500D4)
                      : Colors.grey.shade600,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 90.w),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreen = const PortfolioScreen();
                    _currentTab = 1;
                  });
                },
                icon: Icon(
                  Icons.auto_graph,
                  color: _currentTab == 1
                      ? const Color(0xff3500D4)
                      : Colors.grey.shade600,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreen = const HistoryScreen();
                    _currentTab = 3;
                  });
                },
                icon: Icon(
                  Icons.history,
                  color: _currentTab == 3
                      ? const Color(0xff3500D4)
                      : Colors.grey.shade600,
                  size: 35,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentScreen = const ProfileScreen();
                  _currentTab = 4;
                });
              },
              icon: Padding(
                  padding:  EdgeInsets.only(right: 20.w),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: _currentTab == 4
                      ? const Color(0xff3500D4)
                      : Colors.grey.shade600,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
