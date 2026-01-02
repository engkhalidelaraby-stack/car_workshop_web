import 'package:flutter/material.dart';
import '../data_store.dart';

class EditReport extends StatefulWidget {
  final int index;
  final String part;
  final String notes;

  EditReport({required this.index, required this.part, required this.notes});

  @override
  State<EditReport> createState() => _EditReportState();
}

class _EditReportState extends State<EditReport> {
  late TextEditingController partController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    partController = TextEditingController(text: widget.part);
    notesController = TextEditingController(text: widget.notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تعديل البلاغ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: partController,
              decoration: InputDecoration(labelText: "اسم القطعة"),
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: "ملاحظات"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                editReport(
                    widget.index, partController.text, notesController.text);
                Navigator.pop(context);
              },
              child: Text("حفظ التعديل"),
            ),
          ],
        ),
      ),
    );
  }
}
