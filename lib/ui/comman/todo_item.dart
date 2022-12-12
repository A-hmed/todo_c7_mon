import 'package:flutter/material.dart';
import 'package:todo_c7_mon/model/TodoDM.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo;
  TodoItem(this.todo);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(color: Theme.of(context).primaryColor, height: 50, width:6,),
          Spacer(),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(todo.title,
                   textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 12,),
                Text(todo.description,
                  style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              
              child: Image.asset("assets/ic_check.png")),
        ],
      ),
    );
  }
}
