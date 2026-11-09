import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/types.dart';

class PdfService {
  static Future<Uint8List> generatePrescriptionPdf({
    required PrescriptionHeader header,
    required List<PrescriptionItem> items,
    bool isControlEspecial = false,
  }) async {
    final pdf = pw.Document();

    final primaryRed = PdfColor.fromHex('#E2001A');
    final darkRed = PdfColor.fromHex('#A6000E');
    final inkBlack = PdfColor.fromHex('#1A1614');
    final grayText = PdfColor.fromHex('#666666');
    final lightBg = PdfColor.fromHex('#FAF9F5');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                height: 8,
                width: double.infinity,
                color: primaryRed,
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                        width: 36,
                        height: 36,
                        decoration: pw.BoxDecoration(
                          color: darkRed,
                          borderRadius: pw.BorderRadius.circular(6),
                        ),
                        child: pw.Center(
                          child: pw.Text(
                            'Rx',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 12),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            header.dentistName.isNotEmpty ? header.dentistName : 'Dr. Cirurgião-Dentista',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              color: inkBlack,
                            ),
                          ),
                          pw.Text(
                            header.cro.isNotEmpty ? header.cro : 'CRO-SP 00000',
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              color: primaryRed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      if (header.clinicAddress.isNotEmpty)
                        pw.Text(
                          header.clinicAddress,
                          style: pw.TextStyle(fontSize: 9, color: grayText),
                        ),
                      if (header.phone.isNotEmpty)
                        pw.Text(
                          'Tel: ${header.phone}',
                          style: pw.TextStyle(fontSize: 9, color: grayText),
                        ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 12),
              pw.Divider(color: primaryRed, thickness: 1),
              pw.SizedBox(height: 8),
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.symmetric(vertical: 6),
                decoration: pw.BoxDecoration(
                  color: isControlEspecial ? PdfColor.fromHex('#FFF0F0') : lightBg,
                  borderRadius: pw.BorderRadius.circular(4),
                  border: pw.Border.all(
                    color: isControlEspecial ? primaryRed : PdfColor.fromHex('#E0E0E0'),
                  ),
                ),
                child: pw.Center(
                  child: pw.Text(
                    isControlEspecial
                        ? 'RECEITUÁRIO DE CONTROLE ESPECIAL (2 VIAS)'
                        : 'RECEITUÁRIO ODONTOLÓGICO',
                    style: pw.TextStyle(
                      fontSize: 11,
                      fontWeight: pw.FontWeight.bold,
                      color: darkRed,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColor.fromHex('#DDDDDD')),
                  borderRadius: pw.BorderRadius.circular(4),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'PACIENTE: ',
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              color: grayText,
                            ),
                          ),
                          pw.TextSpan(
                            text: header.patientName.isNotEmpty ? header.patientName : 'Nome do Paciente',
                            style: pw.TextStyle(
                              fontSize: 11,
                              fontWeight: pw.FontWeight.bold,
                              color: inkBlack,
                            ),
                          ),
                          if (header.patientAge.isNotEmpty)
                            pw.TextSpan(
                              text: ' (${header.patientAge})',
                              style: const pw.TextStyle(fontSize: 10, color: PdfColors.black),
                            ),
                        ],
                      ),
                    ),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: 'DATA: ',
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              color: grayText,
                            ),
                          ),
                          pw.TextSpan(
                            text: header.date.isNotEmpty ? header.date : DateTime.now().toString().substring(0, 10),
                            style: pw.TextStyle(fontSize: 10, color: inkBlack),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: lightBg,
                child: pw.Text(
                  'MEDICAMENTOS & INSTRUÇÕES DE USO',
                  style: pw.TextStyle(
                    fontSize: 9,
                    fontWeight: pw.FontWeight.bold,
                    color: darkRed,
                  ),
                ),
              ),
              pw.SizedBox(height: 10),
              ...items.asMap().entries.map((entry) {
                final idx = entry.key + 1;
                final item = entry.value;

                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 12),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            '$idx) ${item.drugName}',
                            style: pw.TextStyle(
                              fontSize: 11,
                              fontWeight: pw.FontWeight.bold,
                              color: inkBlack,
                            ),
                          ),
                          pw.Text(
                            '${item.quantity} ${item.presentation.isNotEmpty ? "(${item.presentation})" : ""}',
                            style: pw.TextStyle(
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                              color: darkRed,
                            ),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 3),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 14),
                        child: pw.Text(
                          item.instructions,
                          style: const pw.TextStyle(fontSize: 9.5, color: PdfColors.grey900),
                        ),
                      ),
                      pw.SizedBox(height: 6),
                      pw.Divider(color: PdfColor.fromHex('#EEEEEE'), thickness: 0.5),
                    ],
                  ),
                );
              }),
              pw.Spacer(),
              pw.Center(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(width: 200, height: 1, color: inkBlack),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      header.dentistName.isNotEmpty ? header.dentistName : 'Dr. Cirurgião-Dentista',
                      style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: inkBlack),
                    ),
                    pw.Text(
                      header.cro.isNotEmpty ? header.cro : 'CRO-SP 00000',
                      style: pw.TextStyle(fontSize: 8.5, color: grayText),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Divider(color: PdfColor.fromHex('#E0E0E0'), thickness: 0.5),
              pw.SizedBox(height: 4),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text('Prescreve+ — Aplicativo de Prescrição Medicamentosa Odontológica', style: pw.TextStyle(fontSize: 7, color: grayText)),
                  pw.Text('Emissão em ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}', style: pw.TextStyle(fontSize: 7, color: grayText)),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static Future<void> shareOrPrintPdf({
    required PrescriptionHeader header,
    required List<PrescriptionItem> items,
    bool isControlEspecial = false,
  }) async {
    final pdfBytes = await generatePrescriptionPdf(
      header: header,
      items: items,
      isControlEspecial: isControlEspecial,
    );

    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: 'receita_${header.patientName.replaceAll(' ', '_')}.pdf',
    );
  }

  static Future<void> previewOrPrintPdf({
    required PrescriptionHeader header,
    required List<PrescriptionItem> items,
    bool isControlEspecial = false,
  }) async {
    final pdfBytes = await generatePrescriptionPdf(
      header: header,
      items: items,
      isControlEspecial: isControlEspecial,
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
      name: 'receita_${header.patientName.replaceAll(' ', '_')}.pdf',
    );
  }
}
