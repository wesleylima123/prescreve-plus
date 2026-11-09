import 'package:flutter/material.dart';
import '../models/types.dart';
import '../services/pdf_service.dart';

class PrescriptionBuilderScreen extends StatefulWidget {
  final List<PrescriptionItem> items;
  final void Function(String itemId) onItemRemove;
  final VoidCallback onClearAll;

  const PrescriptionBuilderScreen({
    super.key,
    required this.items,
    required this.onItemRemove,
    required this.onClearAll,
  });

  @override
  State<PrescriptionBuilderScreen> createState() => _PrescriptionBuilderScreenState();
}

class _PrescriptionBuilderScreenState extends State<PrescriptionBuilderScreen> {
  final _formKey = GlobalKey<FormState>();

  final _dentistNameController = TextEditingController(text: 'Dr. Cirurgião-Dentista');
  final _croController = TextEditingController(text: 'CRO-SP 12345');
  final _clinicAddressController = TextEditingController(text: 'Av. Paulista, 1000 - São Paulo, SP');
  final _phoneController = TextEditingController(text: '(11) 99999-8888');
  final _patientNameController = TextEditingController();
  final _patientAgeController = TextEditingController();

  bool _isControlEspecial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Receituário'),
        backgroundColor: const Color(0xFFE2001A),
        foregroundColor: Colors.white,
      ),
      body: widget.items.isEmpty
          ? const Center(child: Text('Sua receita está vazia! Adicione medicamentos.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _dentistNameController,
                      decoration: const InputDecoration(labelText: 'Nome do Dentista', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _patientNameController,
                      decoration: const InputDecoration(labelText: 'Nome do Paciente *', border: OutlineInputBorder()),
                      validator: (v) => v == null || v.isEmpty ? 'Informe o nome do paciente' : null,
                    ),
                    const SizedBox(height: 16),
                    ...widget.items.map((item) => Card(
                          child: ListTile(
                            title: Text(item.drugName),
                            subtitle: Text(item.instructions),
                            trailing: IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => widget.onItemRemove(item.id),
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE2001A),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      icon: const Icon(Icons.print),
                      label: const Text('GERAR PDF DA RECEITA'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final header = PrescriptionHeader(
                            dentistName: _dentistNameController.text,
                            cro: _croController.text,
                            clinicAddress: _clinicAddressController.text,
                            phone: _phoneController.text,
                            patientName: _patientNameController.text,
                            patientAge: _patientAgeController.text,
                            date: DateTime.now().toString().substring(0, 10),
                          );
                          await PdfService.previewOrPrintPdf(
                            header: header,
                            items: widget.items,
                            isControlEspecial: _isControlEspecial,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
