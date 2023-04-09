import 'dart:async';

import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/tabs/appointment_tab.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/tabs/home_tab.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:tabnavigator/tabnavigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.home: () {
      return FirstTab();
    },
    AppTab.appointment: () {
      return AppointmentTab();
    },
    AppTab.profile: () {
      return ProfileTab();
    },
   
  };

  Widget _buildBody() {
    return TabNavigator(
      initialTab: _initTab,
      selectedTabStream: tabStream,
      mappedTabs: _map,
    );
  }

  Widget _buildbottomNavigationBar() {
    return StreamBuilder<AppTab>(
      stream: tabStream,
      initialData: _initTab,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          fixedColor: primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Profile',
            ),
          ],
          currentIndex: snapshot.hasData ? snapshot.data!.value : 0,
          onTap: (value) => _tabController.sink.add(AppTab.byValue(value)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    _tabController.close();
    super.dispose();
  }
}

class AppTab extends TabType {
  const AppTab._(int value) : super(value);

  static const home = AppTab._(0);
  static const appointment = AppTab._(1);
  static const profile = AppTab._(2);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return home;
      case 1:
        return appointment;
      case 2:
        return profile;
      default:
        throw Exception('no tab for such value');
    }
  }
}
