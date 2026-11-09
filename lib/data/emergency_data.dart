import '../models/types.dart';


final List<LocalAnesthetic> anestheticList = [
  LocalAnesthetic(
    name: 'Lidocaína 2% + Epinefrina 1:100.000',
    maxDoseMgPerKg: 4.4,
    maxAbsoluteDoseMg: 300.0,
    mgPerCartridge: 36.0,
    vasoconstrictor: 'Epinefrina 1:100.000',
    notes: 'Padrão ouro em Odontologia. Em cardiopatas compensados, limitar a 2 tubetes.',
  ),
  LocalAnesthetic(
    name: 'Articaína 4% + Epinefrina 1:100.000',
    maxDoseMgPerKg: 7.0,
    maxAbsoluteDoseMg: 500.0,
    mgPerCartridge: 72.0,
    vasoconstrictor: 'Epinefrina 1:100.000',
    notes: 'Alta difusibilidade óssea. Excelente em mandíbula e procedimentos longos.',
  ),
  LocalAnesthetic(
    name: 'Articaína 4% + Epinefrina 1:200.000',
    maxDoseMgPerKg: 7.0,
    maxAbsoluteDoseMg: 500.0,
    mgPerCartridge: 72.0,
    vasoconstrictor: 'Epinefrina 1:200.000',
    notes: 'Menor concentração de vasoconstritor, indicada para pacientes cardiopatas compensados.',
  ),
  LocalAnesthetic(
    name: 'Mepivacaína 2% + Adrenalina 1:100.000',
    maxDoseMgPerKg: 4.4,
    maxAbsoluteDoseMg: 300.0,
    mgPerCartridge: 36.0,
    vasoconstrictor: 'Adrenalina 1:100.000',
    notes: 'Ação rápida. Semelhante à lidocaína com excelente perfil de eficácia.',
  ),
  LocalAnesthetic(
    name: 'Mepivacaína 3% Sem Vasoconstritor',
    maxDoseMgPerKg: 4.4,
    maxAbsoluteDoseMg: 300.0,
    mgPerCartridge: 54.0,
    vasoconstrictor: 'Sem vasoconstritor',
    notes: 'Vasodilatação intrínseca moderada. Indicada para alérgicos a sulfito ou procedimentos curtos.',
  ),
  LocalAnesthetic(
    name: 'Prilocaína 3% + Felipressina 0,03 UI/mL',
    maxDoseMgPerKg: 6.0,
    maxAbsoluteDoseMg: 400.0,
    mgPerCartridge: 54.0,
    vasoconstrictor: 'Felipressina (Octapressin)',
    notes: 'Escolha de 1ª linha em hipertensos e diabéticos compensados. EVITAR em gestantes (efeito oxitócico).',
  ),
  LocalAnesthetic(
    name: 'Bupivacaína 0,5% + Epinefrina 1:200.000',
    maxDoseMgPerKg: 1.3,
    maxAbsoluteDoseMg: 90.0,
    mgPerCartridge: 9.0,
    vasoconstrictor: 'Epinefrina 1:200.000',
    notes: 'Longa duração (4 a 8h de anestesia de tecidos moles). Indicada para controle de dor pós-operatória severa.',
  ),
];

final List<MedicalEmergency> emergencyList = [
  MedicalEmergency(
    id: 'sincope_vasovagal',
    title: 'Síncope Vasovagal (Desmaio)',
    category: 'Cardiovascular / Reflexo',
    description: 'Perda súbita e transitória da consciência por diminuição do fluxo sanguíneo cerebral, comumente deflagrada por estresse, ansiedade, medo ou dor no consultório.',
    signsAndSymptoms: [
      'Palidez cutânea acentuada e sudorese fria',
      'Tontura, visão turva e vertigem',
      'Nausea e sensação de fraqueza extrema',
      'Perda de consciência rápida com pulso fraco e lentificado'
    ],
    conductSteps: [
      'Interromper imediatamente o procedimento odontológico.',
      'Colocar o paciente na Posição de Trendelenburg (cadeira reclinada com pernas elevadas acima do nível da cabeça).',
      'Assegurar vias aéreas livres e afrouxar roupas/gravatas apertadas no pescoço.',
      'Aplicar compressa fria na testa do paciente.',
      'Monitorar Sinais Vitais (Pressão Arterial e Frequência Cardíaca). A recuperação ocorre em 1 a 2 minutos.'
    ],
    emergencyDrugs: [
      'Oxigênio 100% a 3-5 L/min se houver demora na recuperação',
      'Sais de amônio (inalação) se necessário'
    ],
  ),
  MedicalEmergency(
    id: 'hipoglicemia_aguda',
    title: 'Crise de Hipoglicemia (Paciente Diabético)',
    category: 'Endócrino / Metabólico',
    description: 'Queda acentuada dos níveis de glicose no sangue (glicemia < 70 mg/dL), comum em pacientes diabéticos em jejum ou após uso de insulina/hipoglicemiantes.',
    signsAndSymptoms: [
      'Sudorese profusa e pele fria/pegajosa',
      'Tremores de extremidades e palpitações',
      'Fome intensa, tontura e cefaleia',
      'Confusão mental, irritabilidade, desorientação e perda de consciência (em casos severos)'
    ],
    conductSteps: [
      'Parar o procedimento odontológico e aferir a glicemia capilar (glicosímetro) se disponível.',
      'Se o paciente estiver CONSCIENTE: Administrar 15g a 20g de carboidrato de rápida absorção por via oral (1 copo de suco de laranja açucarado ou 3 colheres de açúcar em água).',
      'Aguardar 15 minutos e reavaliar os sintomas.',
      'Se o paciente estiver INCONSCIENTE: NUNCA colocar nada líquido na boca (risco de broncoaspiração!). Posicionar em decúbito lateral de segurança e chamar o SAMU (192).'
    ],
    emergencyDrugs: [
      'Glucagon 1 mg IM / SC (em paciente inconsciente por equipe habilitada)',
      'Glicose hipertônica 50% IV (socorro médico)'
    ],
  ),
  MedicalEmergency(
    id: 'anafilaxia_choque',
    title: 'Reação Anafilática / Choque Anafilático',
    category: 'Imunológico / Alérgico Grave',
    description: 'Emergência médica grave e de rápida evolução caracterizada por broncoespasmo severo, edema de glote e colapso circulatório secundário à exposição a alérgeno (anestésicos, antibióticos, látex).',
    signsAndSymptoms: [
      'Urticária difusa, prurido, eritema e angioedema de lábios/língua',
      'Sensação de constrição na garganta, rouquidão e estridor laríngeo',
      'Dificuldade respiratória grave (dispneia e sibilância)',
      'Hipotensão arterial severa, taquicardia e choque cardiovascular'
    ],
    conductSteps: [
      'CHAMAR O SAMU (192) OU RESGATE DE IMEDIATO!',
      'Administrar Epinefrina (Adrenalina 1:1000) IM na face anterolateral da coxa (Vasto Lateral): 0,3 a 0,5 mL em adultos (0,01 mg/kg em crianças, máx 0,3 mL).',
      'Posicionar o paciente em decúbito dorsal com pernas elevadas (se houver desconforto respiratório grave, manter semi-sentado).',
      'Administrar Oxigênio 100% (10 a 15 L/min sob máscara).',
      'Repetir a dose de Epinefrina IM a cada 5 a 15 minutos caso não haja resposta clínica até a chegada do socorro médico.'
    ],
    emergencyDrugs: [
      'Epinefrina (Adrenalina) 1:1000 IM (Fármaco de 1ª Escolha Absoluta)',
      'Antihistamínico (Diphenhydramine / Prometazina) IM pós-adrenalina',
      'Corticosteroide (Hidrocortisona 200mg a 500mg IV) para prevenir reação tardia'
    ],
  ),
  MedicalEmergency(
    id: 'crise_hipertensiva',
    title: 'Crise Hipertensiva no Consultório',
    category: 'Cardiovascular',
    description: 'Elevação súbita e acentuada da Pressão Arterial (PA Systólica ≥ 180 mmHg ou PA Diastólica ≥ 110 mmHg), associada à ansiedade ou dor.',
    signsAndSymptoms: [
      'Cefaleia occipital pulsátil intensa',
      'Zumbido no ouvido e tontura',
      'Visão turva ou escotomas cintilantes',
      'Dor torácica ou desconforto pré-cordial'
    ],
    conductSteps: [
      'Interromper o atendimento odontológico imediatamente.',
      'Manter o paciente sentado em posição confortável e calmo.',
      'Aferir a PA novamente após 5 a 10 minutos de repouso.',
      'Se houver sintomas de emergência (dor no peito, alteração motora/fala): Chamar o SAMU (192).',
      'Não administrar anti-hipertensivos sublinguais de rotina sem prescrição/orientação médica prévia do paciente.'
    ],
    emergencyDrugs: [
      'Oxigênio sob máscara se houver dispneia',
      'Medicação de uso habitual do paciente com orientação médica'
    ],
  ),
  MedicalEmergency(
    id: 'crise_asmatica',
    title: 'Crise de Asma / Broncoespasmo Agudo',
    category: 'Respiratório',
    description: 'Constrição aguda das vias aéreas inferiores com edema bronquial, desencadeada por ansiedade, estresse ou alérgenos do ambiente odontológico.',
    signsAndSymptoms: [
      'Dispneia expiratória com chiado (sibilância audible)',
      'Tosse seca e opressão torácica',
      'Uso de musculatura acessória para respirar',
      'Ansiedade crescente e taquicardia'
    ],
    conductSteps: [
      'Interromper o procedimento e posicionar o paciente sentado ereto.',
      'Solicitar que o paciente utilize o seu inalador de alívio (Broncodilatador de ação rápida - Salbutamol / Aerolin).',
      'Administrar 2 a 4 jatos do spray inalatório (usando espaçador se disponível).',
      'Ofertar Oxigênio a 100% (4 a 6 L/min).',
      'Se não houver melhora em 10 minutos ou se surgirem sinais de cianose: Chamar o SAMU (192).'
    ],
    emergencyDrugs: [
      'Salbutamol Spray 100 mcg (2 a 4 jatos)',
      'Oxigênio 100%'
    ],
  ),
  MedicalEmergency(
    id: 'convulsao',
    title: 'Crise Convulsiva / Epilepsia',
    category: 'Neurológico',
    description: 'Descarga elétrica neuronal paroxística e desordenada no cérebro, manifestando-se por contraturas musculares involuntárias bruscas (tônico-clônicas).',
    signsAndSymptoms: [
      'Perda súbita de consciência com queda',
      'Contração muscular tônica seguida de abalos clônicos de todo o corpo',
      'Sialorreia (salivação excessiva/espuma na boca) e possível mordedura de língua',
      'Incontinência urinária/fecal e período pós-ictal (confusão e sonolência ao despertar)'
    ],
    conductSteps: [
      'Afastar todos os instrumentos odontológicos e objetos perfurocortantes da cadeira/redor do paciente.',
      'Proteger a cabeça do paciente com uma almofada ou toalha (NUNCA tentar segurar os membros com força!).',
      'NUNCA colocar as mãos ou objetos duros dentro da boca do paciente!',
      'Após a cessação dos abalos: Posicionar o paciente em Decúbito Lateral de Segurança para drenar secreções e prevenir aspiração.',
      'Manter vias aéreas livres, monitorar respiração e chamar o SAMU (192) se a crise durar > 5 minutos ou se for a 1ª crise.'
    ],
    emergencyDrugs: [
      'Diazepam 10 mg retal / IV (por equipe médica de emergência se crise prolongada >5 min)'
    ],
  ),
  MedicalEmergency(
    id: 'angina_iam',
    title: 'Angina de Peito / Infarto Agudo do Miocárdio (IAM)',
    category: 'Cardiovascular Grave',
    description: 'Isquemia miocárdica induzida por obstrução coronariana ou espasmo, exacerbada pelo aumento da demanda de oxigênio do coração sob estresse.',
    signsAndSymptoms: [
      'Dor retroesternal opressiva ("aperto" ou "peso no peito") que pode irradiar para braço esquerdo, mandíbula ou dorso',
      'Sudorese fria profusa e palidez cutânea',
      'Dispneia, náuseas e sensação de morte iminente',
      'Em caso de Angina: Dor melhora em 3 a 5 min com repouso. No IAM: Dor persistente > 30 min refratária.'
    ],
    conductSteps: [
      'INTERROMPER O ATENDIMENTO E CHAMAR O SAMU (192) IMEDIATAMENTE!',
      'Manter o paciente em repouso absoluto, sentado ou semi-sentado confortável.',
      'Administrar Oxigênio a 100% (4 a 6 L/min).',
      'Se o paciente já tiver diagnóstico de Angina: Auxiliar na tomada de Nitroglicerina / Dinitrato de Isossorbida 5 mg sublingual.',
      'Se não houver contraindicação/alergia: Administrar 2 comprimidos de AAS (Aspirina 100mg) para mastigar e engolir (dose total 200mg a 300mg).'
    ],
    emergencyDrugs: [
      'AAS (Aspirina) 200 mg a 300 mg mastigável',
      'Dinitrato de Isossorbida 5 mg Sublingual',
      'Oxigênio 100%'
    ],
  ),
  MedicalEmergency(
    id: 'overdose_anestesico',
    title: 'Toxicidade / Overdose de Anestésico Local',
    category: 'Iatrogênico / Farmacológico',
    description: 'Níveis plasmáticos excessivos de anestésico local devido a injeção intravascular inadvertida ou ultrapassagem da dose máxima recomendada.',
    signsAndSymptoms: [
      'Fase inicial (Excitação do SNC): Loquacidade, apreensão, desorientação, gosto metálico na boca, dormência perioral e zumbidos.',
      'Fase avançada (Depressão do SNC): Sonolência, tremores, convulsões tônico-clônicas e perda de consciência.',
      'Fase severa: Colapso cardiovascular, bradicardia, arritmias ventriculares e parada cardiorrespiratória.'
    ],
    conductSteps: [
      'Interromper a administração do anestésico local imediatamente.',
      'Avaliar nível de consciência e manter vias aéreas abertas.',
      'Administrar Oxigênio 100%.',
      'Se houver convulsão: Proteger o paciente contra traumas físicos e acionar o SAMU (192).',
      'Se houver parada cardiorrespiratória: Iniciar imediatamente as manobras de Suporte Básico de Vida (Ressuscitação Cardiopulmonar - RCP) com compressões torácicas e utilizar o DEA (Desfibrilador Externo Automático).'
    ],
    emergencyDrugs: [
      'Oxigênio 100%',
      'Emulsão Lipídica 20% IV (Tratamento de resgate hospitalar para toxicidade por anestésico local)'
    ],
  ),
];
