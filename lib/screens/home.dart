import 'package:flutter/material.dart';
import '../data_store.dart';
import 'add_car.dart';
import 'edit_car.dart';
import 'add_report.dart';
import 'reports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> cars = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    cars = await getCars();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ورشة ميكانيكي')),
      body: ListView(
        children: cars
            .map(
              (c) => ListTile(
                title: Text(c),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditCar(oldPlate: c),
                      ),
                    );
                    load();
                  },
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            child: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddCar()),
              );
              load();
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "report",
            child: const Icon(Icons.build),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddReport()),
              );
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "list",
            child: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
