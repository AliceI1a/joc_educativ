import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  String? feedback;
  Color feedbackColor = Colors.black54;
  bool answered = false;

  void checkAnswer(int value) {
    setState(() {
      answered = true;
      if (value == 7) {
        feedback = 'Da! 4 mere și încă 3 fac 7 mere.';
        feedbackColor = Colors.green.shade700;
      } else {
        feedback = 'Hai să numărăm din nou, de la 4: 5, 6, 7.';
        feedbackColor = Colors.orange.shade800;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Câte mere sunt acum?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCEFEC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Wrap(
                  spacing: 8,
                  children: [
                    ...List.generate(4, (i) => _apple(const Color(0xFFE0693F))),
                    ...List.generate(3, (i) => _apple(const Color(0xFF8A5A0B))),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [6, 7, 4].map((n) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: answered ? null : () => checkAnswer(n),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        child: Text('$n', style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (feedback != null)
                Text(
                  feedback!,
                  style: TextStyle(color: feedbackColor, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _apple(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}