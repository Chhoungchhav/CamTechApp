import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import './why_camtech.dart';
import './admission_process.dart';
import './apply_now_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/slider_1.jpg',
    'assets/images/slider_2.jpg',
  ];

  // Helper function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Icon widget to forward users to URLs with border
  Widget _buildIconForwarder(String imgPath, String url) {
    return GestureDetector(
      onTap: () {
        _launchURL(url); // Launch URL when tapped
      },
      child: Card(
        color: Colors.white,
        elevation: 2, // Adds shadow for card effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Padding(
          padding: EdgeInsets.all(8), // Padding inside the card
          child: Center(
            child: Image.asset(
              imgPath,
              width: 35, // Set a fixed width for the icon
              fit: BoxFit.contain, // Ensure the icon fits within the card
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News & Events Section
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 135,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child:
                              Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            // Apply for Admissions Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ApplyNowPage()), // Navigate to Apply Now page
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apply for Admissions',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Please register with us today to get a world-class education with affordable fees at your doorstep. We are accepting national and international applicants with any background.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        /*Center(
                          child: ElevatedButton(
                            onPressed:
                                null, // Disable button, since whole card is clickable
                            child: Text('Apply Now'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WhyCamTechScreen()),
                      );
                    },
                    child: _buildIconText(Icons.help_outline, "Why CamTech"),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle Achievement tap if needed
                    },
                    child: _buildIconText(Icons.emoji_events, "Achievement"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdmissionProcessScreen()),
                      );
                    },
                    child: _buildIconText(
                        Icons.assignment_ind, "Admission Process"),
                  ),
                ],
              ),
            ),

            // Follow Us Section with URL Icon Forwarders
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Follow Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003865),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height:
                    58, // Set a fixed height for the horizontal scrollable area
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildIconForwarder('assets/icons/facebook.png',
                        'https://web.facebook.com/CamTechUniversity?_rdc=1&_rdr'),
                    SizedBox(width: 16),
                    _buildIconForwarder(
                        'assets/icons/telegram.jpg', 'https://t.me/camtech168'),
                    SizedBox(width: 16),
                    _buildIconForwarder('assets/icons/linkedin.png',
                        'https://www.linkedin.com/company/camtech-university'),
                    SizedBox(width: 16),
                    _buildIconForwarder(
                        'assets/icons/website.png', 'https://camtech.edu.kh/'),
                    SizedBox(width: 16),
                    _buildIconForwarder('assets/icons/youtube.jpg',
                        'https://www.youtube.com/channel/UCeoeA3Twia85XayMU75ZicA'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, String label) {
    return Card(
      color: Colors.white,
      elevation: 2, // Adds shadow to give a card effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
        // Border with color and width
      ),
      child: Container(
        width: 112, // Set fixed width for uniform size
        height: 112, // Set fixed height for uniform size
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Color(0xFF003865)),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
