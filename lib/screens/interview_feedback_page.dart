import 'package:flutter/material.dart';

class InterviewFeedbackPage extends StatelessWidget {
  final String company;
  final String role;
  final String status;
  final String feedback;

  const InterviewFeedbackPage({
    super.key,
    required this.company,
    required this.role,
    required this.status,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF061449),
        title: const Text('Interview Details', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      const Icon(Icons.corporate_fare, size: 40, color: Color(0xFF061449)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(company, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                            Text(role, style: const TextStyle(fontSize: 16, color: Color(0xFF45464F))),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: status == 'Selected' ? Colors.green.shade100 : (status == 'Rejected' ? Colors.red.shade100 : Colors.orange.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: status == 'Selected' ? Colors.green.shade800 : (status == 'Rejected' ? Colors.red.shade800 : Colors.orange.shade800),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text('Feedback / Notes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF061449))),
                  const SizedBox(height: 12),
                  Text(
                    feedback.isNotEmpty ? feedback : 'No feedback available at this time.',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF45464F), height: 1.5, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 32),
                  if (status == 'Selected')
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offer accepted successfully!')));
                          Navigator.pop(context);
                        },
                        child: const Text('Accept Offer', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    )
                  else if (status == 'Pending')
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF061449),
                          side: const BorderSide(color: Color(0xFF061449)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('HR Contacted!')));
                        },
                        child: const Text('Follow up with HR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
