import 'package:flutter/material.dart';
import '../main.dart';
import 'interview_history.dart';
import 'my_profile.dart';
import 'job_seeker_dashboard.dart';

class TrainingProgram extends StatelessWidget {
  const TrainingProgram({super.key});

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
              leading: const Icon(Icons.school, color: Color(0xFF754C00)),
              title: const Text('Training', style: TextStyle(color: Color(0xFF754C00), fontWeight: FontWeight.bold)),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
              onTap: () {
                Navigator.pop(context); // Already on training
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
            const Text('Daily Training Program', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            const Text('10-day structured placement preparation. Complete daily tasks to unlock interviews.', style: TextStyle(color: Color(0xFF45464F))),
            const SizedBox(height: 24),
            
            // Overall Progress
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('OVERALL PROGRESS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                      const Text('20%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF835500))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: const Color(0xFFE5EEFF),
                          color: const Color(0xFF835500),
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text('2/10', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                          Text('Modules done', style: TextStyle(fontSize: 10, color: Color(0xFF45464F))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Day 1
            _buildDaySection('Day 1 — Profile & Branding', 'D1', [
              _buildTaskCard('Resume Building & ATS Optimization', '45 min · Communication', true, true, false),
              _buildTaskCard('Personal Branding on LinkedIn', '30 min · Personal Branding', true, true, false),
            ]),
            const SizedBox(height: 32),
            
            // Day 2
            _buildDaySection('Day 2 — Interview Readiness', 'D2', [
              _buildTaskCard('Interview Body Language & Confidence', '40 min · Soft Skills', true, false, false),
              _buildTaskCard('Answering \'Tell Me About Yourself\'', '20 min · Communication', false, false, false),
            ]),
            const SizedBox(height: 32),
            
            // Day 3 (Locked)
            Opacity(
              opacity: 0.6,
              child: _buildDaySection('Day 3 — HR Interview Skills', 'D3', [
                _buildTaskCard('HR Interview Questions Masterclass', '60 min · Interview Skills', true, false, true),
                _buildTaskCard('Salary Negotiation Tactics', '35 min · Negotiation', true, false, true),
              ], lockedText: 'Locked until Day 2 complete'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySection(String title, String dayCode, List<Widget> tasks, {String? lockedText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF061449),
              foregroundColor: Colors.white,
              child: Text(dayCode, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
            if (lockedText != null) ...[
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFFE5EEFF), borderRadius: BorderRadius.circular(16)),
                child: Text(lockedText, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF45464F))),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            tasks[0],
            if (tasks.length > 1) ...[
              const SizedBox(height: 16),
              tasks[1],
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String subtitle, bool isVideo, bool isCompleted, bool isLocked) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              gradient: isLocked 
                  ? const LinearGradient(colors: [Colors.grey, Colors.grey]) 
                  : (isVideo 
                      ? const LinearGradient(colors: [Color(0xFFC2A47A), Color(0xFF835500)])
                      : const LinearGradient(colors: [Color(0xFF061449), Color(0xFF1E2A5E)])),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isLocked ? Colors.grey.shade700 : (isVideo ? const Color(0xFF835500) : const Color(0xFF061449)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(isVideo ? 'VIDEO' : 'ARTICLE', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
                Center(
                  child: isLocked 
                      ? const Icon(Icons.lock, size: 48, color: Colors.white54)
                      : Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
                          child: Icon(isVideo ? Icons.play_arrow : Icons.description, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF061449))),
                      const SizedBox(height: 4),
                      Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF45464F))),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if (isCompleted)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: Colors.white, size: 16),
                  )
                else
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400, width: 2), shape: BoxShape.circle),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
