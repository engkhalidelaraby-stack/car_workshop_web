import 'package:flutter/material.dart';
import '../data_store.dart';
import 'edit_report.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController plateController = TextEditingController();
  List<int> resultsIndexes = [];

  void search() {
    setState(() {
      resultsIndexes = [];
      for (int i = 0; i < reports.length; i++) {
        if (reports[i]['plate'] == plateController.text) resultsIndexes.add(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("بحث")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: InputDecoration(labelText: "رقم السيارة"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: search, child: Text("بحث")),
            SizedBox(height: 20),
            Expanded(
              child: resultsIndexes.isEmpty
                  ? Center(child: Text("لا توجد نتائج"))
                  : ListView.builder(
                      itemCount: resultsIndexes.length,
                      itemBuilder: (context, idx) {
                        final i = resultsIndexes[idx];
                        final r = reports[i];
                        return Card(
                          child: ListTile(
                            title: Text("رقم السيارة: ${r['plate']}"),
                            subtitle: Text(
                                "القطعة: ${r['part']}\nملاحظات: ${r['notes']}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditReport(
                                      index: i,
                                      part: r['part'],
                                      notes: r['notes'],
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
