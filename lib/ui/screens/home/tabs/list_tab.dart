import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_mon/utils/my_theme_data.dart';

import '../../../comman/todo_item.dart';

class ListTab extends StatelessWidget {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
                 Container(color: Theme.of(context).primaryColor,),
                 Container(color: Theme.of(context).accentColor,),
              CalendarTimeline(
                initialDate: selectedDate,
                firstDate: selectedDate.subtract(Duration(days: 365)),
                lastDate: selectedDate.add(Duration(days: 365)),
                onDateSelected: (date){selectedDate = date;},
                leftMargin: 20,
                monthColor: Colors.black,
                dayColor: Theme.of(context).primaryColor,
                activeDayColor: Theme.of(context).primaryColor,
                activeBackgroundDayColor: Colors.white,
                dotsColor: Colors.transparent,
                locale: 'en_ISO',
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return TodoItem();
                  }
              )
          )

        ],
      ),
    );
  }
}
