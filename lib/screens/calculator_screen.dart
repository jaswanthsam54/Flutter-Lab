import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logic/calculator_logic.dart';
import '../theme/app_colors.dart';
import '../widgets/calculator_button.dart';
import '../widgets/display_panel.dart';
import '../widgets/history_panel.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with TickerProviderStateMixin {
  final CalculatorLogic _logic = CalculatorLogic();
  bool _showHistory = false;
  bool _isScientific = false;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _slideAnimation = CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOutCubic,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleButton(String label, {VoidCallback? action}) {
    HapticFeedback.lightImpact();
    _pulseController.forward().then((_) => _pulseController.reverse());
    setState(() {
      if (action != null) {
        action();
      }
    });
  }

  void _onDigit(String d) => _handleButton(d, action: () => _logic.inputDigit(d));
  void _onDecimal() => _handleButton('.', action: () => _logic.inputDecimal());
  void _onToggleSign() => _handleButton('+/-', action: () => _logic.toggleSign());
  void _onPercent() => _handleButton('%', action: () => _logic.percentage());

  void _onOperation(CalculatorOperation op, String label) =>
      _handleButton(label, action: () => _logic.setOperation(op));

  void _onEquals() => _handleButton('=', action: () => _logic.calculate());
  void _onClear() => _handleButton('C', action: () => _logic.clear());

  void _onDelete() =>
      _handleButton('⌫', action: () => _logic.delete());

  void _onScientific(String func) =>
      _handleButton(func, action: () => _logic.scientificFunction(func));

  void _toggleHistory() {
    setState(() => _showHistory = !_showHistory);
    if (_showHistory) {
      _slideController.forward();
    } else {
      _slideController.reverse();
    }
  }

  void _toggleMode() {
    setState(() {
      _isScientific = !_isScientific;
      _logic.isScientificMode = _isScientific;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // Top bar
                  _buildTopBar(),

                  // Display
                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: DisplayPanel(
                      expression: _logic.expression,
                      displayValue: _logic.displayValue,
                      currentOperation: _logic.currentOperation,
                    ),
                  ),

                  // Buttons
                  Expanded(
                    child: _isScientific
                        ? _buildScientificLayout()
                        : _buildStandardLayout(),
                  ),
                ],
              ),

              // History overlay
              AnimatedBuilder(
                animation: _slideAnimation,
                builder: (context, child) {
                  return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: !_showHistory,
                      child: Opacity(
                        opacity: _slideAnimation.value,
                        child: Transform.translate(
                          offset: Offset(
                              screenSize.width * (1 - _slideAnimation.value),
                              0),
                          child: HistoryPanel(
                            history: _logic.history,
                            onClose: _toggleHistory,
                            onClear: () =>
                                setState(() => _logic.clearHistory()),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Mode toggle
          GestureDetector(
            onTap: _toggleMode,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: _isScientific
                    ? AppGradients.primaryGradient
                    : null,
                color: _isScientific ? null : AppColors.functionBtn,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isScientific
                      ? Colors.transparent
                      : AppColors.accentText.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isScientific ? Icons.calculate : Icons.science,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _isScientific ? 'Standard' : 'Scientific',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Angle mode (only in scientific)
          if (_isScientific)
            GestureDetector(
              onTap: () => setState(() {
                _logic.angleMode = _logic.angleMode == AngleMode.degrees
                    ? AngleMode.radians
                    : AngleMode.degrees;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.functionBtn,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.accentText.withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child: Text(
                  _logic.angleMode == AngleMode.degrees ? 'DEG' : 'RAD',
                  style: const TextStyle(
                    color: AppColors.accentText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

          // History button
          GestureDetector(
            onTap: _toggleHistory,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.functionBtn,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accentText.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.history_rounded,
                color: AppColors.accentText,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardLayout() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildRow([
            _actionBtn('C', AppColors.error.withOpacity(0.8), onTap: _onClear),
            _actionBtn('+/-', AppColors.specialBtn, onTap: _onToggleSign),
            _actionBtn('%', AppColors.specialBtn, onTap: _onPercent),
            _opBtn('÷', CalculatorOperation.divide),
          ]),
          const SizedBox(height: 10),
          _buildRow([
            _numBtn('7'),
            _numBtn('8'),
            _numBtn('9'),
            _opBtn('×', CalculatorOperation.multiply),
          ]),
          const SizedBox(height: 10),
          _buildRow([
            _numBtn('4'),
            _numBtn('5'),
            _numBtn('6'),
            _opBtn('−', CalculatorOperation.subtract),
          ]),
          const SizedBox(height: 10),
          _buildRow([
            _numBtn('1'),
            _numBtn('2'),
            _numBtn('3'),
            _opBtn('+', CalculatorOperation.add),
          ]),
          const SizedBox(height: 10),
          _buildRow([
            _actionBtn('⌫', AppColors.deleteBtn, onTap: _onDelete),
            _numBtn('0'),
            _actionBtn('.', AppColors.numberBtn, onTap: _onDecimal),
            _equalsBtn(),
          ]),
        ],
      ),
    );
  }

  Widget _buildScientificLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Scientific row 1
          _buildRow([
            _sciBtn('sin'),
            _sciBtn('cos'),
            _sciBtn('tan'),
            _sciBtn('π'),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _sciBtn('asin'),
            _sciBtn('acos'),
            _sciBtn('atan'),
            _sciBtn('e'),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _sciBtn('sqrt'),
            _sciBtn('cbrt'),
            _sciBtn('log'),
            _sciBtn('ln'),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _sciBtn('square'),
            _sciBtn('cube'),
            _sciBtn('exp'),
            _sciBtn('10x'),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _sciBtn('abs'),
            _sciBtn('factorial'),
            _sciBtn('reciprocal'),
            _opBtn('÷', CalculatorOperation.divide),
          ]),
          const SizedBox(height: 8),
          // Standard rows
          _buildRow([
            _actionBtn('C', AppColors.error.withOpacity(0.8), onTap: _onClear),
            _actionBtn('+/-', AppColors.specialBtn, onTap: _onToggleSign),
            _actionBtn('%', AppColors.specialBtn, onTap: _onPercent),
            _opBtn('×', CalculatorOperation.multiply),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _numBtn('7'),
            _numBtn('8'),
            _numBtn('9'),
            _opBtn('−', CalculatorOperation.subtract),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _numBtn('4'),
            _numBtn('5'),
            _numBtn('6'),
            _opBtn('+', CalculatorOperation.add),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _numBtn('1'),
            _numBtn('2'),
            _numBtn('3'),
            _equalsBtn(),
          ]),
          const SizedBox(height: 8),
          _buildRow([
            _actionBtn('⌫', AppColors.deleteBtn, onTap: _onDelete),
            _numBtn('0'),
            _actionBtn('.', AppColors.numberBtn, onTap: _onDecimal),
            _actionBtn('', Colors.transparent), // placeholder
          ]),
        ],
      ),
    );
  }

  Widget _buildRow(List<Widget> buttons) {
    return Row(
      children: buttons.map((btn) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: btn,
          ),
        );
      }).toList(),
    );
  }

  Widget _numBtn(String digit) {
    return CalculatorButton(
      label: digit,
      backgroundColor: AppColors.numberBtn,
      textColor: AppColors.primaryText,
      onTap: () => _onDigit(digit),
      isHighlighted: false,
    );
  }

  Widget _opBtn(String symbol, CalculatorOperation op) {
    final isActive = _logic.currentOperation == op;
    return CalculatorButton(
      label: symbol,
      backgroundColor:
          isActive ? AppColors.operatorBtn.withOpacity(0.5) : AppColors.operatorBtn,
      textColor: Colors.white,
      onTap: () => _onOperation(op, symbol),
      isHighlighted: isActive,
      hasGlow: isActive,
    );
  }

  Widget _actionBtn(String label, Color color, {VoidCallback? onTap}) {
    return CalculatorButton(
      label: label,
      backgroundColor: color,
      textColor: label == 'C' ? AppColors.error : AppColors.primaryText,
      onTap: onTap ?? () {},
      isHighlighted: false,
      fontSize: label.length > 1 ? 18 : 24,
    );
  }

  Widget _equalsBtn() {
    return CalculatorButton(
      label: '=',
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
      onTap: _onEquals,
      isHighlighted: true,
      hasGlow: true,
      isGradient: true,
    );
  }

  String _sciLabel(String func) {
    switch (func) {
      case 'sqrt': return '√x';
      case 'cbrt': return '∛x';
      case 'square': return 'x²';
      case 'cube': return 'x³';
      case 'reciprocal': return '1/x';
      case 'factorial': return 'x!';
      case 'exp': return 'eˣ';
      case '10x': return '10ˣ';
      case 'asin': return 'sin⁻¹';
      case 'acos': return 'cos⁻¹';
      case 'atan': return 'tan⁻¹';
      case 'pi': return 'π';
      case 'abs': return '|x|';
      default: return func;
    }
  }

  Widget _sciBtn(String func) {
    return CalculatorButton(
      label: _sciLabel(func),
      backgroundColor: AppColors.functionBtn,
      textColor: AppColors.accentText,
      onTap: func == 'π'
          ? () => _onScientific('pi')
          : func == 'e'
              ? () => _onScientific('e')
              : () => _onScientific(func),
      isHighlighted: false,
      fontSize: 15,
    );
  }
}
