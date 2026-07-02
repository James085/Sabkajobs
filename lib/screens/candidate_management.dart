import 'package:flutter/material.dart';
import '../main.dart';
import 'schedule_interview.dart';

class CandidateManagement extends StatelessWidget {
  const CandidateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF061449),
        title: const Text('SabkaJobs Employer Portal', style: TextStyle(color: Colors.white, fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF061449),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF061449)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SabkaJobs', style: TextStyle(color: Color(0xFFFEBD61), fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Employer Portal', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1.5)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Color(0xFF754C00)),
              title: const Text('Candidates', style: TextStyle(color: Color(0xFF754C00))),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
              onTap: () { Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.white70),
              title: const Text('Schedule Interview', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScheduleInterview()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.white70),
              title: const Text('Send LOI', style: TextStyle(color: Colors.white70)),
              onTap: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Send LOI feature coming soon!'))); },
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
            const Text('Selected Candidates', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const Text('SabkaJobs placement-trained candidates ready for hiring', style: TextStyle(color: Color(0xFF45464F))),
            const SizedBox(height: 24),
            
            // Search & Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search candidates...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Coming soon!'))); },
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Stats Bento Grid
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStatCard('TOTAL CANDIDATES', '5', '+2 today', const Color(0xFF061449)),
                _buildStatCard('SHORTLISTED', '2', '', const Color(0xFF835500)),
                _buildStatCard('INTERVIEW SCHEDULED', '1', '', const Color(0xFF061449)),
                _buildStatCard('LOI SENT', '1', '', Colors.green[700]!),
              ],
            ),
            const SizedBox(height: 32),
            
            // Candidates List
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildCandidateRow(
                    'Priya Sharma', 'Marketing Executive', '88', 'Shortlisted', Colors.green,
                  ),
                  const Divider(height: 1),
                  _buildCandidateRow(
                    'Ravi Kumar', 'Sales Associate', '76', 'Interview Scheduled', Colors.amber,
                  ),
                  const Divider(height: 1),
                  _buildCandidateRow(
                    'Sneha Patel', 'HR Recruiter', '92', 'LOI Sent', Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, Color valueColor) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF45464F))),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: valueColor)),
              if (subtitle.isNotEmpty) const SizedBox(width: 8),
              if (subtitle.isNotEmpty) Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCandidateRow(String name, String role, String ats, String status, MaterialColor statusColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF061449),
                child: Text(name.substring(0, 2).toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                    Text(role, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text('ATS', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.green.shade50, shape: BoxShape.circle),
                    child: Text(ats, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green.shade700)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: statusColor.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: statusColor.shade700, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
