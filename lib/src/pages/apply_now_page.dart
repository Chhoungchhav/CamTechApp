import 'package:flutter/material.dart';
import './admission/personal_info_form.dart';

class ApplyNowPage extends StatefulWidget {
  const ApplyNowPage({super.key});

  @override
  State<ApplyNowPage> createState() => _ApplyNowPageState();
}

class _ApplyNowPageState extends State<ApplyNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Blue background as shown in the image
        elevation: 0, // Centers the title
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wrap all the text in a single Container with a blue border
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF003B73), // Blue border color
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "Cambodia University of Technology and Science\nBachelor's Degree Application Form",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003665),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Application Instructions
                  Text(
                    "Application Instruction",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003665),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Welcome text
                  Text(
                    "Welcome to CamTech University's online application! Before submitting your application, you must complete all the required information accurately, and upload the following required documents:",
                    style: TextStyle(fontSize: 14, color: Color(0xFF003665)),
                  ),
                  SizedBox(height: 16),

                  // Required documents list
                  Text(
                    "1. One of these documents: Birth Certificate / National ID Card/Passport (PDF/JPG)",
                    style: TextStyle(fontSize: 14, color: Color(0xFF003665)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "2. High school certificate or any equivalent document (High School graduate) or grade 12 student ID card",
                    style: TextStyle(fontSize: 14, color: Color(0xFF003665)),
                  ),
                  SizedBox(height: 16),

                  // Note
                  Text(
                    "Note: If there is incomplete information, the application will be rejected.",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF003665),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Contact information
                  Text(
                    "For more details, please contact: 078/ 086 21 21 81.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF003665)),
                  ),
                ],
              ),
            ),
            Spacer(), // Pushes buttons to the bottom

            // Buttons: Back and Next
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubmissionForm()), // Navigate to Apply Now page
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF003665), // Blue button color
                  padding: EdgeInsets.symmetric(
                      horizontal: 35, vertical: 14), // Rectangular shape
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Less rounded corners
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
