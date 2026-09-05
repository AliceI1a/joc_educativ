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
        feedbackColor = const Color(0xFF2A8C82);
      } else {
        feedback = 'Hai să numărăm din nou, de la 4: 5, 6, 7.';
        feedbackColor = const Color(0xFFE0693F);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDF3E7), Color(0xFFFBF6EC)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Câte mere sunt acum?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E2A24),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCEFEC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ...List.generate(4, (i) => const _Apple(color: Color(0xFFE0693F))),
                          ...List.generate(3, (i) => const _Apple(color: Color(0xFF8A5A0B))),
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
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF2E2A24),
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: const BorderSide(color: Color(0xFFE7DFCF), width: 1.5),
                                ),
                              ),
                              child: Text(
                                '$n',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 20,
                      child: feedback != null
                          ? Text(
                              feedback!,
                              style: TextStyle(color: feedbackColor, fontSize: 14, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Apple extends StatelessWidget {
  final Color color;
  const _Apple({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 34,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 3,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF6B4A2B),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            top: 2,
            right: 6,
            child: Transform.rotate(
              angle: -0.6,
              child: Container(
                width: 10,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF6FA85A),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 28,
              height: 26,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}