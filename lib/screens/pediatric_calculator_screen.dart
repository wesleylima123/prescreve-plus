import 'package:flutter/material.dart';
import '../data/drugs_data.dart';
import '../models/types.dart';

class PediatricCalculatorScreen extends StatefulWidget {
  final void Function(PrescriptionItem) onAddToPrescription;

  const PediatricCalculatorScreen({
    super.key,
    required this.onAddToPrescription,
  });

  @override
  State<PediatricCalculatorScreen> createState() => _PediatricCalculatorScreenState();
}

class _PediatricCalculatorScreenState extends State<PediatricCalculatorScreen> {
  late List<Drug> _pediatricDrugs;
  late String _selectedDrugId;
  double _weightKg = 15.0;

  @override
  void initState() {
    super.initState();
    _pediatricDrugs = drugsDatabase.where((d) => d.pediatricPosology != null).toList();
    _selectedDrugId = _pediatricDrugs.isNotEmpty ? _pediatricDrugs.first.id : 'amoxicilina';
  }

  @override
  Widget build(BuildContext context) {
    final drug = _pediatricDrugs.firstWhere(
      (d) => d.id == _selectedDrugId,
      orElse: () => _pediatricDrugs.first,
    );

    final pPos = drug.pediatricPosology!;
    final liquid = pPos.liquidPresentation ??
        LiquidPresentation(
          name: 'Gotas 500 mg/mL',
          concentrationMgPerMl: 500.0,
          dropsPerMl: 20,
        );

    final minMgDose = (pPos.mgPerKgPerDoseMin * _weightKg * 10).round() / 10;
    final maxMgDose = (pPos.mgPerKgPerDoseMax * _weightKg * 10).round() / 10;

    final concentrationMgPerMl = liquid.concentrationMgPerMl;
    final dropsPerMl = liquid.dropsPerMl;

    final minMlDose = ((minMgDose / concentrationMgPerMl) * 10).round() / 10;
    final maxMlDose = ((maxMgDose / concentrationMgPerMl) * 10).round() / 10;

    final minDropsDose = (minMlDose * dropsPerMl).round();
    final maxDropsDose = (maxMlDose * dropsPerMl).round();

    final isGotas = liquid.name.toLowerCase().contains('gotas');

    String doseText = '';
    if (isGotas) {
      if (minDropsDose == maxDropsDose) {
        doseText = '$minDropsDose gotas por dose ($minMlDose mL)';
      } else {
        doseText = '$minDropsDose a $maxDropsDose gotas por dose ($minMlDose a $maxMlDose mL)';
      }
    } else {
      if (minMlDose == maxMlDose) {
        doseText = '$minMlDose mL por dose';
      } else {
        doseText = '$minMlDose a $maxMlDose mL por dose';
      }
    }

    final intervalText = 'a cada ${pPos.intervalHours} horas';
    final generatedItemText = '${drug.name} (${liquid.name}) ----- 1 frasco';
    final generatedInstructions = 'Dar $doseText por via oral $intervalText.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Pediátrica'),
        backgroundColor: const Color(0xFFE2001A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1) Selecione o Medicamento Pediátrico:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFE2001A))),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedDrugId,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: _pediatricDrugs.map((d) {
                        return DropdownMenuItem(
                          value: d.id,
                          child: Text('${d.name} (${d.category.label})', style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedDrugId = val);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              color: const Color(0xFFFFF0F0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text('2) Peso Corporal da Criança (kg):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFA6000E))),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2001A))),
                          child: Text('${_weightKg.toStringAsFixed(1)} kg', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Color(0xFFE2001A))),
                        ),
                      ],
                    ),
                    Slider(
                      value: _weightKg,
                      min: 3.0,
                      max: 50.0,
                      divisions: 94,
                      activeColor: const Color(0xFFE2001A),
                      label: '${_weightKg.toStringAsFixed(1)} kg',
                      onChanged: (val) => setState(() => _weightKg = val),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Resultado do Cálculo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFE2001A))),
                    const SizedBox(height: 12),
                    Text('Dose Recomendada: $doseText', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFA6000E))),
                    Text('Instruções: $generatedInstructions', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE2001A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('INSERIR NO RECEITUÁRIO', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {
                  final newItem = PrescriptionItem(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    drugId: drug.id,
                    drugName: '${drug.name} (Pediátrico - ${_weightKg.toStringAsFixed(1)} kg)',
                    presentation: liquid.name,
                    quantity: '1 frasco',
                    useType: 'Uso Interno',
                    instructions: generatedInstructions,
                  );
                  widget.onAddToPrescription(newItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
