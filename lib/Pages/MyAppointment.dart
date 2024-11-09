import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatelessWidget {
  MyAppointmentsPage({super.key});

  // Mock data for appointments
  final List<Map<String, String>> appointments = [
    {
      'date': '2023-12-01',
      'time': '10:00 AM',
      'purpose': 'Dental Cleaning',
      'status': 'Confirmed',
    },
    {
      'date': '2023-12-15',
      'time': '2:00 PM',
      'purpose': 'Consultation',
      'status': 'Pending',
    },
    {
      'date': '2023-12-20',
      'time': '9:30 AM',
      'purpose': 'Follow-up',
      'status': 'Confirmed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.event_available, color: Colors.blue),
              title: Text('${appointment['date']} at ${appointment['time']}'),
              subtitle: Text('Purpose: ${appointment['purpose']}'),
              trailing: Text(
                appointment['status']!,
                style: TextStyle(
                  color: appointment['status'] == 'Confirmed'
                      ? Colors.green
                      : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
