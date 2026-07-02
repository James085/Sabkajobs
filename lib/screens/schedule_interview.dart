import 'package:flutter/material.dart';
import 'candidate_management.dart';
import '../main.dart';

class ScheduleInterview extends StatefulWidget {
  const ScheduleInterview({super.key});

  @override
  State<ScheduleInterview> createState() => _ScheduleInterviewState();
}

class _ScheduleInterviewState extends State<ScheduleInterview> {
  int _selectedCandidateIndex = 0;
  bool _isVirtual = true;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF061449),
        title: const Text(
          'SabkaJobs Employer Portal',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
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
                  Text(
                    'SabkaJobs',
                    style: TextStyle(
                      color: Color(0xFFFEBD61),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Employer Portal',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.white70),
              title: const Text(
                'Candidates',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CandidateManagement(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Color(0xFF754C00)),
              title: const Text(
                'Schedule Interview',
                style: TextStyle(color: Color(0xFF754C00)),
              ),
              tileColor: const Color(0xFFFEBD61),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Already here
              },
            ),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.white70),
              title: const Text(
                'Send LOI',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Send LOI feature coming soon!')));
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.pop(context);
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
                            Navigator.pop(context);
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
              children: [
                const Icon(Icons.calendar_today, color: Color(0xFF061449)),
                const SizedBox(width: 8),
                const Text(
                  'SCHEDULING PORTAL',
                  style: TextStyle(
                    color: Color(0xFF835500),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Schedule Interview',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF061449),
              ),
            ),
            const Text(
              'Organize virtual or physical meetings with top-rated candidates',
              style: TextStyle(color: Color(0xFF45464F)),
            ),
            const SizedBox(height: 24),

            // Stack for columns
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Column: Candidate List
                Container(
                  height: 400,
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
                          const Text(
                            'Select Candidate',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF061449),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('View all candidates tapped')),
                              // );
                            },
                            icon: const Text(
                              'View All',
                              style: TextStyle(color: Color(0xFF835500)),
                            ),
                            label: const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFF835500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => _selectedCandidateIndex = 0),
                              child: _buildCandidateItem('Priya Sharma', 'Marketing', 'ATS 88', _selectedCandidateIndex == 0),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => _selectedCandidateIndex = 1),
                              child: _buildCandidateItem('Ravi Kumar', 'Sales', 'ATS 76', _selectedCandidateIndex == 1),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => _selectedCandidateIndex = 2),
                              child: _buildCandidateItem('Arjun Reddy', 'Operations', 'ATS 81', _selectedCandidateIndex == 2),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => _selectedCandidateIndex = 3),
                              child: _buildCandidateItem('Divya Nair', 'Support', 'ATS 69', _selectedCandidateIndex == 3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Bottom Column: Details
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
                          const Icon(
                            Icons.edit_calendar,
                            color: Color(0xFF061449),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Interview Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF061449),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'INTERVIEW MODE',
                        style: TextStyle(
                          color: Color(0xFF45464F),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _isVirtual = true),
                            child: _buildModeOption(Icons.videocam, 'Virtual', 'Google Meet', _isVirtual),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => setState(() => _isVirtual = false),
                            child: _buildModeOption(Icons.location_on, 'Walk-in', 'Office Premise', !_isVirtual),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Preferred Date',
                                style: TextStyle(
                                  color: Color(0xFF45464F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(const Duration(days: 30)),
                                  );
                                  if (pickedDate != null) {
                                    setState(() => _selectedDate = pickedDate);
                                  }
                                },
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    suffixIcon: const Icon(Icons.calendar_today),
                                  ),
                                  child: Text(
                                    _selectedDate == null
                                        ? 'Select Date'
                                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                    style: TextStyle(color: _selectedDate == null ? Colors.grey : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Preferred Time',
                                style: TextStyle(
                                  color: Color(0xFF45464F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    setState(() => _selectedTime = pickedTime);
                                  }
                                },
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    suffixIcon: const Icon(Icons.schedule),
                                  ),
                                  child: Text(
                                    _selectedTime == null
                                        ? 'Select Time'
                                        : _selectedTime!.format(context),
                                    style: TextStyle(color: _selectedTime == null ? Colors.grey : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5EEFF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF061449).withOpacity(0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF061449).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.info,
                                color: Color(0xFF061449),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                _isVirtual 
                                  ? 'A secure Google Meet link will be automatically generated and shared with the candidate via SMS and Email.'
                                  : 'Candidate will be notified with your office address and timing instructions via SMS and Email.',
                                style: const TextStyle(
                                  color: Color(0xFF384378),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFEBD61),
                            foregroundColor: const Color(0xFF754C00),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_selectedDate == null || _selectedTime == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please select both date and time')),
                              );
                              return;
                            }
                            
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Success'),
                                content: const Text('Interview scheduled successfully! The candidate has been notified.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Close dialog
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const CandidateManagement()),
                                      );
                                    },
                                    child: const Text('OK'),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: const Text(
                            'Schedule & Notify Candidate',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          label: const Icon(Icons.send),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Secondary Info Cards
            Column(
              children: [
                _buildInfoCard(Icons.task_alt, Colors.green, '12', 'Completed'),
                const SizedBox(height: 16),
                _buildInfoCard(
                  Icons.pending_actions,
                  Colors.amber,
                  '04',
                  'Pending Slots',
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  Icons.trending_up,
                  const Color(0xFF061449),
                  '85%',
                  'Conversion',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCandidateItem(
    String name,
    String role,
    String ats,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE5EEFF) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF835500) : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isSelected
                ? const Color(0xFF061449)
                : const Color(0xFF061449).withOpacity(0.1),
            child: Text(
              name.substring(0, 2).toUpperCase(),
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF061449),
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(0xFF45464F),
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(text: '$role · '),
                      TextSpan(
                        text: ats,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? const Color(0xFF835500)
                              : const Color(0xFF45464F),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_circle, color: Color(0xFF835500)),
        ],
      ),
    );
  }

  Widget _buildModeOption(
    IconData icon,
    String title,
    String subtitle,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE5EEFF) : Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xFF061449) : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF061449).withOpacity(0.1)
                  : const Color(0xFFE5EEFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF061449)
                  : const Color(0xFF45464F),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isSelected
                        ? const Color(0xFF061449)
                        : const Color(0xFF45464F),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF45464F),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected ? const Color(0xFF061449) : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    Color iconColor,
    String value,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 32),
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF061449),
                ),
              ),
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF45464F),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
