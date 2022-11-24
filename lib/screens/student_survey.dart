import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:survey_kit/survey_kit.dart';

class StudentSurvey extends StatelessWidget {
  var steps = [
    InstructionStep(
      title: 'Your journey starts here',
      text: 'Have fun with a quick survey',
      buttonText: 'Start survey',
    ),
    QuestionStep(
      title: 'Sample title',
      text: 'Sample text',
      answerFormat: TextAnswerFormat(
        maxLines: 5,
      ),
    ),
    CompletionStep(
        title: 'You are done',
        text: 'You have finished !!!',
        buttonText: 'Submit survey',
        stepIdentifier: StepIdentifier(id: '1'))
  ];
  
  @override
  Widget build(BuildContext context) {var task = OrderedTask(id: TaskIdentifier(id: '1'), steps: steps);
    return Scaffold(
        body: SurveyKit(
      onResult: (p0) {},
      task: task,
    ));
  }
}
