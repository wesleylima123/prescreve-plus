import 'package:flutter/material.dart';
import '../data/protocols_data.dart';
import '../models/types.dart';

class ClinicalProtocolsScreen extends StatefulWidget {
  final void Function(List<PrescriptionItem>) onApplyProtocol;

  const ClinicalProtocolsScreen({
    super.key,
    required this.onApplyProtocol,
  });

  @override
  State<ClinicalProtocolsScreen> createState() => _ClinicalProtocolsScreenState();
}

class _ClinicalProtocolsScreenState extends State<ClinicalProtocolsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protocolos Clínicos'),
        backgroundColor: const Color(0xFFE2001A),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clinicalProtocolsDatabase.length,
        itemBuilder: (context, index) {
          final protocol = clinicalProtocolsDatabase[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              title: Text(protocol.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFE2001A))),
              subtitle: Text(protocol.subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFFF0F0),
                child: Icon(Icons.medical_services, color: Color(0xFFE2001A)),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(protocol.description, style: const TextStyle(fontSize: 12, height: 1.4)),
                      const SizedBox(height: 12),
                      const Text('Conduta 1ª Escolha:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFA6000E))),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: const Color(0xFFFFF0F0), borderRadius: BorderRadius.circular(8)),
                        child: Text(protocol.firstChoicePosology, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFE2001A),
                            side: const BorderSide(color: Color(0xFFE2001A)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          icon: const Icon(Icons.add_task),
                          label: const Text('APLICAR AO RECEITUÁRIO'),
                          onPressed: () {
                            final item = PrescriptionItem(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              drugName: protocol.title,
                              presentation: 'Conforme Protocolo',
                              quantity: '1 tratamento',
                              useType: 'Uso Interno',
                              instructions: protocol.firstChoicePosology,
                            );
                            widget.onApplyProtocol([item]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
