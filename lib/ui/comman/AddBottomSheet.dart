import 'package:flutter/material.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add new task", textAlign: TextAlign.center,  style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 8,),
          TextFormField(
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 18),
                labelText: "Enter you task title"),
          ),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 18),
                labelText: "Description"),
          ),
          Text("Select time", style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              showMyDatePicker();
            },
              child: Text("8/12/2022", textAlign: TextAlign.center,)
          ),
          Spacer(),
          ElevatedButton(onPressed: (){}, child: Text("Add"))
        ],
      ),
    );
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(context: context,
      initialDate: selectedDate??DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: selectedDate!.add(Duration(days: 365))
    );
  }
}
