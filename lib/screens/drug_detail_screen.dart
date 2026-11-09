import 'package:flutter/material.dart';
import '../models/types.dart';

class DrugDetailScreen extends StatefulWidget {
  final Drug drug;
  final void Function(PrescriptionItem) onAddToPrescription;

  const DrugDetailScreen({
    super.key,
    required this.drug,
    required this.onAddToPrescription,
  });

  @override
  State<DrugDetailScreen> createState() => _DrugDetailScreenState();
}

class _DrugDetailScreenState extends State<DrugDetailScreen> {
  late Presentation _selectedPresentation;

  @override
  void initState() {
    super.initState();
    _selectedPresentation = widget.drug.presentations.first;
  }

  @override
  Widget build(BuildContext context) {
    final drug = widget.drug;

    return Scaffold(
      appBar: AppBar(
        title: Text(drug.name),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            drug.name,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFE2001A)),
                          ),
                        ),
                        Chip(
                          label: Text(
                            drug.category.label,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          backgroundColor: const Color(0xFFE2001A),
                        ),
                      ],
                    ),
                    Text(
                      drug.genericName,
                      style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text('Classe Farmacológica: ${drug.pharmacologicalClass}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Mecanismo de Ação: ${drug.mechanismOfAction}', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selecione a Apresentação Comercial:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFE2001A))),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<Presentation>(
                      initialValue: _selectedPresentation,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: drug.presentations.map((p) {
                        return DropdownMenuItem<Presentation>(
                          value: p,
                          child: Text(
                            '${p.type} (${p.concentration}) — ${p.commercialNames.join(', ')}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedPresentation = val);
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
                    const Text('Posologia Adulto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFA6000E))),
                    const SizedBox(height: 8),
                    Text('Dose Padrão: ${drug.adultPosology.standardDose}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text('Dose Máxima Diária: ${drug.adultPosology.maxDailyDose}', style: const TextStyle(fontSize: 12)),
                    Text('Duração Sugerida: ${drug.adultPosology.suggestedDuration}', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE2001A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('ADICIONAR AO RECEITUÁRIO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                onPressed: () {
                  final item = PrescriptionItem(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    drugId: drug.id,
                    drugName: '${drug.name} (${_selectedPresentation.concentration})',
                    presentation: _selectedPresentation.type,
                    quantity: drug.adultPosology.recipeModel.quantity,
                    useType: drug.adultPosology.recipeModel.useType,
                    instructions: drug.adultPosology.recipeModel.instructions,
                  );
                  widget.onAddToPrescription(item);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
