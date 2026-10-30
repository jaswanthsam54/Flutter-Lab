Here is a complete, GitHub-ready README.md for your Flutter Calculator App. It includes your original features and maps all 10 Flutter lab experiments to the project.

# 🧮 Calculator App — Flutter

A feature-rich, responsive Calculator Application built using **Flutter and Dart**, featuring Standard Mode, Scientific Mode, Calculation History, and Currency Conversion.

The project demonstrates core Flutter development concepts through one practical application, covering all 10 prescribed Flutter lab experiments.

---

## 📱 Project Preview

A premium dark-themed calculator interface featuring:
- Standard Calculator
- Scientific Calculator
- Calculation History
- Currency Converter

## ✨ Features

### 1. Standard Calculator
- Addition, subtraction, multiplication and division.
- Percentage calculations.
- Positive/negative sign toggle.
- Backspace and clear functionality.
- Decimal point support.
- Chained calculations.
- Thousand separators.
- Auto-scaling calculation display.

### 2. Scientific Calculator
- **Trigonometry:** sin, cos, tan, sin⁻¹, cos⁻¹, tan⁻¹.
- **Logarithms:** log, ln.
- **Powers:** x², x³, eˣ, 10ˣ.
- **Roots:** √x, ∛x.
- **Special Functions:** Factorial, reciprocal, absolute value.
- **Constants:** π and e.
- **Angle Modes:** DEG and RAD.

### 3. Calculation History
- Stores the last 50 calculations.
- Displays previous expressions and results.
- Slide-in history panel.
- Option to clear calculation history.

### 4. Currency Converter
- Fetches exchange rates from a REST API.
- Supports currency conversion.
- Displays converted values.
- Handles API errors and loading states.

### 5. User Interface
- Premium dark theme.
- Deep navy and indigo color palette.
- Glowing operator and equals buttons.
- Responsive layouts.
- Smooth animations.
- Button press animations.
- Haptic feedback.

---

## 🧪 Flutter Lab Experiment Mapping

This project covers all 10 Flutter lab experiments.

| No. | Experiment | Implementation in Project |
|---|---|---|
| 1(a) | Install Flutter and Dart SDK | Development environment setup |
| 1(b) | Dart Language Basics | Calculator operations using Dart |
| 2(a) | Explore Flutter Widgets | Text, Image, Container, Icon, Buttons |
| 2(b) | Layout Structures | Row, Column and Stack |
| 3(a) | Responsive UI | Mobile and tablet layouts |
| 3(b) | Media Queries | MediaQuery and LayoutBuilder |
| 4(a) | Navigation | Calculator, Scientific and History screens |
| 4(b) | Named Routes | Navigation using named routes |
| 5(a) | Stateful and Stateless Widgets | Dynamic calculator interface |
| 5(b) | State Management | setState and Provider |
| 6(a) | Custom Widgets | CalculatorButton, DisplayPanel, HistoryPanel |
| 6(b) | Themes and Styling | Custom dark theme and styles |
| 7(a) | Forms | Custom mathematical expression input |
| 7(b) | Form Validation | Expression validation and error handling |
| 8(a) | Flutter Animations | Animated calculator components |
| 8(b) | Animation Types | FadeTransition and SlideTransition |
| 9(a) | REST API Integration | Currency exchange rate API |
| 9(b) | Display API Data | Currency conversion interface |
| 10(a) | Unit Testing | Calculator logic and widget tests |
| 10(b) | Debugging | Flutter DevTools and Flutter Inspector |

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI development |
| Dart | Application programming language |
| Provider | State management |
| Math Expressions | Mathematical expression evaluation |
| REST API | Currency exchange rates |
| Google Fonts | Typography |
| Flutter Test | Unit and widget testing |

---

## 📁 Project Structure

```text
calculator_app/
│
├── lib/
│   ├── main.dart
│   │
│   ├── logic/
│   │   └── calculator_logic.dart
│   │
│   ├── screens/
│   │   ├── calculator_screen.dart
│   │   ├── scientific_screen.dart
│   │   ├── history_screen.dart
│   │   ├── currency_screen.dart
│   │   └── custom_calculation_screen.dart
│   │
│   ├── providers/
│   │   ├── calculator_provider.dart
│   │   └── history_provider.dart
│   │
│   ├── theme/
│   │   └── app_colors.dart
│   │
│   ├── widgets/
│   │   ├── calculator_button.dart
│   │   ├── display_panel.dart
│   │   └── history_panel.dart
│   │
│   └── services/
│       └── currency_api_service.dart
│
├── test/
│   ├── calculator_logic_test.dart
│   └── calculator_widget_test.dart
│
├── pubspec.yaml
└── README.md
```

---

## 🎨 Color Palette

| Element | Color | Hex Code |
|---|---|---|
| Background | Deep Navy | `#0D0D1A` |
| Surface | Dark Blue | `#1A1A2E` |
| Accent | Indigo | `#6C63FF` |
| Number Buttons | Dark Panel | `#1E1E30` |
| Primary Text | Off-white | `#E8E8F0` |
| Secondary Text | Muted Purple | `#9898B0` |
| Error | Coral Red | `#FF6B6B` |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or above).
- Dart SDK (included with Flutter).
- Android Studio / VS Code.
- Android Emulator or Physical Device.

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/YOUR_USERNAME/calculator_app.git
```

**2. Navigate to the project directory**

```bash
cd calculator_app
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Run the application**

```bash
flutter run
```

---

## 🧪 Testing

Execute unit and widget tests:

```bash
flutter test
```

Analyze the project for potential issues:

```bash
flutter analyze
```

---

## 📦 Build Application

**Android APK**

```bash
flutter build apk --release
```

**Windows**

```bash
flutter build windows --release
```

**iOS**

```bash
flutter build ios --release
```

---

## 📸 Application Screenshots

Add your application screenshots here after running the project.

| Standard Mode | Scientific Mode | History Panel |
|---|---|---|
| Add standard screenshot | Add scientific screenshot | Add history screenshot |

---

## 🎯 Project Objectives

- Understand Dart programming fundamentals.
- Explore Flutter widgets and layout structures.
- Develop responsive mobile interfaces.
- Implement screen navigation.
- Understand state management.
- Create reusable custom widgets.
- Implement form validation.
- Apply animations.
- Integrate REST APIs.
- Perform unit testing and debugging.

---

## 🔮 Future Enhancements

- Voice-based calculations.
- Custom themes and color selection.
- More scientific functions.
- Persistent calculation history.
- Additional currency support.
- Calculation export functionality.

---

## 👨‍💻 Developed With

**Flutter & Dart**

A practical Flutter application developed to demonstrate mobile application development concepts through a functional calculator.

**Project Type:** Flutter Lab Project
**Platform:** Android / iOS / Windows
**Language:** Dart
**Framework:** Flutter
