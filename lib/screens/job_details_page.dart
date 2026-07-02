import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;

  const JobDetailsPage({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Job Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.business, size: 32, color: Color(0xFF061449)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0B1C30))),
                      const SizedBox(height: 4),
                      Text(company, style: const TextStyle(fontSize: 16, color: Color(0xFF45464F))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Info row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoBadge(Icons.location_on, location),
                _buildInfoBadge(Icons.payments, salary),
                _buildInfoBadge(Icons.work, 'Full Time'),
              ],
            ),
            const SizedBox(height: 32),
            
            const Text('Job Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const SizedBox(height: 12),
            const Text(
              'We are looking for an enthusiastic individual to join our fast-growing team. You will be responsible for driving growth, managing client relationships, and ensuring high customer satisfaction.',
              style: TextStyle(color: Color(0xFF45464F), height: 1.5),
            ),
            const SizedBox(height: 24),
            
            const Text('Requirements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const SizedBox(height: 12),
            _buildBulletPoint('Excellent communication skills'),
            _buildBulletPoint('Basic understanding of sales principles'),
            _buildBulletPoint('Ability to work in a fast-paced environment'),
            _buildBulletPoint('Willingness to learn and adapt'),
            const SizedBox(height: 40),
            
            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF061449),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Application Submitted Successfully!'), backgroundColor: Colors.green),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Apply Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF835500)),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF45464F))),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF45464F), fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF45464F), height: 1.5))),
        ],
      ),
    );
  }
}
