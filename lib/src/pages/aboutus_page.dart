import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/about_us.jpeg',
                fit: BoxFit.cover,
                height: 150,
              ),
              SizedBox(height: 16),
              _buildCard(
                title: "Our Motto",
                content: "Knowledge\nReason\nCharacter",
              ),
              _buildCard(
                title: "Our Vision",
                content: "To be a leading university with an international "
                    "reputation for academic excellence in the fields of Science and Technology.",
              ),
              _buildCard(
                title: "Our Mission",
                content:
                    "To offer applied research and innovation-focused education "
                    "to transform lives that respond to industrial development and socio-economic growth needs.",
              ),
              _buildCard(
                title: "Contact Info",
                content: "CamTech Street, Chroy Chongvar Satellite City, "
                    "Sangkat Prektasek, Khan Chroy Chongvar, Phnom Penh, Cambodia\n"
                    "+855 78 21 21 81\n+855 86 21 21 81\ninfo@camtech.edu.kh",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String content}) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003665),
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: Color(0xB3003665)),
            ),
          ],
        ),
      ),
    );
  }
}
