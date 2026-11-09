import 'package:flutter/material.dart';
import '../data/drugs_data.dart';
import '../models/types.dart';
import 'drug_detail_screen.dart';

class DrugsScreen extends StatefulWidget {
  final void Function(PrescriptionItem) onAddToPrescription;

  const DrugsScreen({
    super.key,
    required this.onAddToPrescription,
  });

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  String _searchTerm = '';
  DrugCategory? _selectedCategory;
  final Set<PatientCondition> _selectedConditions = {};
  bool _showOnlySafe = false;

  @override
  Widget build(BuildContext context) {
    final filteredDrugs = drugsDatabase.where((drug) {
      if (_selectedCategory != null && drug.category != _selectedCategory) {
        return false;
      }

      if (_searchTerm.trim().isNotEmpty) {
        final query = _searchTerm.toLowerCase().trim();
        final nameMatch = drug.name.toLowerCase().contains(query);
        final genericMatch = drug.genericName.toLowerCase().contains(query);
        final classMatch = drug.pharmacologicalClass.toLowerCase().contains(query);
        final categoryMatch = drug.category.label.toLowerCase().contains(query);
        final indicationMatch = drug.indications.any((i) => i.toLowerCase().contains(query));
        final commercialMatch = drug.presentations.any((p) => p.commercialNames.any((c) => c.toLowerCase().contains(query)));

        if (!nameMatch && !genericMatch && !classMatch && !categoryMatch && !indicationMatch && !commercialMatch) {
          return false;
        }
      }

      if (_showOnlySafe && _selectedConditions.isNotEmpty) {
        final isContraindicated = _selectedConditions.any((cond) {
          final risk = drug.conditionRisks[cond];
          return risk?.level == RiskLevel.contraindicated;
        });
        if (isContraindicated) return false;
      }

      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia de Fármacos'),
        backgroundColor: const Color(0xFFE2001A),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por nome, princípio ativo, indicação ou marca...',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFFE2001A)),
                    suffixIcon: _searchTerm.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => setState(() => _searchTerm = ''),
                          )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFFF4F0ED),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  onChanged: (val) => setState(() => _searchTerm = val),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('Todos'),
                        selected: _selectedCategory == null,
                        selectedColor: const Color(0xFFE2001A),
                        labelStyle: TextStyle(
                          color: _selectedCategory == null ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (_) => setState(() => _selectedCategory = null),
                      ),
                      const SizedBox(width: 6),
                      ...DrugCategory.values.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: FilterChip(
                            label: Text(cat.label),
                            selected: isSelected,
                            selectedColor: const Color(0xFFE2001A),
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            onSelected: (_) => setState(() => _selectedCategory = isSelected ? null : cat),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...PatientCondition.values.map((cond) {
                        final isSelected = _selectedConditions.contains(cond);
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: FilterChip(
                            avatar: Icon(
                              isSelected ? Icons.check_circle : Icons.warning_amber_rounded,
                              size: 16,
                              color: isSelected ? Colors.white : Colors.orange.shade800,
                            ),
                            label: Text(cond.label, style: const TextStyle(fontSize: 11)),
                            selected: isSelected,
                            selectedColor: const Color(0xFFA6000E),
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            onSelected: (val) {
                              setState(() {
                                if (val) {
                                  _selectedConditions.add(cond);
                                } else {
                                  _selectedConditions.remove(cond);
                                }
                              });
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                if (_selectedConditions.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Checkbox(
                        value: _showOnlySafe,
                        activeColor: const Color(0xFFE2001A),
                        onChanged: (val) => setState(() => _showOnlySafe = val ?? false),
                      ),
                      const Expanded(
                        child: Text(
                          'Ocultar medicamentos contraindicados para a seleção',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFA6000E)),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: filteredDrugs.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                        'Nenhum medicamento encontrado para os filtros selecionados.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredDrugs.length,
                    itemBuilder: (context, index) {
                      final drug = filteredDrugs[index];

                      RiskLevel highestRisk = RiskLevel.safe;
                      if (_selectedConditions.isNotEmpty) {
                        final risks = _selectedConditions.map((c) => drug.conditionRisks[c]?.level).whereType<RiskLevel>().toList();
                        if (risks.contains(RiskLevel.contraindicated)) {
                          highestRisk = RiskLevel.contraindicated;
                        } else if (risks.contains(RiskLevel.caution)) {
                          highestRisk = RiskLevel.caution;
                        }
                      }

                      Color badgeColor = Colors.green.shade700;
                      if (highestRisk == RiskLevel.contraindicated) badgeColor = const Color(0xFFE2001A);
                      if (highestRisk == RiskLevel.caution) badgeColor = Colors.orange.shade800;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DrugDetailScreen(
                                  drug: drug,
                                  onAddToPrescription: widget.onAddToPrescription,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            drug.name,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1A1614)),
                                          ),
                                          Text(
                                            drug.genericName,
                                            style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Chip(
                                      label: Text(
                                        drug.category.label,
                                        style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      backgroundColor: const Color(0xFFE2001A),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Posologia: ${drug.adultPosology.standardDose}',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (_selectedConditions.isNotEmpty)
                                      Flexible(
                                        child: Row(
                                        children: [
                                          Icon(
                                            highestRisk == RiskLevel.contraindicated
                                                ? Icons.block
                                                : (highestRisk == RiskLevel.caution ? Icons.warning : Icons.check_circle),
                                            size: 16,
                                            color: badgeColor,
                                          ),
                                          const SizedBox(width: 4),
                                          Flexible(
                                            child: Text(
                                              highestRisk == RiskLevel.contraindicated
                                                  ? 'Contraindicado'
                                                  : (highestRisk == RiskLevel.caution ? 'Reavaliação / Cautela' : 'Seguro'),
                                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: badgeColor),
                                            ),
                                          ),
                                        ],
                                        ),
                                      )
                                    else
                                      Flexible(
                                        child: Text(
                                          '${drug.presentations.length} apresentações disponíveis',
                                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                                        ),
                                      ),
                                    const SizedBox(width: 8),

                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFFFF0F0),
                                        foregroundColor: const Color(0xFFE2001A),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      icon: const Icon(Icons.add_shopping_cart, size: 16),
                                      label: const Text('Receita', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                      onPressed: () {
                                        final item = PrescriptionItem(
                                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                                          drugId: drug.id,
                                          drugName: '${drug.name} (${drug.presentations.first.concentration})',
                                          presentation: drug.presentations.first.type,
                                          quantity: drug.adultPosology.recipeModel.quantity,
                                          useType: drug.adultPosology.recipeModel.useType,
                                          instructions: drug.adultPosology.recipeModel.instructions,
                                        );
                                        widget.onAddToPrescription(item);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
