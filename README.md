# Prescreve+

Guia de prescrição medicamentosa e calculadora odontológica em Flutter (Android).

## Funcionalidades

- **Fármacos** — busca por nome, princípio ativo, indicação ou marca; filtro por categoria e por condição do paciente (gestante, lactante, insuficiência renal/hepática etc.), com indicação de risco.
- **Pediátrico** — cálculo de dose por peso (mg, mL e gotas).
- **Protocolos** — protocolos clínicos com aplicação direta ao receituário.
- **Emergência** — limite de tubetes anestésicos por peso e condutas em emergências médicas.
- **Receituário** — monta a receita e gera o PDF para imprimir ou compartilhar.

> ⚠️ Os dados clínicos (doses, indicações, contraindicações) foram gerados com auxílio de IA e devem ser revisados por um profissional antes do uso com pacientes.

## Requisitos

- Flutter 3.38+ (Dart 3.10+)
- Android SDK com um emulador ou aparelho conectado
- JDK 17 a 25 (o projeto usa Gradle 9.1 e Android Gradle Plugin 8.13, compatíveis com Java 25)

## Como executar

```bash
git clone https://github.com/wesleylima123/prescreve-plus.git
cd prescreve-plus
flutter pub get
flutter run
```

### Pelo VS Code

1. Instale a extensão **Flutter**.
2. Abra a pasta do projeto.
3. Inicie o emulador (`flutter emulators --launch <id>`) ou conecte um aparelho.
4. Selecione o dispositivo no canto inferior direito e aperte **F5**.

## Gerar APK

```bash
flutter build apk --release
```

O arquivo fica em `build/app/outputs/flutter-apk/app-release.apk`.

## Estrutura

```
lib/
  main.dart                 # tema e navegação por abas
  models/types.dart         # modelos de dados
  data/                     # fármacos, protocolos, emergências e anestésicos
  screens/                  # telas do app
  services/pdf_service.dart # geração do PDF da receita
assets/fonts/               # Zilla Slab e IBM Plex Sans (licença OFL)
```

## Observações técnicas

- O `pubspec.yaml` fixa `image: 4.5.4` em `dependency_overrides`, porque versões mais novas exigem um pacote `archive` indisponível no Dart 3.10. Pode ser removido ao atualizar o Flutter.
- As fontes são carregadas localmente de `assets/fonts/`, sem depender de internet.
