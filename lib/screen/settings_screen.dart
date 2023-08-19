import 'package:flutter/material.dart';
import 'package:flutter_random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber
                      .toInt()
                      .toString()
                      .split('')
                      .map(
                        (e) => Image.asset(
                          'asset/img/$e.png',
                          width: 50.0,
                          height: 70.0,
                        ),
                      )
                      .toList(),
                ),
              ),
              Slider(
                value: maxNumber,
                min: 1000,
                max: 100000,
                onChanged: (double val) {
                  setState(() {
                    maxNumber = val;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    maxNumber.toInt(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                ),
                child: const Text('저장!!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
