import 'package:flutter/material.dart';

class WhyCamTechScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                SizedBox(width: 8),
                Text(
                  'Why CamTech',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSection('Employability', 'assets/images/slider_1.jpg', [
                    'Project-based work integrated learning experience',
                    'Entrepreneurship and leadership skills',
                    'Teaching informed by research and innovation',
                    'Industry and business linkage for job placement',
                    'Support for start-ups and business innovation',
                    'English as a medium of instruction language',
                    'Chinese as third business language',
                  ]),
                  _buildSection(
                      'Highly Qualified and Experienced Faculty Members',
                      'assets/images/slider_1.jpg', [
                    'Full-Time lecturers & world-class researchers',
                    'All lecturers completed a post-graduate certificate of teaching and learning',
                  ]),
                  _buildSection(
                      'Outstanding Facilities', 'assets/images/slider_1.jpg', [
                    'Sports Complex: Gym, basketball, volleyball, football, table tennis, and badminton',
                    'Labs: Robotics, AIlab4Education, maker space, and start-up studio',
                    'Research Centers: Social Innovation & AI, Big Data & Cyber Security (ABC)',
                    'Brand-new campus on a 5-hectare space with green environment equipped with digital and physical library facilities.',
                  ]),
                  _buildSection(
                      'Contributes to Cambodia\'s Socio-Economic Growth & Development',
                      'assets/images/slider_1.jpg', [
                    'Addressing the challenges of Cambodia and the region',
                    'Contributing to the Sustainable Development Goals (SDGs)',
                    'Member of the United Nations Sustainable Development Solutions Network (SDSN)',
                    'Center for Social Innovation',
                    'Promoting diversity and multiculturalism',
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String imagePath, List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image above the section
          Image.asset(imagePath, fit: BoxFit.cover),
          SizedBox(height: 8),
          _buildSectionTitle(title),
          _buildSectionContent(items),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF003665)),
    );
  }

  Widget _buildSectionContent(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '• $item',
              style: TextStyle(fontSize: 16, color: Color(0xFF003665)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
