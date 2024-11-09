import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tugas1/Pages/MyAppointment.dart';
import 'package:tugas1/Pages/RequestAppointment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental IT',
      theme: ThemeData(
        primaryColor: Colors.teal[700], // Set your global primary color here
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.lime[600], // Secondary color
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental-It"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: Colors.white,
        ),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/carousel$i.jpeg',
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          SizedBox(height: 10),

          // Grid for Options
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Request Appointments
                  menuItem(
                      context: context,
                      icon: Icons.add_circle_outline,
                      label: "Request Appointments",
                      page: const RequestAppointmentPage()),
                  // My Appointments
                  menuItem(
                      context: context,
                      icon: Icons.list_alt,
                      label: "My Appointments",
                      page: MyAppointmentsPage()),
                  // Treatment Info
                  menuItem(
                      context: context,
                      icon: Icons.add_box_outlined,
                      label: "Treatment Info",
                      page: const RequestAppointmentPage()),
                  // Search
                  menuItem(
                      context: context,
                      icon: Icons.search,
                      label: "Search",
                      page: const RequestAppointmentPage()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
      {required BuildContext context,
      required IconData icon,
      required String label,
      required Widget page}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.tealAccent),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.tealAccent),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
