import 'package:flutter/material.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: (){
                //Hidden Drawer
              },
                child: NMButton(down: true, icon: Icons.menu)),
            Text(
              'Main Card',
              style: TextStyle(
                  color: fCD, fontSize: 30, fontWeight: FontWeight.w700),
            ),
            CreditCard(),
            NMCard(
              active: false,
              icon: Icons.wifi,
              label: 'NFC Payment',
            ),
            NMCard(
              active: true,
              icon: Icons.attach_money,
              label: 'Deposit',
            ),
            NMCard(
              active: true,
              icon: Icons.lock_outline,
              label: 'Fast blocking',
            ),
            TransactionSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(
                  down: false,
                  icon: Icons.home,
                ),
                NMButton(
                  down: true,
                  icon: Icons.credit_card,
                ),
                NMButton(
                  down: false,
                  icon: Icons.trending_up,
                ),
                NMButton(
                  down: false,
                  icon: Icons.notifications_none,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
