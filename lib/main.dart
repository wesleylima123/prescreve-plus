import 'package:flutter/material.dart';
import 'models/types.dart';
import 'screens/drugs_screen.dart';
import 'screens/pediatric_calculator_screen.dart';
import 'screens/clinical_protocols_screen.dart';
import 'screens/emergency_guide_screen.dart';
import 'screens/prescription_builder_screen.dart';

void main() {
  runApp(const PrescrevePlusApp());
}

class PrescrevePlusApp extends StatelessWidget {
  const PrescrevePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescreve+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFE2001A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE2001A),
          primary: const Color(0xFFE2001A),
          secondary: const Color(0xFFA6000E),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF9F5),
        fontFamily: 'IBMPlexSans',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'ZillaSlab',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final List<PrescriptionItem> _prescriptionCart = [];

  void _addToCart(PrescriptionItem item) {
    setState(() {
      _prescriptionCart.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${item.drugName}" adicionado ao receituário!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _addMultipleToCart(List<PrescriptionItem> items) {
    setState(() {
      _prescriptionCart.addAll(items);
      _currentIndex = 4;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${items.length} item(ns) adicionado(s) ao receituário!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeFromCart(String itemId) {
    setState(() {
      _prescriptionCart.removeWhere((i) => i.id == itemId);
    });
  }

  void _clearCart() {
    setState(() {
      _prescriptionCart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DrugsScreen(onAddToPrescription: _addToCart),
      PediatricCalculatorScreen(onAddToPrescription: _addToCart),
      ClinicalProtocolsScreen(onApplyProtocol: _addMultipleToCart),
      const EmergencyGuideScreen(),
      PrescriptionBuilderScreen(
        items: _prescriptionCart,
        onItemRemove: _removeFromCart,
        onClearAll: _clearCart,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE2001A),
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Fármacos'),
          const BottomNavigationBarItem(icon: Icon(Icons.child_care), label: 'Pediátrico'),
          const BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Protocolos'),
          const BottomNavigationBarItem(icon: Icon(Icons.warning_amber), label: 'Emergência'),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.receipt_long),
                if (_prescriptionCart.isNotEmpty)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: const Color(0xFFE2001A),
                      child: Text(
                        '${_prescriptionCart.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Receituário',
          ),
        ],
      ),
    );
  }
}
