import 'package:flutter/material.dart';
import '../main.dart';
import 'my_profile.dart';
import 'job_seeker_dashboard.dart';
import 'training_program.dart';
import 'interview_feedback_page.dart';

class InterviewHistory extends StatelessWidget {
  const InterviewHistory({super.key});

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
              leading: const Icon(Icons.person, color: Colors.white70),
              title: const Text('My Profile', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyProfile()));
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
              leading: const Icon(Icons.history_edu, color: Color(0xFF754C00)),
              title: const Text('Interviews', style: TextStyle(color: Color(0xFF754C00), fontWeight: FontWeight.bold)),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
              onTap: () {
                Navigator.pop(context); // Already on Interviews
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
            const Text('Interview History', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const Text('Track all your interview attempts and outcomes in one place.', style: TextStyle(color: Color(0xFF45464F))),
            const SizedBox(height: 24),
            
            // Stats Grid
            Row(
              children: [
                Expanded(child: _buildStatCard('Total', '3', const Color(0xFF061449))),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('Selected', '1', Colors.green.shade600)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('Pending', '1', const Color(0xFF835500))),
              ],
            ),
            const SizedBox(height: 32),
            
            // List Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('All Interviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                  ),
                  const Divider(height: 1),
                  _buildInterviewItem(context,
                    Icons.computer, 'Infosys BPM', 'Selected', Colors.green, 'Process Associate', '20 Jun 2025', 'Virtual', '"Good communication, confident."',
                  ),
                  const Divider(height: 1),
                  _buildInterviewItem(context,
                    Icons.corporate_fare, 'TCS iON', 'Pending', Colors.amber.shade700, 'HR Executive', '12 Jun 2025', 'Direct', '',
                  ),
                  const Divider(height: 1),
                  _buildInterviewItem(context,
                    Icons.devices, 'Wipro', 'Rejected', Colors.red, 'Sales Coordinator', '4 Jun 2025', 'Virtual', '"Needs to improve technical knowledge."',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: valueColor)),
          const SizedBox(height: 4),
          Text(title.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF45464F), letterSpacing: 1.5)),
        ],
      ),
    );
  }

  Widget _buildInterviewItem(BuildContext context, IconData icon, String company, String status, Color statusColor, String role, String date, String type, String feedback) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE9FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF061449), size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Text(company, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                          child: Text(status, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.work, size: 16, color: Color(0xFF45464F)),
                            const SizedBox(width: 4),
                            Text(role, style: const TextStyle(color: Color(0xFF45464F), fontSize: 14)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.calendar_today, size: 16, color: Color(0xFF45464F)),
                            const SizedBox(width: 4),
                            Text(date, style: const TextStyle(color: Color(0xFF45464F), fontSize: 14)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(type == 'Virtual' ? Icons.videocam : Icons.location_on, size: 16, color: const Color(0xFF45464F)),
                            const SizedBox(width: 4),
                            Text(type, style: const TextStyle(color: Color(0xFF45464F), fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    if (feedback.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(feedback, style: const TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF767680))),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: status == 'Selected' ? const Color(0xFF835500) : Colors.white,
                foregroundColor: status == 'Selected' ? Colors.white : const Color(0xFF061449),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: status != 'Selected' ? const BorderSide(color: Color(0xFF061449)) : BorderSide.none,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InterviewFeedbackPage(
                  company: company,
                  role: role,
                  status: status,
                  feedback: feedback,
                )));
              },
              child: Text(status == 'Selected' ? 'View Offer' : (status == 'Pending' ? 'Contact HR' : 'Feedback Details')),
            ),
          ),
        ],
      ),
    );
  }
}
