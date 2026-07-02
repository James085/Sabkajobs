import 'package:flutter/material.dart';
import '../main.dart';
import 'interview_history.dart';
import 'job_seeker_dashboard.dart';
import 'training_program.dart';
import 'edit_profile_page.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF061449),
        title: const Text('SabkaJobs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF061449),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF061449)),
              child: Text('SabkaJobs', style: TextStyle(color: Color(0xFFFEBD61), fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.white70),
              title: const Text('Dashboard', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const JobSeekerDashboard()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF754C00)),
              title: const Text('My Profile', style: TextStyle(color: Color(0xFF754C00), fontWeight: FontWeight.bold)),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
              onTap: () {
                Navigator.pop(context); // Already on profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.white70),
              title: const Text('Training', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TrainingProgram()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_edu, color: Colors.white70),
              title: const Text('Interviews', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InterviewHistory()));
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.pop(context); // Close drawer
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sign Out'),
                      content: const Text('Are you sure you want to sign out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LandingPage()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My Profile', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF061449),
                    side: const BorderSide(color: Color(0xFF767680)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Profile Header Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF835500), Color(0xFF1E2A5E)]),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text('RK', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ravi Kumar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                        const Text('Sales Associate • Vijayawada, Andhra Pradesh', style: TextStyle(color: Color(0xFF45464F))),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildBadge('Training Active', Colors.green),
                            const SizedBox(width: 8),
                            _buildBadge('Day 2 / 10', Colors.amber),
                            const SizedBox(width: 8),
                            _buildBadge('ATS: 78/100', Colors.blue),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Personal Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                      const SizedBox(height: 16),
                      _buildDetailRow('Full Name', 'Ravi Kumar'),
                      _buildDetailRow('Mobile', '+91 9123456780'),
                      _buildDetailRow('Email', 'ravi.k@email.com'),
                      _buildDetailRow('City', 'Vijayawada'),
                      _buildDetailRow('Education', 'B.Com 2024, Krishna University'),
                      _buildDetailRow('Preferred Role', 'Sales / Marketing'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Skill Strength', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                      const SizedBox(height: 16),
                      _buildSkillRow('Communication', 0.75),
                      const SizedBox(height: 16),
                      _buildSkillRow('MS Office', 0.60),
                      const SizedBox(height: 16),
                      _buildSkillRow('Problem Solving', 0.70),
                      const SizedBox(height: 16),
                      _buildSkillRow('Leadership', 0.50),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Placement Documents
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Placement Documents', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildDocCard('Aadhaar e-Sign', 'Verified', Colors.green),
                      const SizedBox(height: 16),
                      _buildDocCard('Resume', 'Uploaded', Colors.green),
                      const SizedBox(height: 16),
                      _buildDocCard('Photo', 'Pending', Colors.amber),
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

  Widget _buildBadge(String text, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.shade200),
      ),
      child: Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color.shade800)),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF45464F))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF061449))),
        ],
      ),
    );
  }

  Widget _buildSkillRow(String skill, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skill, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            Text('${(value * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF835500))),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: value,
          backgroundColor: const Color(0xFFE5EEFF),
          color: const Color(0xFF835500),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildDocCard(String title, String status, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.shade50.withOpacity(0.3),
        border: Border.all(color: color.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color.shade800)),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF061449))),
        ],
      ),
    );
  }
}
