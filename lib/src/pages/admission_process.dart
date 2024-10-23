import 'package:flutter/material.dart';

class AdmissionProcessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button and title below AppBar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Admission Process',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAdmissionCard(
                    1,
                    'Filing Application Form',
                    'Fill the application form by providing all the requested data.',
                  ),
                  SizedBox(height: 10),
                  _buildAdmissionCard(
                    2,
                    'Entrance Exam',
                    'Take a 90-minute exam for Mathematics\nTake a 60-minute exam for English.',
                  ),
                  SizedBox(height: 10),
                  _buildAdmissionCard(
                    3,
                    'Interview',
                    'Take a 15-minute interview.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdmissionCard(int index, String title, String description) {
    return SizedBox(
      width: 450, // Set fixed width
      height: 200, // Set fixed height
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF003665), width: 8), // Add border
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center everything vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center everything horizontally
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF003665)),
                textAlign: TextAlign.center, // Center text
              ),
              SizedBox(height: 25), // Space between title and description
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Color(0xFF003665)),
                textAlign: TextAlign.center, // Center text
              ),
              Spacer(), // Push the index number to the bottom
              Text(
                '$index', // Display the index number
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003665)),
                textAlign: TextAlign.center, // Center text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
