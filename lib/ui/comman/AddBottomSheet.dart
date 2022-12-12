import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/providers/list_provider.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  String title = "";
  String description = "";
  final formKey = GlobalKey<FormState>();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(24),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add new task", textAlign: TextAlign.center,  style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 18),
                  labelText: "Enter you task title"),
              onChanged: (text){
                title = text;
              },
              validator: (text){
                if(text  == null || text.isEmpty) {
                  return "Please enter title";
                }
              },
            ),
            TextFormField(
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 18),
                  labelText: "Description"),
              onChanged: (text){
                description = text;
              },
              validator: (text){
                if(text  == null || text.isEmpty) {
                  return "Please enter Description";
                }
              },
            ),
            Text("Select time", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                showMyDatePicker();
              },
                child: Text("${selectedDate.day}/${selectedDate.month}"
                    "/${selectedDate.year}", textAlign: TextAlign.center,)
            ),
            Spacer(),
            ElevatedButton(onPressed: (){
              onAddClicked();
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: selectedDate.add(Duration(days: 365))
    )?? DateTime.now();
  }

  void onAddClicked() {
    if (!formKey.currentState!.validate()) return;

    var todosCollection = FirebaseFirestore.instance.collection("todos");
    var emptyDoc = todosCollection.doc();
    emptyDoc.set({
      "id": emptyDoc.id,
      "title": title,
      "description": description,
      "date": selectedDate.millisecondsSinceEpoch,
      "isDone":false
    }).timeout(Duration(milliseconds: 500),onTimeout:  (){
      provider.getTodosFromFirestore();
      Navigator.pop(context);
    });

  }
}
