import 'package:flutter/material.dart';
import 'package:my_resume/widgets/decorations.dart';


class TransactionSlider extends StatefulWidget {
  @override
  _TransactionSliderState createState() => _TransactionSliderState();
}

class _TransactionSliderState extends State<TransactionSlider> {
  double transLimit = 1250;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Transaction Limit',
              style: TextStyle(
                  color: fCD, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '€ ' + transLimit.toStringAsFixed(0),
              style: TextStyle(
                  color: fCD, fontSize: 16, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green.shade300,
            inactiveTrackColor: fCL.withOpacity(0.25),
            trackHeight: 5,
            thumbColor: mCL,
            overlayColor: mCL.withOpacity(0.75),
          ),
          child: Slider(
            value: transLimit,
            min: 1,
            max: 3000,
            onChanged: (limitInput) {
              setState(() {
                transLimit = limitInput;
              });
            },
          ),
        )
      ],
    );
  }
}
