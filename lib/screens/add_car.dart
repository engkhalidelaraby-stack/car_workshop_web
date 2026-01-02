import 'package:flutter/material.dart';
import '../data_store.dart';

class AddCar extends StatelessWidget {
  AddCar({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة سيارة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'رقم السيارة'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('حفظ'),
              onPressed: () async {
                await addCar(controller.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
