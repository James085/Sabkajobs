import 'package:flutter/material.dart';
import '../main.dart';
import 'job_details_page.dart';
import 'my_profile.dart';
import 'training_program.dart';
import 'interview_history.dart';

class JobSeekerDashboard extends StatelessWidget {
  const JobSeekerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF061449),
        title: const Text('SabkaJobs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFEBD61),
              foregroundColor: const Color(0xFF754C00),
              radius: 16,
              child: const Text('RK', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF061449),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF061449)),
              child: Text('SabkaJobs', style: TextStyle(color: Color(0xFF835500), fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Color(0xFF754C00)),
              title: const Text('Dashboard', style: TextStyle(color: Color(0xFF754C00), fontWeight: FontWeight.bold)),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
              onTap: () {
                Navigator.pop(context); // Already on Dashboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white70),
              title: const Text('My Profile', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.white70),
              title: const Text('Training', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainingProgram()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_edu, color: Colors.white70),
              title: const Text('Interviews', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InterviewHistory()));
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF835500),
                foregroundColor: Colors.white,
                child: const Text('RK'),
              ),
              title: const Text('Ravi Kumar', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Active Trainee', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
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
            const Row(
              children: [
                Text('Good morning, Ravi!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                Text(' 👋', style: TextStyle(fontSize: 32)),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Your Day 2 training is ready. Keep up the momentum!', style: TextStyle(color: Color(0xFF45464F), fontSize: 16)),
            const SizedBox(height: 32),
            
            // Stats Bento Grid
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _buildStatCard('Training Progress', '20%', '2/10 modules', const Color(0xFF835500)),
                _buildStatCard('ATS Score', '78/100', 'Resume strength', const Color(0xFF061449)),
                _buildStatCard('Interviews Attended', '3', 'This month', const Color(0xFF061449)),
                _buildStatCard('Job Matches', '14', 'Active listings', const Color(0xFF2E7D32)),
              ],
            ),
            const SizedBox(height: 40),
            
            // Featured Training
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2A5E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('TRAINING PROGRESS', style: TextStyle(color: Color(0xFF835500), fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text('20% Complete', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          const Text('Day 2 of 10 — Interview Body Language', style: TextStyle(color: Color(0xFF8793CD), fontSize: 14)),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFEBD61),
                          foregroundColor: const Color(0xFF754C00),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainingProgram()));
                        },
                        icon: const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
                        label: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEBD61),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(color: const Color(0xFFFEBD61).withOpacity(0.5), blurRadius: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Today's Tasks
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FF),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Today's Training — Day 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD3E4FE),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text('2 modules', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF45464F))),
                        ),
                      ],
                    ),
                  ),
                  _buildTaskItem(Icons.video_camera_front, const Color(0xFFFFDDB4), const Color(0xFF633F00), 'Interview Body Language & Confidence', '40 min · Soft Skills'),
                  const Divider(height: 1),
                  _buildTaskItem(Icons.description, const Color(0xFFDDE1FF), const Color(0xFF08164B), 'Answering \'Tell Me About Yourself\'', '20 min · Communication'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Recommended Jobs
            const Text('Top Job Matches for You', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const SizedBox(height: 24),
            Column(
              children: [
                _buildJobCard(context, 'Business Development Associate', 'Global Reach Solutions', 'Mumbai', '₹4 - 6 LPA', '92% Match'),
                const SizedBox(height: 24),
                _buildJobCard(context, 'Customer Support Specialist', 'Apex Cloud Services', 'Remote', '₹3 - 5 LPA', '88% Match'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, Color valueColor) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF45464F))),
          const SizedBox(height: 16),
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: valueColor)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
        ],
      ),
    );
  }

  Widget _buildTaskItem(IconData icon, Color iconBgColor, Color iconColor, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: const Text('Pending', style: TextStyle(color: Color(0xFF835500), fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(BuildContext context, String title, String company, String location, String salary, String match) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5EEFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.business, color: Color(0xFF061449)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(match, style: TextStyle(color: Colors.green.shade800, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0B1C30))),
          const SizedBox(height: 4),
          Text(company, style: const TextStyle(fontSize: 14, color: Color(0xFF45464F))),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Color(0xFF45464F)),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
              const SizedBox(width: 16),
              const Icon(Icons.payments, size: 16, color: Color(0xFF45464F)),
              const SizedBox(width: 4),
              Text(salary, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF061449),
                side: const BorderSide(color: Color(0xFF061449)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailsPage(
                      title: title,
                      company: company,
                      location: location,
                      salary: salary,
                    ),
                  ),
                );
              },
              child: const Text('View Details', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
