import 'package:flutter_test/flutter_test.dart';
import 'package:prescreve_plus/main.dart';

void main() {
  testWidgets('PrescrevePlusApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PrescrevePlusApp());
    expect(find.text('Guia de Fármacos'), findsOneWidget);
  });
}
