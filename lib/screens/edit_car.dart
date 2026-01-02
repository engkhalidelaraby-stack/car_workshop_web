import 'package:flutter/material.dart';
import '../data_store.dart';

class EditCar extends StatefulWidget {
  final String oldPlate;
  const EditCar({super.key, required this.oldPlate});

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.oldPlate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تعديل سيارة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: controller),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('حفظ'),
              onPressed: () async {
                await updateCar(widget.oldPlate, controller.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
