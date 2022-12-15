import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/model/TodoDM.dart';
import 'package:todo_c7_mon/providers/list_provider.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo;
  TodoItem(this.todo);
  late ListProvider provider ;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(onPressed: (_){
            FirebaseFirestore.instance.collection("todos").doc(todo.id)
                .delete().timeout(Duration(milliseconds: 500), onTimeout: (){
                 provider.getTodosFromFirestore();
                });
          },
            label: "Delete",
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            flex: 2,

          )
        ],
      ),
      child: Container(
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
      ),
    );
  }
}
