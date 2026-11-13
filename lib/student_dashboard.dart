import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  Widget buildSubjectCard(String subject, String instructor, String schedule) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 16)),
            Text('Instructor: $instructor'),
            Text('Schedule: $schedule'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              debugPrint('Logout clicked');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 38,
                child: ClipOval(
                  child: Image.network(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                    width: 76,
                    height: 76,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 36);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joren P. Montejo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('ID: 543-732'),
                    Text('BSCS 4TH YEAR'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Card(
            elevation: 3,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email, size: 20),
                  title: Text('j.montejo.543732@umindanao.edu.ph'),
                ),
                ListTile(
                  leading: Icon(Icons.phone, size: 20),
                  title: Text('+63 987 665 4321'),
                ),
                ListTile(
                  leading: Icon(Icons.home, size: 20),
                  title: Text('143 G.E Torress St. Davao City, Philippines'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Subjects',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          buildSubjectCard(
            'Mobile App Development',
            'Mr. Micheal Aguido Velez',
            'Mon/Fri 8:00 - 10:00 AM',
          ),
          buildSubjectCard(
            'CAED500 C',
            'Mr. Patrick Jesse Ugmad',
            'Mon/Fri 12:30 - 1:30 PM',
          ),
          buildSubjectCard(
            'CS24L',
            'Ms. Altheae Owe',
            'Mon/Fri 3:30 - 5:30 PM',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Subject',
        onPressed: () {
          debugPrint('Add Subject Clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}