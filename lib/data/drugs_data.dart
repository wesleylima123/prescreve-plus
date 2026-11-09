import '../models/types.dart';

final List<Drug> drugsDatabase = [
  // 1. DIPIRONA SÓDICA
  Drug(
    id: 'dipirona',
    name: 'Dipirona Sódica',
    genericName: 'Dipirona Sódica (Metamizol)',
    category: DrugCategory.analgesicos,
    pharmacologicalClass: 'Analgésico e Antipirético',
    mechanismOfAction: 'Inibição da síntese de prostaglandinas no SNC e periférico, ação antinociceptiva central.',
    indications: ['Dor leve a moderada', 'Odontalgia pós-operatória', 'Febre'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '500 mg', commercialNames: ['Novalgina', 'Anador', 'Dipimed']),
      Presentation(type: 'Comprimido', concentration: '1 g', commercialNames: ['Novalgina 1g', 'Magnopyrol']),
      Presentation(type: 'Gotas', concentration: '500 mg/mL', commercialNames: ['Novalgina Gotas', 'Genérico']),
      Presentation(type: 'Solução Oral', concentration: '50 mg/mL', commercialNames: ['Novalgina Infantil']),
    ],
    adultPosology: AdultPosology(
      standardDose: '500 mg a 1000 mg (1g) a cada 6 horas por via oral.',
      maxDailyDose: '4000 mg (4 g) / dia',
      suggestedDuration: '3 a 5 dias ou enquanto durar a dor',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Dipirona Sódica 500 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 1 comprimido por via oral a cada 6 horas em caso de dor.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 10.0,
      mgPerKgPerDoseMax: 15.0,
      maxDosePerDayMg: 2000,
      intervalHours: 6,
      notes: 'Gotas 500 mg/mL: 1 gota por kg de peso corporal por dose (máx 35 a 40 gotas/dose).',
      liquidPresentation: LiquidPresentation(
        name: 'Gotas 500 mg/mL (20 gotas/mL)',
        concentrationMgPerMl: 500.0,
        dropsPerMl: 20,
      ),
      summaryText: '10 a 15 mg/kg/dose a cada 6 horas. Gotas (500mg/mL): 1 gota por kg de peso corporal.',
    ),
    contraindications: [
      'Alergia ou hipersensibilidade a pirazolonas',
      'Discrasias sanguíneas ou agranulocitose prévia',
      'Deficiência de G6PD',
      'Porfiria hepática aguda'
    ],
    adverseEffects: [
      'Reações de hipersensibilidade cutânea',
      'Hipotensão arterial (em infusão rápida)',
      'Agranulocitose (raríssima, <1:1.000.000)'
    ],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Ciclosporina', effect: 'Redução da concentração plasmática da ciclosporina', severity: 'moderada'),
      RiskInteraction(drugOrClass: 'Álcool', effect: 'Potencialização dos efeitos do álcool', severity: 'leve'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.caution,
        fdaCategory: 'C',
        description: 'Usar com cautela no 1º e 2º trimestres. Contraindicada no 3º trimestre (risco de fechamento do ducto arterioso).',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.caution,
        description: 'Excretada no leite materno. Evitar amamentar nas 48h após a ingestão de doses altas.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.caution,
        description: 'Ajustar dose ou estender o intervalo em insuficiência renal grave (ClCr < 30 mL/min).',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Evitar doses altas repetidas em insuficiência hepática grave.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro em hipertensos. Não altera a pressão arterial via oral.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Excelente alternativa a AINEs para pacientes com gastrite ou úlceras peptídicas.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.caution,
        description: 'Pode ocorrer broncoespasmo cruzado em asmáticos sensíveis ao AAS.',
      ),
    },
    clinicalTips: [
      'Primeira escolha para dor pós-operatória em pacientes com histórico de gastrite ou úlcera.',
      'Dose de 1g tem eficácia analgésica comparável ao Ibuprofeno 400mg em dor de extração de siso.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 2. IBUPROFENO
  Drug(
    id: 'ibuprofeno',
    name: 'Ibuprofeno',
    genericName: 'Ibuprofeno',
    category: DrugCategory.aines,
    pharmacologicalClass: 'Anti-inflamatório Não Esteroidal (AINE)',
    mechanismOfAction: 'Inibição não seletiva das enzimas COX-1 e COX-2, reduzindo a síntese de prostaglandinas inflamatórias.',
    indications: ['Dor moderada a intensa', 'Inflamação cirúrgica / Edema', 'Trismo pós-exodontia'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '400 mg', commercialNames: ['Advil', 'Alivium', 'Ibuflex']),
      Presentation(type: 'Comprimido', concentration: '600 mg', commercialNames: ['Alivium 600', 'Ibuprofeno']),
      Presentation(type: 'Gotas', concentration: '50 mg/mL', commercialNames: ['Alivium Gotas']),
      Presentation(type: 'Gotas', concentration: '100 mg/mL', commercialNames: ['Alivium 100mg/mL']),
    ],
    adultPosology: AdultPosology(
      standardDose: '400 mg a 600 mg a cada 6 ou 8 horas por via oral após as refeições.',
      maxDailyDose: '2400 mg / dia',
      suggestedDuration: '3 dias (máximo 5 dias)',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Ibuprofeno 600 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 1 comprimido por via oral a cada 8 horas, após as refeições, por 3 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 5.0,
      mgPerKgPerDoseMax: 10.0,
      maxDosePerDayMg: 1200,
      intervalHours: 8,
      notes: 'Gotas 50 mg/mL: 1 a 2 gotas por kg de peso corporal por dose a cada 8 horas.',
      liquidPresentation: LiquidPresentation(
        name: 'Gotas 50 mg/mL (1 mL = 20 gotas)',
        concentrationMgPerMl: 50.0,
        dropsPerMl: 20,
      ),
      summaryText: '5 a 10 mg/kg/dose de 8 em 8 horas. Gotas (50mg/mL): 1 a 2 gotas por kg de peso.',
    ),
    contraindications: [
      'Úlcera péptica ativa ou histórico de sangramento gastrointestinal',
      'Asma induzida por AAS/AINEs',
      'Insuficiência renal ou hepática grave',
      'Terceiro trimestre de gestação'
    ],
    adverseEffects: ['Epigastralgia, pirose, náuseas', 'Retenção hídrica e elevação da PA', 'Inibição da agregação plaquetária'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Anti-hipertensivos (IECA/BRA)', effect: 'Atenuação do efeito anti-hipertensivo e risco renal', severity: 'moderada'),
      RiskInteraction(drugOrClass: 'Warfarina / Anticoagulantes', effect: 'Aumento significativo do risco de sangramento', severity: 'alta'),
      RiskInteraction(drugOrClass: 'AAS (Aspirina)', effect: 'Ibuprofeno diminui a cardioproteção do AAS', severity: 'moderada'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.contraindicated,
        fdaCategory: 'D',
        description: 'CONTRAINDICADO no 3º trimestre (fechamento precoce do ducto arterioso e atonia uterina). Usar com cautela extrema no 1º/2º.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Compatível com a amamentação (excreção insignificante no leite materno). AINE de escolha em lactantes.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.contraindicated,
        description: 'Contraindicado em insuficiência renal moderada a grave por inibição das prostaglandinas vasodilatadoras renais.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Usar com cautela em hepatopatas. Risco de retenção hídrica.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.caution,
        description: 'Pode elevar a pressão arterial se usado por mais de 5 dias consecutivos.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.contraindicated,
        description: 'CONTRAINDICADO em pacientes com úlcera péptica ativa ou gastrite erosiva severa.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.contraindicated,
        description: 'CONTRAINDICADO em indivíduos com tríade da asma induzida por AAS/AINEs.',
      ),
    },
    clinicalTips: [
      'AINE de primeira linha em Odontologia para controle do edema e dor cirúrgica.',
      'Tomar sempre junto com alimentos ou leite para minimizar irritação gástrica.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 3. PARACETAMOL
  Drug(
    id: 'paracetamol',
    name: 'Paracetamol',
    genericName: 'Paracetamol (Acetaminofeno)',
    category: DrugCategory.analgesicos,
    pharmacologicalClass: 'Analgésico e Antipirético Central',
    mechanismOfAction: 'Inibição da síntese de prostaglandinas no SNC, elevação do limiar de dor.',
    indications: ['Dor leve a moderada', 'Febre', 'Alternativa para alérgicos a Dipirona e AINEs'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '500 mg', commercialNames: ['Tylenol', 'Paracetamol']),
      Presentation(type: 'Comprimido', concentration: '750 mg', commercialNames: ['Tylenol 750', 'Cefaliv']),
      Presentation(type: 'Gotas', concentration: '200 mg/mL', commercialNames: ['Tylenol Bebê / Gotas']),
    ],
    adultPosology: AdultPosology(
      standardDose: '500 mg a 750 mg a cada 6 horas por via oral.',
      maxDailyDose: '4000 mg (4 g) / dia (Em etilistas ou hepatopatas: máx 2g/dia)',
      suggestedDuration: '3 a 5 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Paracetamol 750 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 1 comprimido por via oral a cada 6 horas em caso de dor.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 10.0,
      mgPerKgPerDoseMax: 15.0,
      maxDosePerDayMg: 2000,
      intervalHours: 6,
      notes: 'Gotas 200 mg/mL: 1 gota por kg de peso corporal por dose a cada 6 horas (máx 35 gotas).',
      liquidPresentation: LiquidPresentation(
        name: 'Gotas 200 mg/mL (1 mL = 20 gotas)',
        concentrationMgPerMl: 200.0,
        dropsPerMl: 20,
      ),
      summaryText: '10 a 15 mg/kg/dose a cada 6h. Gotas (200mg/mL): 1 gota/kg.',
    ),
    contraindications: ['Insuficiência hepática grave', 'Hipersensibilidade conhecida ao Paracetamol'],
    adverseEffects: ['Hepatotoxicidade por superdosagem (>4g/dia)', 'Reações cutâneas alérgicas raras'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Álcool crônico', effect: 'Potencializa o risco de hepatotoxicidade severa', severity: 'alta'),
      RiskInteraction(drugOrClass: 'Warfarina', effect: 'Uso prolongado (>4 dias em doses altas) pode aumentar o RNI', severity: 'moderada'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Analgésico e antipirético de PRIMEIRA ESCOLHA na gestação em qualquer trimestre.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Totalmente compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Seguro em insuficiência renal. Apenas aumentar o intervalo para 8h se ClCr < 10 mL/min.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.contraindicated,
        description: 'Contraindicado em doença hepática ativa grave ou cirrose descompensada. Reduzir dose para máx 2g/dia em casos leves.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Não afeta a pressão arterial ou medicamentos anti-hipertensivos.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Excelente tolerância gástrica. Não causa lesões de mucosa.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro em pacientes com asma induzida por AAS.',
      ),
    },
    clinicalTips: [
      'Medicamento de escolha para grávidas e pacientes com histórico de alergia a AAS/AINEs.',
      'Atenção para não associar com outros antigripais que contêm paracetamol para evitar hepatotoxicidade.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 4. DEXAMETASONA
  Drug(
    id: 'dexametasona',
    name: 'Dexametasona',
    genericName: 'Dexametasona',
    category: DrugCategory.corticosteroides,
    pharmacologicalClass: 'Corticosteroide Sistêmico Potente',
    mechanismOfAction: 'Inibição da fosfolipase A2 via lipocortina, bloqueando a cascata inflamatória (prostaglandinas e leucotrienos).',
    indications: ['Prevenção de trismo e edema cirúrgico (siso, implantes)', 'Cirurgia periodontal', 'Pulpites com inflamação severa'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '4 mg', commercialNames: ['Decadron', 'Dexametasona']),
      Presentation(type: 'Elixir / Solução Oral', concentration: '0,1 mg/mL', commercialNames: ['Decadron Elixir']),
    ],
    adultPosology: AdultPosology(
      standardDose: 'Dose única pré-operatória de 4 mg a 8 mg via oral, 1 hora antes da cirurgia.',
      maxDailyDose: '8 mg (dose única cirúrgica)',
      suggestedDuration: 'Dose única (ou máximo 2 dias)',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Dexametasona 4 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 2 comprimidos por via oral juntos, 1 HORA ANTES do procedimento cirúrgico.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 0.1,
      mgPerKgPerDoseMax: 0.3,
      maxDosePerDayMg: 8,
      intervalHours: 24,
      notes: 'Usar elixir 0,1 mg/mL. Dose única pré-operatória de 0,1 mg/kg a 0,3 mg/kg.',
      liquidPresentation: LiquidPresentation(
        name: 'Elixir 0,1 mg/mL',
        concentrationMgPerMl: 0.1,
      ),
      summaryText: '0,1 a 0,3 mg/kg dose única pré-operatória.',
    ),
    contraindications: ['Infecções fúngicas sistêmicas não tratadas', 'Diabetes mellitus descompensado', 'Úlcera péptica ativa'],
    adverseEffects: ['Retenção de sódio e líquidos', 'Hiperglicemia transitória', 'Insônia e euforia pós-dose'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Hipoglicemiantes / Insulina', effect: 'Diminui a eficácia dos antidiabéticos (eleva a glicemia)', severity: 'moderada'),
      RiskInteraction(drugOrClass: 'AINEs', effect: 'Aumento expressivo do risco de ulceração gástrica', severity: 'alta'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.caution,
        fdaCategory: 'C',
        description: 'Usar apenas se o benefício cirúrgico for estritamente necessário. Atravessa a barreira placentária.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Dose única pré-operatória é compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem necessidade de ajuste para dose única cirúrgica.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Seguro para uso pré-operatório único.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.caution,
        description: 'Monitorar PA se o paciente for hipertenso descompensado.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.caution,
        description: 'Evitar associação com AINEs em gastritados.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro em asmáticos. Tem efeito benéfico anti-inflamatório brônquico.',
      ),
    },
    clinicalTips: [
      'Dose única de 8mg de Dexametasona 1h antes da exodontia de siso reduz o edema pós-operatório em até 70%.',
      'Não causa imunossupressão ou supressão adrenal relevante em dose única cirúrgica.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 5. AMOXICILINA
  Drug(
    id: 'amoxicilina',
    name: 'Amoxicilina',
    genericName: 'Amoxicilina',
    category: DrugCategory.antibioticos,
    pharmacologicalClass: 'Antibacteriano Beta-lactâmico (Aminopenicilina)',
    mechanismOfAction: 'Inibição da síntese da parede celular bacteriana por ligação às PBPs.',
    indications: ['Infecções odontogênicas agudas (abscessos)', 'Profilaxia da Endocardite Bacteriana', 'Pericoronarite'],
    presentations: [
      Presentation(type: 'Cápsula', concentration: '500 mg', commercialNames: ['Amoxil', 'Velamox', 'Novocilin']),
      Presentation(type: 'Comprimido', concentration: '875 mg', commercialNames: ['Amoxil BD']),
      Presentation(type: 'Suspensão Oral', concentration: '250 mg/5mL', commercialNames: ['Amoxil Suspensão']),
      Presentation(type: 'Suspensão Oral', concentration: '400 mg/5mL', commercialNames: ['Velamox BD']),
    ],
    adultPosology: AdultPosology(
      standardDose: '500 mg a cada 8 horas (ou 875 mg a cada 12 horas) por via oral.',
      maxDailyDose: '3000 mg / dia',
      suggestedDuration: '7 dias (ou 48h após regressão dos sintomas)',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Amoxicilina 500 mg ----- 1 caixa',
        quantity: '1 caixa (21 cápsulas)',
        instructions: 'Tomar 1 cápsula por via oral a cada 8 horas durante 7 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 15.0,
      mgPerKgPerDoseMax: 25.0,
      maxDosePerDayMg: 1500,
      intervalHours: 8,
      notes: 'Posologia infantil usual: 40 a 50 mg/kg/dia fracionados a cada 8 horas. Profilaxia Endocardite: 50 mg/kg (máx 2g) dose única 1h antes.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 250 mg/5mL (50 mg/mL)',
        concentrationMgPerMl: 50.0,
      ),
      summaryText: '40-50 mg/kg/dia divididos de 8/8h. Suspensão 250mg/5mL: 0.3 a 0.5 mL/kg por dose.',
    ),
    contraindications: ['Histórico de reação anafilática ou urticária grave por Penicilinas/Cefalosporinas'],
    adverseEffects: ['Diarreia, náuseas, exantema cutâneo maculopapular', 'Candidíase oral secundária'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Anticoncepcionais Orais', effect: 'Pode reduzir discretamente a eficácia dos contraceptivos', severity: 'leve'),
      RiskInteraction(drugOrClass: 'Warfarina', effect: 'Aumento do RNI e risco de sangramento', severity: 'moderada'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Antibiótico de PRIMEIRA ESCOLHA na gestação.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.caution,
        description: 'Ajustar intervalo para 12h se ClCr entre 10-30 mL/min.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Excretada prioritariamente por via renal. Seguro em hepatopatas.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Sem interações com anti-hipertensivos.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Seguro para a mucosa gástrica.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Sem reatividade cruzada com AINEs.',
      ),
    },
    clinicalTips: [
      'Antibiótico de 1ª escolha para infecções odontogênicas e profilaxia da endocardite.',
      'Para profilaxia da endocardite em adultos: 2g (4 cápsulas de 500mg) 1 hora antes do procedimento.'
    ],
    prescriptionControl: 'Receita Branca 2 vias',
  ),

  // 6. AZITROMICINA
  Drug(
    id: 'azitromicina',
    name: 'Azitromicina',
    genericName: 'Azitromicina',
    category: DrugCategory.antibioticos,
    pharmacologicalClass: 'Antibacteriano Macrolídeo',
    mechanismOfAction: 'Inibição da síntese proteica bacteriana por ligação à subunidade 50S do ribossomo.',
    indications: ['Alternativa em alérgicos a Penicilina', 'Infecções periodontais e peri-implantares', 'Profilaxia de Endocardite em alérgicos'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '500 mg', commercialNames: ['Zithromax', 'Azi', 'Azitromicina']),
      Presentation(type: 'Suspensão Oral', concentration: '200 mg/5mL', commercialNames: ['Zithromax Suspensão']),
    ],
    adultPosology: AdultPosology(
      standardDose: '500 mg uma vez ao dia por via oral (1h antes ou 2h após a refeição).',
      maxDailyDose: '500 mg / dia',
      suggestedDuration: '3 a 5 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Azitromicina 500 mg ----- 1 caixa',
        quantity: '1 caixa (3 comprimidos)',
        instructions: 'Tomar 1 comprimido por via oral uma vez ao dia, durante 3 a 5 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 10.0,
      mgPerKgPerDoseMax: 12.0,
      maxDosePerDayMg: 500,
      intervalHours: 24,
      notes: 'Infantil: 10 mg/kg em dose única diária por 3 a 5 dias. Profilaxia endocardite: 15 mg/kg 1h antes.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 200 mg/5mL (40 mg/mL)',
        concentrationMgPerMl: 40.0,
      ),
      summaryText: '10 mg/kg/dia 1x ao dia por 3 dias.',
    ),
    contraindications: ['Hipersensibilidade a macrolídeos', 'Arritmias (prolongamento do intervalo QT)'],
    adverseEffects: ['Desconforto abdominal, diarreia', 'Prolongamento do intervalo QT no ECG'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Antiarrítmicos (Amiodarona)', effect: 'Aumento do risco de arritmias ventriculares graves', severity: 'alta'),
      RiskInteraction(drugOrClass: 'Warfarina', effect: 'Potencialização do efeito anticoagulante', severity: 'moderada'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Segura na gestação como alternativa a alérgicos.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem necessidade de ajuste de dose.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Excretada por via biliar/hepática. Usar com cautela em insuficiência hepática severa.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Sem interações pressóricas.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Boa tolerabilidade gástrica.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Segura em alérgicos a AINEs.',
      ),
    },
    clinicalTips: [
      'Ótima opção para pacientes com baixa adesão posológica (apenas 1 tomada ao dia por 3 dias).',
      'Excelente penetração em tecidos moles e osso maxilar.'
    ],
    prescriptionControl: 'Receita Branca 2 vias',
  ),

  // 7. CLINDAMICINA
  Drug(
    id: 'clindamicina',
    name: 'Clindamicina',
    genericName: 'Clindamicina',
    category: DrugCategory.antibioticos,
    pharmacologicalClass: 'Antibacteriano Lincosamida',
    mechanismOfAction: 'Inibição da síntese proteica bacteriana na subunidade 50S ribossômica.',
    indications: ['Infecções ósseas odontogênicas severas', 'Primeira escolha para alérgicos à Penicilina com infecção moderada/grave', 'Profilaxia da endocardite em alérgicos'],
    presentations: [
      Presentation(type: 'Cápsula', concentration: '300 mg', commercialNames: ['Dalacin C', 'Clindamicina']),
    ],
    adultPosology: AdultPosology(
      standardDose: '300 mg a cada 6 horas por via oral.',
      maxDailyDose: '1800 mg / dia',
      suggestedDuration: '7 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Clindamicina 300 mg ----- 1 caixa',
        quantity: '1 caixa (28 cápsulas)',
        instructions: 'Tomar 1 cápsula por via oral a cada 6 horas durante 7 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 5.0,
      mgPerKgPerDoseMax: 10.0,
      maxDosePerDayMg: 1200,
      intervalHours: 6,
      notes: 'Infantil: 20 mg/kg/dia divididos de 6/6h ou 8/8h. Profilaxia endocardite: 20 mg/kg (máx 600mg) 1h antes.',
      liquidPresentation: LiquidPresentation(
        name: 'Solução 15 mg/mL (Manipulação)',
        concentrationMgPerMl: 15.0,
      ),
      summaryText: '20 mg/kg/dia divididos a cada 6h.',
    ),
    contraindications: ['Histórico de Colite Pseudomembranosa por Clostridium difficile', 'Hipersensibilidade a lincosamidas'],
    adverseEffects: ['Diarreia intensa / Colite Pseudomembranosa', 'Erupções cutâneas'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Bloqueadores Neuromusculares', effect: 'Potencialização do bloqueio neuromuscular', severity: 'moderada'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Segura na gestação em alérgicas à penicilina.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.caution,
        description: 'Pode alterar a flora intestinal do lactente. Monitorar diarreia no bebê.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem necessidade de ajuste de dose.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Ajustar dose em insuficiência hepática severa.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Sem efeito na pressão arterial.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.caution,
        description: 'Orientar tomar com copo cheio de água para evitar irritação esofágica.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Segura.',
      ),
    },
    clinicalTips: [
      'Excelente penetração em tecido ósseo (mandíbula e maxila).',
      'Orientar suspensão imediata caso surja diarreia aquosa grave com cólicas (risco de C. difficile).'
    ],
    prescriptionControl: 'Receita Branca 2 vias',
  ),

  // 8. METRONIDAZOL
  Drug(
    id: 'metronidazol',
    name: 'Metronidazol',
    genericName: 'Metronidazol',
    category: DrugCategory.antibioticos,
    pharmacologicalClass: 'Antimicrobiano Nitroimidazólico (Anti-anaeróbio)',
    mechanismOfAction: 'Danos ao DNA bacteriano causados por metabólitos intermediários reativos.',
    indications: ['Gengivite Ulcerativa Necrosante (GUN/PUN)', 'Periodontite agressiva / anaeróbia', 'Abscessos graves associados à Amoxicilina'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '250 mg', commercialNames: ['Flagyl']),
      Presentation(type: 'Comprimido', concentration: '400 mg', commercialNames: ['Flagyl 400', 'Metronidazol']),
    ],
    adultPosology: AdultPosology(
      standardDose: '250 mg a 400 mg a cada 8 horas por via oral.',
      maxDailyDose: '1200 mg / dia',
      suggestedDuration: '7 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Metronidazol 400 mg ----- 1 caixa',
        quantity: '1 caixa (24 comprimidos)',
        instructions: 'Tomar 1 comprimido por via oral a cada 8 horas durante 7 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 7.5,
      mgPerKgPerDoseMax: 10.0,
      maxDosePerDayMg: 1200,
      intervalHours: 8,
      notes: 'Infantil: 20 a 30 mg/kg/dia divididos de 8/8h.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 40 mg/mL (Flagyl Ped)',
        concentrationMgPerMl: 40.0,
      ),
      summaryText: '20 a 30 mg/kg/dia fracionados de 8/8h.',
    ),
    contraindications: ['Consumo de álcool simultâneo (Efeito Antabuse / Disulfiram)', 'Primeiro trimestre de gestação'],
    adverseEffects: ['Gosto metálico na boca, náuseas', 'Efeito disulfiram com álcool (rubor, taquicardia, vômitos)'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Álcool (Etanol)', effect: 'Reação grave tipo disulfiram (rubor, vômitos, taquicardia)', severity: 'alta'),
      RiskInteraction(drugOrClass: 'Warfarina', effect: 'Aumento expressivo do RNI e risco hemorrágico', severity: 'alta'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.contraindicated,
        fdaCategory: 'B',
        description: 'Contraindicado no 1º trimestre por potencial teratogênico em estudos animais.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.caution,
        description: 'Excretado no leite materno. Interromper amamentação durante o uso e por 24h após a última dose.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem necessidade de ajuste em insuficiência leve a moderada.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Reduzir dose em 50% em hepatopatas graves.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Sem interações pressóricas.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Tolerabilidade gástrica razoável (pode causar náusea leve).',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: [
      'Medicamento de escolha para anaeróbios estritos (GUN e Periodontite Necrosante).',
      'ALERTAR rigorosamente o paciente para NÃO ingerir bebidas alcoólicas durante o tratamento e até 48h após.'
    ],
    prescriptionControl: 'Receita Branca 2 vias',
  ),

  // 9. NISTATINA
  Drug(
    id: 'nistatina',
    name: 'Nistatina',
    genericName: 'Nistatina',
    category: DrugCategory.antifungicos,
    pharmacologicalClass: 'Antifúngico Polieno Tópico / Oral',
    mechanismOfAction: 'Ligação aos esteroides da membrana fúngica (ergosterol), alterando a permeabilidade celular da Candida.',
    indications: ['Candidíase oral (sapo)', 'Estomatite protética', 'Queilite angular'],
    presentations: [
      Presentation(type: 'Suspensão Oral', concentration: '100.000 UI/mL', commercialNames: ['Micostatin', 'Nistatina']),
    ],
    adultPosology: AdultPosology(
      standardDose: '5 mL (500.000 UI) a cada 6 horas por via oral. Bochechar por 2 minutos e engolir.',
      maxDailyDose: '2.000.000 UI / dia',
      suggestedDuration: '10 a 14 dias (manter por 48h após alívio das lesões)',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Nistatina Suspensão Oral 100.000 UI/mL ----- 1 frasco',
        quantity: '1 frasco (50 mL)',
        instructions: 'Bochechar 5 mL por 2 minutos e ENGOLIR em seguida, a cada 6 horas, durante 14 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 1.0,
      mgPerKgPerDoseMax: 2.0,
      intervalHours: 6,
      notes: 'Recém-nascidos: 1 a 2 mL (100.000 a 200.000 UI) 4x ao dia aplicados na mucosa.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 100.000 UI/mL',
        concentrationMgPerMl: 100000.0,
      ),
      summaryText: '1 a 2 mL 4x ao dia aplicados na mucosa bucal.',
    ),
    contraindications: ['Hipersensibilidade conhecida à nistatina'],
    adverseEffects: ['Náusea ou diarreia leve em doses altas'],
    riskInteractions: [],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'C',
        description: 'Não é absorvida pelo trato gastrointestinal. Totalmente segura na gestação.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Segura na amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem absorção sistêmica.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Sem absorção sistêmica.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Segura.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Segura.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Segura.',
      ),
    },
    clinicalTips: [
      'Orientar higienização da prótese removível simultaneamente.',
      'Manter o tratamento por 48h após o desaparecimento visível das placas esbranquiçadas.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 10. CLOREXIDINA
  Drug(
    id: 'clorexidina',
    name: 'Clorexidina 0,12%',
    genericName: 'Digluconato de Clorexidina 0,12%',
    category: DrugCategory.antissepticos,
    pharmacologicalClass: 'Antisséptico Bisbiguanida',
    mechanismOfAction: 'Ruptura da membrana citoplasmática bacteriana e substantividade de até 12 horas na cavidade oral.',
    indications: ['Pós-operatório cirúrgico periodontal e de implantes', 'Incapacidade de escovação mecânica', 'Controle de placa bacteriana'],
    presentations: [
      Presentation(type: 'Colutório', concentration: '0,12% Sem Álcool', commercialNames: ['Periogard', 'Noplak', 'Periohed']),
    ],
    adultPosology: AdultPosology(
      standardDose: 'Bochechar 15 mL puro durante 1 minuto a cada 12 horas.',
      maxDailyDose: '30 mL / dia',
      suggestedDuration: '7 a 14 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Externo',
        itemText: 'Digluconato de Clorexidina 0,12% Sem Álcool ----- 1 frasco',
        quantity: '1 frasco (250 mL)',
        instructions: 'Bochechar 15 mL sem diluir durante 1 minuto a cada 12 horas, após a escovação.',
      ),
    ),
    contraindications: ['Hipersensibilidade à clorexidina'],
    adverseEffects: ['Manchamento extrínseco temporário dos dentes e restaurações', 'Alteração palatável temporária', 'Aumento de cálculo supragengival'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Creme dental comum (Lauril Sulfato de Sódio)', effect: 'Inativação da clorexidina pelo lauril sulfato', severity: 'leve'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Uso tópico seguro em gestantes.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Totalmente seguro na amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: [
      'Aguardar 30 minutos entre a escovação com creme dental e o bochecho com clorexidina.',
      'Não utilizar por mais de 14 dias seguidos sem reavaliação devido ao manchamento dental.'
    ],
    prescriptionControl: 'Livre',
  ),

  // 11. CETOPROFENO
  Drug(
    id: 'cetoprofeno',
    name: 'Cetoprofeno',
    genericName: 'Cetoprofeno',
    category: DrugCategory.aines,
    pharmacologicalClass: 'Anti-inflamatório Derivado do Ácido Propiônico',
    mechanismOfAction: 'Inibição potente da síntese de prostaglandinas e bradicininas.',
    indications: ['Dor intensa pós-operatória', 'Inflamação aguda severa em cirurgia oral'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '100 mg', commercialNames: ['Profenid', 'Cetoprofeno']),
      Presentation(type: 'Gotas', concentration: '20 mg/mL', commercialNames: ['Profenid Gotas']),
    ],
    adultPosology: AdultPosology(
      standardDose: '100 mg a cada 12 horas por via oral.',
      maxDailyDose: '200 mg / dia',
      suggestedDuration: '3 a 4 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Cetoprofeno 100 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 1 comprimido por via oral a cada 12 horas, após as refeições, por 3 a 4 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 0.5,
      mgPerKgPerDoseMax: 1.0,
      maxDosePerDayMg: 100,
      intervalHours: 8,
      notes: 'Gotas 20 mg/mL (1 mL = 20 gotas = 1 mg/gota): 1 gota por kg de peso corporal a cada 8h.',
      liquidPresentation: LiquidPresentation(
        name: 'Gotas 20 mg/mL',
        concentrationMgPerMl: 20.0,
        dropsPerMl: 20,
      ),
      summaryText: '0.5 a 1 mg/kg/dose de 8/8h.',
    ),
    contraindications: ['Úlcera péptica ativa', 'Insuficiência renal grave', 'Gestação no 3º trimestre'],
    adverseEffects: ['Dispepsia, epigastralgia', 'Tontura e sonolência leve'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Anticoagulantes', effect: 'Risco aumentado de hemorragia', severity: 'alta'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.contraindicated,
        fdaCategory: 'D',
        description: 'Contraindicado no 3º trimestre.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.caution,
        description: 'Usar com cautela.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.contraindicated,
        description: 'Contraindicado em insuficiência renal.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Cautela em cirróticos.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.caution,
        description: 'Monitorar pressão arterial.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.contraindicated,
        description: 'Contraindicado em gastritados.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.contraindicated,
        description: 'Contraindicado.',
      ),
    },
    clinicalTips: ['Ótima alternativa ao Ibuprofeno com tomada de 12 em 12 horas.'],
    prescriptionControl: 'Livre',
  ),

  // 12. AMOXICILINA + CLAVULANATO
  Drug(
    id: 'amoxicilina_clavulanato',
    name: 'Amoxicilina + Clavulanato',
    genericName: 'Amoxicilina + Clavulanato de Potássio',
    category: DrugCategory.antibioticos,
    pharmacologicalClass: 'Aminopenicilina + Inibidor de Beta-lactamase',
    mechanismOfAction: 'Inibição da parede celular bacteriana associada à inativação irreversível das enzimas beta-lactamases.',
    indications: ['Infecções odontogênicas refratárias à amoxicilina simples', 'Sinusite de origem odontogênica', 'Abscessos graves com celulite'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '875/125 mg', commercialNames: ['Clavulin BD', 'Novamox 2x']),
      Presentation(type: 'Comprimido', concentration: '500/125 mg', commercialNames: ['Clavulin']),
      Presentation(type: 'Suspensão Oral', concentration: '250/62,5 mg por 5mL', commercialNames: ['Clavulin Suspensão']),
    ],
    adultPosology: AdultPosology(
      standardDose: '875/125 mg a cada 12 horas por via oral (ou 500/125 mg de 8/8h).',
      maxDailyDose: '1750 mg de amoxicilina / dia',
      suggestedDuration: '7 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Amoxicilina + Clavulanato 875/125 mg ----- 1 caixa',
        quantity: '1 caixa (14 comprimidos)',
        instructions: 'Tomar 1 comprimido por via oral a cada 12 horas, no início da refeição, durante 7 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 20.0,
      mgPerKgPerDoseMax: 25.0,
      maxDosePerDayMg: 1500,
      intervalHours: 12,
      notes: 'Usar suspensão 250/62,5 mg/5mL. 40 a 50 mg/kg/dia base amoxicilina fracionada de 12/12h.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 250 mg/5mL',
        concentrationMgPerMl: 50.0,
      ),
      summaryText: '40 a 50 mg/kg/dia fracionados de 12 em 12h.',
    ),
    contraindications: ['Histórico de icterícia ou disfunção hepática associada ao Clavulanato', 'Alergia a penicilinas'],
    adverseEffects: ['Diarreia marcante (pelo clavulanato)', 'Náuseas e candidíase vaginal/oral'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Warfarina', effect: 'Aumento expressivo do RNI', severity: 'alta'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Seguro na gestação.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.caution,
        description: 'Ajustar dose se ClCr < 30 mL/min.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Usar com cautela em hepatopatas por risco de colestase.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Tomar no início das refeições para reduzir náuseas.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: ['Ideal para infecções que falharam com Amoxicilina pura após 48-72h.'],
    prescriptionControl: 'Receita Branca 2 vias',
  ),

  // 13. CICLOBENZAPRINA
  Drug(
    id: 'ciclobenzaprina',
    name: 'Ciclobenzaprina',
    genericName: 'Cloridrato de Ciclobenzaprina',
    category: DrugCategory.analgesicos,
    pharmacologicalClass: 'Relaxante Muscular de Ação Central',
    mechanismOfAction: 'Redução da atividade motora somática no tronco cerebral, aliviando o espasmo muscular esquelético.',
    indications: ['Trismo pós-operatório ou pós-traumático', 'Espasmo muscular de masseter/temporal em DTM aguda'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '5 mg', commercialNames: ['Miosan', 'Musculare', 'Mirtax']),
      Presentation(type: 'Comprimido', concentration: '10 mg', commercialNames: ['Miosan 10mg']),
    ],
    adultPosology: AdultPosology(
      standardDose: '5 mg a 10 mg por via oral, 1 a 3 vezes ao dia (preferencialmente à noite).',
      maxDailyDose: '30 mg / dia',
      suggestedDuration: '5 a 7 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Cloridrato de Ciclobenzaprina 5 mg ----- 1 caixa',
        quantity: '1 caixa',
        instructions: 'Tomar 1 comprimido por via oral à noite, antes de deitar, por 7 dias.',
      ),
    ),
    contraindications: ['Glaucoma de ângulo fechado', 'Uso recente de inibidores da MAO (<14 dias)', 'Fase aguda pós-infarto'],
    adverseEffects: ['Sonolência marcante', 'Xerostomia (boca seca)', 'Tontura e visão turva'],
    riskInteractions: [
      RiskInteraction(drugOrClass: 'Depressores do SNC / Álcool', effect: 'Potencialização grave da sedação', severity: 'alta'),
    ],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.caution,
        fdaCategory: 'B',
        description: 'Usar somente se estritamente necessário.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.caution,
        description: 'Excretado no leite. Monitorar sedação no bebê.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Sem ajuste necessário.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.caution,
        description: 'Usar doses baixas em hepatopatas.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: ['Orientar o paciente para não dirigir veículos durante o tratamento devido à sonolência.'],
    prescriptionControl: 'Livre',
  ),

  // 14. TRIANCINOLONA ORABASE
  Drug(
    id: 'triancinolona_orabase',
    name: 'Triancinolona em Orabase',
    genericName: 'Triancinolona Acetonida 0,1%',
    category: DrugCategory.corticosteroides,
    pharmacologicalClass: 'Corticosteroide Tópico Oral',
    mechanismOfAction: 'Ação anti-inflamatória e imunossupressora local sobre lesões ulceradas orais.',
    indications: ['Estomatite aftosa recorrente (aftas)', 'Líquen plano oral erosivo', 'Lesões traumáticas de mucosa'],
    presentations: [
      Presentation(type: 'Pasta Tópica Oral', concentration: '0,1% em Orabase', commercialNames: ['Omcilon-A em Orabase', 'Mudamar']),
    ],
    adultPosology: AdultPosology(
      standardDose: 'Aplicar pequena quantidade sobre a lesão 2 a 3 vezes ao dia após as refeições e ao deitar.',
      maxDailyDose: 'Uso tópico restrito',
      suggestedDuration: '5 a 7 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Tópico',
        itemText: 'Triancinolona Acetonida em Orabase 0,1% ----- 1 bisnaga',
        quantity: '1 bisnaga (10g)',
        instructions: 'Secar a região com gaze e depositar uma camada fina sobre a ferida, sem esfregar, 3 vezes ao dia após as refeições.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 1.0,
      mgPerKgPerDoseMax: 2.0,
      intervalHours: 6,
      notes: 'Recém-nascidos: 1 a 2 mL (100.000 a 200.000 UI) 4x ao dia aplicados na mucosa.',
      liquidPresentation: LiquidPresentation(
        name: 'Suspensão 100.000 UI/mL',
        concentrationMgPerMl: 100000.0,
      ),
      summaryText: '1 a 2 mL 4x ao dia aplicados na mucosa bucal.',
    ),
    contraindications: ['Infecções fúngicas (candidíase), virais (herpes) ou bacterianas ativas no local'],
    adverseEffects: ['Sensação de queimação local passageira', 'Candidíase oral se usado prolongadamente'],
    riskInteractions: [],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'C',
        description: 'Absorção sistêmica insignificante em uso tópico de curto prazo.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: ['Orientar o paciente a não esfregar a pomada: apenas encostar para formar a película protetora Orabase.'],
    prescriptionControl: 'Livre',
  ),

  // 15. ACICLOVIR
  Drug(
    id: 'aciclovir',
    name: 'Aciclovir',
    genericName: 'Aciclovir',
    category: DrugCategory.antivirais,
    pharmacologicalClass: 'Antiviral Análogo de Nucleosídeo',
    mechanismOfAction: 'Inibição seletiva da DNA polimerase viral do Herpes Simples (HSV-1).',
    indications: ['Herpes simples labial recorrente', 'Gengivoestomatite herpética primária'],
    presentations: [
      Presentation(type: 'Comprimido', concentration: '200 mg', commercialNames: ['Zovirax', 'Aciclovir']),
      Presentation(type: 'Comprimido', concentration: '400 mg', commercialNames: ['Zovirax 400']),
      Presentation(type: 'Creme Tópico', concentration: '5%', commercialNames: ['Zovirax Creme']),
    ],
    adultPosology: AdultPosology(
      standardDose: '200 mg via oral a cada 4 horas (5 vezes ao dia) por 5 dias OU creme 5% a cada 4 horas.',
      maxDailyDose: '1000 mg / dia',
      suggestedDuration: '5 dias',
      recipeModel: RecipeModel(
        useType: 'Uso Interno',
        itemText: 'Aciclovir 200 mg ----- 1 caixa',
        quantity: '1 caixa (25 comprimidos)',
        instructions: 'Tomar 1 comprimido por via oral 5 vezes ao dia (a cada 4 horas, omitindo a dose noturna) por 5 dias.',
      ),
    ),
    pediatricPosology: PediatricDosage(
      mgPerKgPerDoseMin: 10.0,
      mgPerKgPerDoseMax: 20.0,
      maxDosePerDayMg: 1000,
      intervalHours: 6,
      notes: 'Gengivoestomatite herpética infantil: 20 mg/kg/dose 4x ao dia por 5 a 7 dias.',
      summaryText: '20 mg/kg/dose de 6/6h por 5 dias.',
    ),
    contraindications: ['Hipersensibilidade ao Aciclovir ou Valaciclovir'],
    adverseEffects: ['Cefaleia, náuseas', 'Nefrotoxicidade em infusão IV (raríssima VO)'],
    riskInteractions: [],
    conditionRisks: {
      PatientCondition.gestante: ConditionRisk(
        condition: PatientCondition.gestante,
        level: RiskLevel.safe,
        fdaCategory: 'B',
        description: 'Seguro na gestação.',
      ),
      PatientCondition.lactante: ConditionRisk(
        condition: PatientCondition.lactante,
        level: RiskLevel.safe,
        description: 'Compatível com a amamentação.',
      ),
      PatientCondition.renal: ConditionRisk(
        condition: PatientCondition.renal,
        level: RiskLevel.caution,
        description: 'Ajustar intervalo em insuficiência renal grave.',
      ),
      PatientCondition.hepatico: ConditionRisk(
        condition: PatientCondition.hepatico,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.hipertenso: ConditionRisk(
        condition: PatientCondition.hipertenso,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.ulceraGastrite: ConditionRisk(
        condition: PatientCondition.ulceraGastrite,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
      PatientCondition.asmaAlergiaAas: ConditionRisk(
        condition: PatientCondition.asmaAlergiaAas,
        level: RiskLevel.safe,
        description: 'Seguro.',
      ),
    },
    clinicalTips: ['Iniciar o tratamento preferencialmente na fase de pródromo (formigamento/coceira) para eficácia máxima.'],
    prescriptionControl: 'Livre',
  ),
];

// Alias for database access
final List<Drug> drugs = drugsDatabase;
