import 'package:flutter/material.dart';
import '../data/emergency_data.dart';

class EmergencyGuideScreen extends StatefulWidget {
  const EmergencyGuideScreen({super.key});

  @override
  State<EmergencyGuideScreen> createState() => _EmergencyGuideScreenState();
}

class _EmergencyGuideScreenState extends State<EmergencyGuideScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _patientWeightKg = 70.0;
  final TextEditingController _weightController = TextEditingController(text: '70');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergências & Anestésicos'),
        backgroundColor: const Color(0xFFE2001A),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.vaccines), text: 'Doses Anestésicas'),
            Tab(icon: Icon(Icons.warning_amber), text: 'Emergências Médicas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAnestheticsTab(),
          _buildMedicalEmergenciesTab(),
        ],
      ),
    );
  }

  Widget _buildAnestheticsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: const Color(0xFFFFF0F0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Calculadora de Limite de Tubetes (1,8 mL):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFA6000E))),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 95,
                    child: TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: 'kg',
                        suffixStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE2001A)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onChanged: (val) {
                        final parsed = double.tryParse(val);
                        if (parsed != null && parsed > 0) {
                          setState(() => _patientWeightKg = parsed);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...anestheticList.map((anesthetic) {
            final tubetes = anesthetic.calculateMaxTubetes(_patientWeightKg);
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(anesthetic.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('Vasoconstritor: ${anesthetic.vasoconstrictor}', style: const TextStyle(fontSize: 11, color: Color(0xFFA6000E))),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('$tubetes tubetes', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      backgroundColor: const Color(0xFFE2001A),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMedicalEmergenciesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: emergencyList.length,
      itemBuilder: (context, index) {
        final emergency = emergencyList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ExpansionTile(
            title: Text(emergency.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE2001A))),
            subtitle: Text(emergency.category, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(emergency.description, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    const Text('Conduta:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ...emergency.conductSteps.map((step) => Text('• $step', style: const TextStyle(fontSize: 11))),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
