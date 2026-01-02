import 'package:flutter/material.dart';
import '../data_store.dart';

class AddReport extends StatefulWidget {
  const AddReport({super.key});

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  List<String> cars = [];
  String? selectedCar;

  final part = TextEditingController();
  final notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    cars = await getCars();
    if (cars.isNotEmpty) selectedCar = cars.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة بلاغ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cars.isEmpty
            ? const Text('لا توجد سيارات')
            : Column(
                children: [
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCar,
                    items: cars
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (v) => setState(() => selectedCar = v),
                  ),
                  TextField(
                      controller: part,
                      decoration:
                          const InputDecoration(labelText: 'قطعة الغيار')),
                  TextField(
                      controller: notes,
                      decoration: const InputDecoration(labelText: 'ملاحظات')),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('حفظ البلاغ'),
                    onPressed: () async {
                      await addReport(
                        carPlate: selectedCar!,
                        part: part.text,
                        notes: notes.text,
                        date: DateTime.now().toString().split(' ')[0],
                      );
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
      ),
    );
  }
}
