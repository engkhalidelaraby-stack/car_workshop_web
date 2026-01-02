import 'package:flutter/material.dart';
import '../data_store.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<String> reports = [];
  String search = "";

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    reports = await getReports();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filtered = reports
        .where((r) => r.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('البلاغات')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'بحث برقم السيارة',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final p = filtered[i].split('|');
                return ListTile(
                  title: Text(p[0]),
                  subtitle:
                      Text('قطعة: ${p[1]}\nملاحظات: ${p[2]}\nتاريخ: ${p[3]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
