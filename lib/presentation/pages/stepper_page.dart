import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  final ScrollController stepperController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Page'),
      ),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          controller: stepperController,
          onStepContinue: () {
            setState(() {
              currentStep = (currentStep < 2) ? currentStep + 1 : 0;
            });
          },
          steps: [
            Step(
              title: Text(""),
              content: SizedBox.shrink(),
              label: Text("Pending"),
              stepStyle: StepStyle(
                color: currentStep == 0
                    ? Color.fromARGB(255, 19, 159, 184)
                    : Colors.grey,
              ),
            ),
            Step(
              title: Text(""),
              content: SizedBox.shrink(),
              label: Text("Collected"),
              stepStyle: StepStyle(
                color: currentStep == 1
                    ? Color.fromARGB(255, 19, 159, 184)
                    : Colors.grey,
              ),
            ),
            Step(
              title: Text(""),
              label: Text("Verified"),
              content: SizedBox.shrink(),
              stepStyle: StepStyle(
                color: currentStep == 2
                    ? Color.fromARGB(255, 19, 159, 184)
                    : Colors.grey,
              ),
            ),
          ],
          currentStep: currentStep,
        ),
      ),
    );
  }
}
