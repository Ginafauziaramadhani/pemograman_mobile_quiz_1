import 'package:flutter/material.dart';

class TreatmentInfoPage extends StatelessWidget {
  TreatmentInfoPage({super.key});

  // Mock data for treatments
  final List<Map<String, String>> treatments = [
    {
      'name': 'Dental Cleaning',
      'description':
          'A procedure to remove plaque and tartar to maintain oral hygiene.',
    },
    {
      'name': 'Root Canal',
      'description':
          'A treatment to repair and save a badly decayed or infected tooth.',
    },
    {
      'name': 'Tooth Extraction',
      'description':
          'Removal of a tooth from its socket in the bone due to damage or decay.',
    },
    {
      'name': 'Teeth Whitening',
      'description':
          'A cosmetic procedure to brighten the appearance of teeth.',
    },
    {
      'name': 'Dental Implants',
      'description':
          'A surgical procedure to replace missing teeth with artificial ones.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Treatment Info"),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: treatments.length,
        itemBuilder: (context, index) {
          final treatment = treatments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.blue),
              title: Text(treatment['name']!),
              subtitle: Text(treatment['description']!),
            ),
          );
        },
      ),
    );
  }
}
