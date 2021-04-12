import 'package:flutter/material.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class ExperienceSet extends StatefulWidget {
  @override
  _ExperienceSetState createState() => _ExperienceSetState();
}

class _ExperienceSetState extends State<ExperienceSet> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mC,
      body: ListView(
        children: [
          SizedBox(
            height: 75,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomTexts('My Work Experiences', true, 25, fCD),
              )),
          SizedBox(
            height: 25,
          ),
          timelineStepper(context)
        ],
      ),
    );
  }
  int _currentStep = 3;

  Widget timelineStepper(BuildContext context) {
    return Theme(
      data: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.light(primary: Colors.indigoAccent)),
      child: Stepper(
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 10,
                )
              ],
            ),
          );
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep >= 4) return;
          setState(() {
            _currentStep += 1;
          });
        },
        onStepCancel: () {
          if (_currentStep <= 0) return;
          setState(() {
            _currentStep -= 1;
          });
        },
        onStepTapped: (pos) {
          setState(() {
            _currentStep = pos;
          });
        },
        steps: <Step>[
          Step(
              isActive: true,
              state: StepState.complete,
              title: Text(
                'Completed - 14, Apr',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        customAvatars(),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Assigned to",
                                  style:
                                  TextStyle(fontWeight: FontWeight.w500)),
                              Text("Kshitiz Goel",
                                  style:
                                  TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                    taskInformation()
                  ],
                ),
              )),
          Step(
            isActive: true,
            state: StepState.complete,
            title: Text(
              'Completed - 16, Apr',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      customAvatars(),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Assigned to",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("Robert Downey",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                  ),
                  taskInformation()
                ],
              ),
            ),
          ),
          Step(
            isActive: true,
            state: StepState.complete,
            title: Text(
              "Task Removed",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            content: Container(),
          ),
          Step(
            isActive: true,
            title: Text(
              'Working (due date - 24 Apr)',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            state: StepState.editing,
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      customAvatars(),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Assigned to",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("Kshitiz Goel",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                  ),
                  taskInformation()
                ],
              ),
            ),
          ),
          Step(
            isActive: true,
            state: StepState.indexed,
            title: Text(
              'Upcoming Task',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      customAvatars(),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Assign to",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("Nat Bentlee",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                  ),
                  taskInformation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget taskInformation() {
    return TimeLineCard(Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
            " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
            style: TextStyle(fontWeight: FontWeight.w500, color: fCL))));
  }

  Widget customAvatars() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            image: AssetImage("assets/images/profile_image.jpg"),
            fit: BoxFit.fill),
      ),
    );
  }
}
