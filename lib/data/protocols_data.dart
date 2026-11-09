import '../models/types.dart';

final List<ClinicalProtocol> clinicalProtocols = [
  ClinicalProtocol(
    id: 'endocardite_profilaxia',
    title: 'Profilaxia de Endocardite Bacteriana',
    subtitle: 'Protocolo AHA / Sociedade Brasileira de Cardiologia',
    category: 'Profilaxia Antibiótica',
    description: 'Indicada para pacientes com prótese valvar cardíaca, endocardite prévia, cardiopatia congênita cianótica não reparada ou transplante cardíaco com valvopatia, submetidos a procedimentos odontológicos com manipulação gengival ou periapical.',
    firstChoiceDrugId: 'amoxicilina',
    firstChoicePosology: 'Amoxicilina 2 g (4 cápsulas de 500 mg) por via oral, em dose única, 1 HORA ANTES do procedimento.',
    alternativeChoiceDrugId: 'clindamicina',
    alternativeChoicePosology: 'Alérgicos à Penicilina: Clindamicina 600 mg (2 cápsulas de 300 mg) OU Azitromicina 500 mg, 1 HORA ANTES.',
    allergiesOrSpecialNotes: 'Crianças: Amoxicilina 50 mg/kg (máx 2g); Clindamicina 20 mg/kg (máx 600mg); Azitromicina 15 mg/kg (máx 500mg).',
    steps: [
      'Identificar se o paciente faz parte do grupo de alto risco cardíaco.',
      'Verificar se o procedimento envolve manipulação de tecido gengival, região periapical ou perfuração de mucosa.',
      'Prescrever a medicação para ser tomada exatamente 30 a 60 minutos antes da anestesia local.',
      'Caso o paciente esqueça de tomar antes, a dose pode ser administrada até 2 horas após o término do procedimento.'
    ],
  ),
  ClinicalProtocol(
    id: 'abscesso_periapical',
    title: 'Abscesso Periapical Agudo / Infecção Odontogênica',
    subtitle: 'Conduta Clínica e Antimicrobiana Sistêmica',
    category: 'Infecções Odontogênicas',
    description: 'Infecção purulenta aguda com origem pulpar/periapical, manifestando edema, dor à percussão, trismo ou comprometimento sistêmico (frequência cardíaca elevada, febre, prostração).',
    firstChoiceDrugId: 'amoxicilina',
    firstChoicePosology: 'Amoxicilina 500 mg de 8 em 8 horas por 7 dias. Em quadros mais graves ou refratários: Amoxicilina + Clavulanato 875/125 mg de 12 em 12 horas.',
    alternativeChoiceDrugId: 'clindamicina',
    alternativeChoicePosology: 'Alérgicos à Penicilina: Clindamicina 300 mg de 6 em 6 horas por 7 dias.',
    allergiesOrSpecialNotes: 'ATENÇÃO: O tratamento cirúrgico (abertura coronária/drenagem) é OBRIGATÓRIO. O antibiótico sozinho não cura abscesso não drenado!',
    steps: [
      'Realizar o diagnóstico clínico e radiográfico da unidade dental responsável.',
      'Executar a drenagem cirúrgica do abscesso (via canal radicular ou incisão em fundo de sulco se houver flutuação).',
      'Prescrever antibioticoterapia sistêmica se houver febre, trismo, enfartamento ganglionar ou celulite expansiva.',
      'Associar analgésicos e anti-inflamatórios (ex: Ibuprofeno 600mg ou Dipirona 1g) para controle sintomático.'
    ],
  ),
  ClinicalProtocol(
    id: 'pericoronarite_aguda',
    title: 'Pericoronarite Aguda em Terceiro Molar',
    subtitle: 'Manejo Local de Urgência & Antibioticoterapia',
    category: 'Infecções Odontogênicas',
    description: 'Processo inflamatório/infeccioso nos tecidos moles pericoronários em dentes semi-inclusos (frequentemente 3º molares inferiores), apresentando dor intensa, halitose, trismo e disfagia.',
    firstChoiceDrugId: 'amoxicilina',
    firstChoicePosology: 'Amoxicilina 500 mg VO de 8 em 8 horas por 7 dias + Bochecho de Clorexidina 0,12% 12/12h.',
    alternativeChoiceDrugId: 'clindamicina',
    alternativeChoicePosology: 'Alérgicos: Azitromicina 500 mg 1x/dia por 3 a 5 dias ou Clindamicina 300 mg 6/6h por 7 dias.',
    allergiesOrSpecialNotes: 'A irrigação abundante do capuz pericoronário com Soro Fisiológico e Clorexidina 0,2% no consultório traz alívio imediato.',
    steps: [
      'Realizar irrigação mecânica do capuz opercular para remoção de detritos e placa bacteriana retida.',
      'Verificar a ocorrência de trauma do dente antagonista sobre o operáculo opercular (realizar desgaste seletivo).',
      'Prescrever bochecho com Clorexidina 0,12% sem álcool 2x ao dia durante 7 dias.',
      'Orientar a exodontia do elemento dental após regressão completa da fase aguda.'
    ],
  ),
  ClinicalProtocol(
    id: 'gun_periodontite_necrosante',
    title: 'Gengivite Ulcerativa Necrosante (GUN / PUN)',
    subtitle: 'Protocolo de Desbridamento e Antimicrobiano',
    category: 'Periodontia',
    description: 'Infecção periodontal dolorosa caracterizada pela necrose das papilas interdentais (papilas decapitadas), sangramento espontâneo, pseudomembrana acinzentada e halitose fétida acentuada.',
    firstChoiceDrugId: 'metronidazol',
    firstChoicePosology: 'Metronidazol 400 mg VO de 8 em 8 horas por 7 dias OU Amoxicilina 500mg + Metronidazol 250mg 8/8h.',
    alternativeChoiceDrugId: 'clindamicina',
    alternativeChoicePosology: 'Alérgicos a Penicilina: Metronidazol 400 mg de 8/8h isolado por 7 dias.',
    allergiesOrSpecialNotes: 'ALERTA: O Metronidazol interage gravemente com Álcool (Efeito Antabuse / Disulfiram) e Anticoagulante Warfarina.',
    steps: [
      'Realizar desbridamento ultrassônico suave e remoção das pseudomembranas necrosadas sob anestesia.',
      'Instruir bochecho com Peróxido de Hidrogênio 10 volumes (1:1 com água morna) ou Clorexidina 0,12% 12/12h.',
      'Iniciar antibioticoterapia sistêmica com Metronidazol pela cobertura específica de anaeróbios estritos.',
      'Controlar fatores desencadeantes: estresse agudo, imunossupressão, desnutrição e tabagismo.'
    ],
  ),
  ClinicalProtocol(
    id: 'cirurgia_siso_edema',
    title: 'Pré e Pós-Operatório de Cirurgia Oral (Sisos / Implantes)',
    subtitle: 'Protocolo de Controle de Dor, Trismo e Edema',
    category: 'Cirurgia Oral',
    description: 'Protocolo otimizado para exodontias de terceiros molares inclusos/impactados, cirurgias ortognáticas ou implantes múltiplos com enxerto.',
    firstChoiceDrugId: 'dexametasona',
    firstChoicePosology: 'Pré-operatório: Dexametasona 4 mg a 8 mg (1 a 2 comprimidos) 1 hora antes da cirurgia.',
    alternativeChoiceDrugId: 'ibuprofeno',
    alternativeChoicePosology: 'Pós-operatório: Ibuprofeno 600 mg de 8/8h por 3 dias + Dipirona 1g de 6/6h se houver dor residual.',
    allergiesOrSpecialNotes: 'A dose única de corticosteroide pré-operatório previne em até 70% o edema e trismo pós-operatório sem causar imunossupressão.',
    steps: [
      'Prescrever Dexametasona 8mg 1h antes da cirurgia para bloquear a cascata do ácido aracdônico precocemente.',
      'Prescrever AINE (Ibuprofeno 600mg ou Cetoprofeno 100mg) para iniciar logo após o procedimento por 3 dias.',
      'Prescrever analgésico puro (Dipirona 1g ou Paracetamol 750mg) em esquema "se houver dor".',
      'Fornecer bochecho com Clorexidina 0,12% iniciado 24 horas após a cirurgia para higiene do sítio cirúrgico.'
    ],
  ),
];

final List<ClinicalProtocol> clinicalProtocolsDatabase = clinicalProtocols;
