import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/providers/list_provider.dart';
import '../../../comman/todo_item.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {

   late ListProvider provier;
  @override
  Widget build(BuildContext context) {
    provier = Provider.of(context);
    if (provier.todos.isEmpty) provier.getTodosFromFirestore();
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(color: Theme
                  .of(context)
                  .primaryColor,),
              Container(color: Theme
                  .of(context)
                  .accentColor,),
              CalendarTimeline(
                initialDate: provier.selectedDate,
                firstDate: provier.selectedDate.subtract(Duration(days: 365)),
                lastDate: provier.selectedDate.add(Duration(days: 365)),
                onDateSelected: (date) {
                  provier.changeDate(date);
                },
                leftMargin: 20,
                monthColor: Colors.black,
                dayColor: Theme
                    .of(context)
                    .primaryColor,
                activeDayColor: Theme
                    .of(context)
                    .primaryColor,
                activeBackgroundDayColor: Colors.white,
                dotsColor: Colors.transparent,
                locale: 'en_ISO',
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: provier.todos.length,
                  itemBuilder: (_, index) {
                    return TodoItem(provier.todos[index]);
                  }
              )
          )
        ],
      ),
    );
  }


}
