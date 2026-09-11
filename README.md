# 🧮 Calculator App — Flutter

A beautifully designed, fully functional **Calculator App** built with Flutter & Dart. Features a premium dark UI, smooth animations, standard and scientific modes, and calculation history.

---

## ✨ Features

### Standard Mode
- ➕ Addition, Subtraction, Multiplication, Division
- 💯 Percentage calculation
- ±  Sign toggle (positive/negative)
- ⌫ Backspace / Delete
- 🔢 Decimal point input
- ♾️ Chain calculations (press operator without `=`)

### Scientific Mode
- **Trigonometry**: sin, cos, tan, sin⁻¹, cos⁻¹, tan⁻¹
- **Logarithms**: log (base 10), ln (natural log)
- **Powers**: x², x³, eˣ, 10ˣ
- **Roots**: √x (square root), ∛x (cube root)
- **Special**: 1/x (reciprocal), x! (factorial), |x| (absolute value)
- **Constants**: π (Pi), e (Euler's number)
- **Angle Mode**: Switch between DEG and RAD

### UI / UX
- 🌙 Premium dark theme with deep indigo/purple palette
- ✨ Glowing operator & equals buttons
- 🔢 Auto-scaling display text (never overflows)
- 📊 Thousand separators in display
- 🕐 Calculation history (last 50 operations)
- 🎞️ Smooth animations: button press, display transitions, history slide-in
- 📱 Responsive layout for all screen sizes
- 📳 Haptic feedback on every button press

---

## 📁 Project Structure

```
calculator_app/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── logic/
│   │   └── calculator_logic.dart    # All calculation logic
│   ├── screens/
│   │   └── calculator_screen.dart   # Main screen (Standard + Scientific)
│   ├── theme/
│   │   └── app_colors.dart          # Color palette & gradients
│   └── widgets/
│       ├── calculator_button.dart   # Animated button component
│       ├── display_panel.dart       # Display with expression & value
│       └── history_panel.dart       # Slide-in history panel
├── test/
│   └── calculator_logic_test.dart   # Unit tests
└── pubspec.yaml
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (≥ 3.0.0)
- Dart SDK (included with Flutter)
- Android Studio / Xcode / VS Code

### Installation

```bash
# Navigate to the project folder
cd "c:\Flutter Lab\calculator_app"

# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run
```

### Run Tests

```bash
flutter test
```

### Build for Release

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Windows
flutter build windows --release
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `google_fonts` | ^6.2.1 | Beautiful typography |
| `math_expressions` | ^2.4.0 | Expression parsing |
| `flutter_lints` | ^3.0.0 | Code quality |

---

## 🎨 Color Palette

| Role | Color | Hex |
|------|-------|-----|
| Background | Deep Navy | `#0D0D1A` |
| Surface | Dark Blue | `#1A1A2E` |
| Accent / Operators | Indigo | `#6C63FF` |
| Number Buttons | Dark Panel | `#1E1E30` |
| Text Primary | Off-white | `#E8E8F0` |
| Text Secondary | Muted Purple | `#9898B0` |
| Error | Coral Red | `#FF6B6B` |

---

## 📸 Screenshots

> Run the app to see the full experience!

- **Standard Mode** — Classic 4×5 button grid
- **Scientific Mode** — Extended 4×10 scrollable grid
- **History Panel** — Slides in from the right

---

*Built with ❤️ using Flutter & Dart*
