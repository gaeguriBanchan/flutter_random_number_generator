import 'package:flutter/material.dart';
import 'package:flutter_random_number_generator/components/number_row.dart';
import 'package:flutter_random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.maxNumber});

  final int maxNumber;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    onSliderChanged(double val) {
      setState(() {
        maxNumber = val;
      });
    }

    onButtonPressed() {
      Navigator.of(context).pop(
        maxNumber.toInt(),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                  maxNumber: maxNumber,
                  onSliderChanged: onSliderChanged,
                  onButtonPressed: onButtonPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.maxNumber,
    required this.onSliderChanged,
    required this.onButtonPressed,
  });

  final double maxNumber;
  final ValueChanged<double> onSliderChanged;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
          ),
          child: const Text('저장!!'),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.maxNumber,
  });

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}
