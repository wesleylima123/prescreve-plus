
enum DrugCategory {
  analgesicos('Analgésicos'),
  aines('AINEs'),
  corticosteroides('Corticosteroides'),
  antibioticos('Antibióticos'),
  antifungicos('Antifúngicos'),
  antivirais('Antivirais'),
  antissepticos('Antissépticos / Colutórios');

  final String label;
  const DrugCategory(this.label);

  static DrugCategory? fromString(String category) {
    for (var c in DrugCategory.values) {
      if (c.label.toLowerCase() == category.toLowerCase()) return c;
    }
    return null;
  }
}

enum PatientCondition {
  gestante('gestante', 'Gestantes'),
  lactante('lactante', 'Lactantes'),
  renal('renal', 'Insuf. Renal'),
  hepatico('hepatico', 'Insuf. Hepática'),
  hipertenso('hipertenso', 'Hipertensos'),
  ulceraGastrite('ulcera_gastrite', 'Úlcera / Gastrite'),
  asmaAlergiaAas('asma_alergia_aas', 'Asma / Alergia AAS');

  final String key;
  final String label;
  const PatientCondition(this.key, this.label);
}

enum RiskLevel {
  safe('safe', 'Seguro'),
  caution('caution', 'Cuidado / Reavaliação'),
  contraindicated('contraindicated', 'Contraindicado');

  final String key;
  final String label;
  const RiskLevel(this.key, this.label);
}

class ConditionRisk {
  final PatientCondition condition;
  final RiskLevel level;
  final String? fdaCategory;
  final String description;

  ConditionRisk({
    required this.condition,
    required this.level,
    this.fdaCategory,
    required this.description,
  });
}

class Presentation {
  final String type;
  final String concentration;
  final List<String> commercialNames;
  final bool isControlled;

  Presentation({
    required this.type,
    required this.concentration,
    required this.commercialNames,
    this.isControlled = false,
  });
}

class LiquidPresentation {
  final String name;
  final double concentrationMgPerMl;
  final int dropsPerMl;

  LiquidPresentation({
    required this.name,
    required this.concentrationMgPerMl,
    this.dropsPerMl = 20,
  });
}

class PediatricDosage {
  final double mgPerKgPerDoseMin;
  final double mgPerKgPerDoseMax;
  final double? maxDosePerDayMg;
  final int intervalHours;
  final String notes;
  final LiquidPresentation? liquidPresentation;
  final String summaryText;

  PediatricDosage({
    required this.mgPerKgPerDoseMin,
    required this.mgPerKgPerDoseMax,
    this.maxDosePerDayMg,
    required this.intervalHours,
    required this.notes,
    this.liquidPresentation,
    required this.summaryText,
  });
}

class RecipeModel {
  final String useType;
  final String itemText;
  final String quantity;
  final String instructions;

  RecipeModel({
    required this.useType,
    required this.itemText,
    required this.quantity,
    required this.instructions,
  });
}

class AdultPosology {
  final String standardDose;
  final String maxDailyDose;
  final String suggestedDuration;
  final RecipeModel recipeModel;

  AdultPosology({
    required this.standardDose,
    required this.maxDailyDose,
    required this.suggestedDuration,
    required this.recipeModel,
  });
}

class RiskInteraction {
  final String drugOrClass;
  final String effect;
  final String severity;

  RiskInteraction({
    required this.drugOrClass,
    required this.effect,
    required this.severity,
  });
}

class Drug {
  final String id;
  final String name;
  final String genericName;
  final DrugCategory category;
  final String? subcategory;
  final String pharmacologicalClass;
  final String mechanismOfAction;
  final List<String> indications;
  final List<Presentation> presentations;
  final AdultPosology adultPosology;
  final PediatricDosage? pediatricPosology;
  final List<String> contraindications;
  final List<String> adverseEffects;
  final List<RiskInteraction> riskInteractions;
  final Map<PatientCondition, ConditionRisk> conditionRisks;
  final List<String> clinicalTips;
  final String prescriptionControl;

  Drug({
    required this.id,
    required this.name,
    required this.genericName,
    required this.category,
    this.subcategory,
    required this.pharmacologicalClass,
    required this.mechanismOfAction,
    required this.indications,
    required this.presentations,
    required this.adultPosology,
    this.pediatricPosology,
    required this.contraindications,
    required this.adverseEffects,
    required this.riskInteractions,
    required this.conditionRisks,
    required this.clinicalTips,
    this.prescriptionControl = 'Livre',
  });
}

class PrescriptionItem {
  final String id;
  final String? drugId;
  final String drugName;
  final String presentation;
  final String quantity;
  final String useType;
  final String instructions;

  PrescriptionItem({
    required this.id,
    this.drugId,
    required this.drugName,
    required this.presentation,
    required this.quantity,
    required this.useType,
    required this.instructions,
  });
}

class PrescriptionHeader {
  final String dentistName;
  final String cro;
  final String clinicAddress;
  final String phone;
  final String patientName;
  final String patientAge;
  final String date;

  PrescriptionHeader({
    required this.dentistName,
    required this.cro,
    required this.clinicAddress,
    required this.phone,
    required this.patientName,
    required this.patientAge,
    required this.date,
  });
}

class ClinicalProtocol {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String description;
  final String firstChoiceDrugId;
  final String firstChoicePosology;
  final String? alternativeChoiceDrugId;
  final String? alternativeChoicePosology;
  final String allergiesOrSpecialNotes;
  final List<String> steps;

  ClinicalProtocol({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.description,
    required this.firstChoiceDrugId,
    required this.firstChoicePosology,
    this.alternativeChoiceDrugId,
    this.alternativeChoicePosology,
    required this.allergiesOrSpecialNotes,
    required this.steps,
  });
}

class LocalAnesthetic {
  final String name;
  final double maxDoseMgPerKg;
  final double maxAbsoluteDoseMg;
  final double mgPerCartridge;
  final String vasoconstrictor;
  final String notes;

  LocalAnesthetic({
    required this.name,
    required this.maxDoseMgPerKg,
    required this.maxAbsoluteDoseMg,
    required this.mgPerCartridge,
    required this.vasoconstrictor,
    this.notes = '',
  });

  int calculateMaxTubetes(double weightKg) {
    final double calculatedMaxMg = weightKg * maxDoseMgPerKg;
    final double allowedMg = calculatedMaxMg < maxAbsoluteDoseMg ? calculatedMaxMg : maxAbsoluteDoseMg;
    return (allowedMg / mgPerCartridge).floor();
  }
}

class MedicalEmergency {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<String> signsAndSymptoms;
  final List<String> conductSteps;
  final List<String> emergencyDrugs;

  MedicalEmergency({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.signsAndSymptoms,
    required this.conductSteps,
    required this.emergencyDrugs,
  });
}
