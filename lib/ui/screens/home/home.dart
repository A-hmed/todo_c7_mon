import 'package:flutter/material.dart';
import 'package:todo_c7_mon/ui/comman/AddBottomSheet.dart';
import 'package:todo_c7_mon/ui/screens/home/tabs/list_tab.dart';
import 'package:todo_c7_mon/ui/screens/home/tabs/settings_tab.dart';
import 'package:todo_c7_mon/utils/my_theme_data.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myCurrentIndex = 0;

  List<Widget> tabs = [ListTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        toolbarHeight: MediaQuery.of(context).size.height * .2,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemeData.primirayColor,
        shape: const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
        onPressed: () {
          showAddBottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          currentIndex: myCurrentIndex,
          onTap: (index) {
            myCurrentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "list"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ],
        ),
      ),
      body: tabs[myCurrentIndex],
    );
  }

  void showAddBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (_){
          return AddBottomSheet();
        });
  }
}
