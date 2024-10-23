import 'package:flutter/material.dart';

import './faculty/engineering.dart';
import './faculty/arts.dart';
import './faculty/business.dart';
import './faculty/applied_science.dart';
import './faculty/environment.dart';

class FacultiesPage extends StatefulWidget {
  const FacultiesPage({super.key});

  @override
  State<FacultiesPage> createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Faculty image at the top
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/slider_2.jpg'), // Background banner image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Faculty',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Manually created Faculty cards
            buildFacultyCard(
              context,
              'Engineering',
              'assets/faculties/engineering.jpg',
              'Major: 99',
              'Students: 100',
              EngineeringPage(), // Pass the details page
            ),
            buildFacultyCard(
              context,
              'Arts, Humanities and Social Sciences',
              'assets/faculties/arts.png',
              'Major: 99',
              'Students: 100',
              ArtsPage(), // Pass the details page
            ),
            buildFacultyCard(
              context,
              'Business and Management',
              'assets/faculties/business.jpg',
              'Major: 99',
              'Students: 100',
              BusinessPage(), // Pass the details page
            ),
            buildFacultyCard(
              context,
              'Applied Science',
              'assets/faculties/applied_science.jpg',
              'Major: 99',
              'Students: 100',
              AppliedSciencePage(), // Pass the details page
            ),
            buildFacultyCard(
              context,
              'Sustainable Built Environment',
              'assets/faculties/environment.jpg',
              'Major: 99',
              'Students: 100',
              EnvironmentPage(), // Pass the details page
            ),
          ],
        ),
      ),
    );
  }

  // Function to create a faculty card
  Padding buildFacultyCard(BuildContext context, String title, String imagePath,
      String major, String students, Widget detailsPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003665)),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Align to the start
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            major,
                            style: TextStyle(color: Color(0xB3003665)),
                          ),
                          Text(
                            students,
                            style: TextStyle(color: Color(0xB3003665)),
                          ),
                        ],
                      ),
                      const SizedBox(
                          width: 16), // Add space between texts and button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    detailsPage), // Navigate to details page
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xB3003665),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Less round
                          ),
                        ),
                        child: const Text(
                          'View details',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
