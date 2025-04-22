import 'package:flutter/material.dart';

class StepperPage extends StatelessWidget {
  const StepperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Page'),
      ),
      body: Center(
        child: Stepper(
            type: StepperType.horizontal,
            steps: [
              Step(
                title: Text(""),
                content: Container(),
                label: Text("Step 1"),
              ),
              Step(
                title: Text(""),
                content: Container(),
                label: Text("Step 2"),
              ),
              Step(
                title: Text(""),
                label: Text("Step 3"),
                content: Container(),
              ),
              Step(
                title: Text(""),
                label: Text("Step 4"),
                content: Container(),
              ),
            ],
            currentStep: 0),
      ),
    );
  }
}
