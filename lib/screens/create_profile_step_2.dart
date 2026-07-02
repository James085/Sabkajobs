import 'package:flutter/material.dart';
import 'payment_gateway_page.dart';

class CreateProfileStep2 extends StatefulWidget {
  const CreateProfileStep2({super.key});

  @override
  State<CreateProfileStep2> createState() => _CreateProfileStep2State();
}

class _CreateProfileStep2State extends State<CreateProfileStep2> {
  int _selectedPlanIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2B58),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 16, color: Color(0xFF64748B)),
                  label: const Text('Back', style: TextStyle(color: Color(0xFF64748B))),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create Your Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2B58),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Step 2 of 2 — Choose Plan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 16),
                // Progress bar
                Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFC6933A),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                const Text(
                  'Select your preferred training fee plan:',
                  style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 16),
                
                // Plans
                _buildPlanOption(
                  context,
                  index: 0,
                  title: 'Join Now — ₹299',
                  description: 'One-time registration fee. Get immediate access to all training content and job matching.',
                  titleColor: const Color(0xFFC6933A),
                  icon: Icons.bolt,
                  iconColor: Colors.orange,
                  isSelected: _selectedPlanIndex == 0,
                ),
                const SizedBox(height: 16),
                _buildPlanOption(
                  context,
                  index: 1,
                  title: 'Pay After Placement — ₹10,000',
                  description: 'Zero cost to join. Pay ₹10,000 only when you receive a confirmed job offer.',
                  titleColor: const Color(0xFF3E52A0),
                  icon: Icons.track_changes,
                  iconColor: Colors.red,
                  isSelected: _selectedPlanIndex == 1,
                ),
                const SizedBox(height: 16),
                _buildPlanOption(
                  context,
                  index: 2,
                  title: 'EMI Plan — ₹5,000 × 3',
                  description: 'Spread the fee over 3 months. ₹5,000/month for easy payment flexibility.',
                  titleColor: const Color(0xFF7C3AED),
                  icon: Icons.calendar_today,
                  iconColor: Colors.indigo,
                  isSelected: _selectedPlanIndex == 2,
                ),
                
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6933A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentGatewayPage()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Proceed to Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(BuildContext context, {required int index, required String title, required String description, required Color titleColor, required IconData icon, required Color iconColor, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlanIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade50.withOpacity(0.3) : Colors.white,
          border: Border.all(color: isSelected ? const Color(0xFFC6933A) : Colors.grey.shade200, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: titleColor)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.5)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: isSelected ? const Color(0xFFC6933A) : Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}
