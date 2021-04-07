import 'package:flutter/material.dart';
import 'package:my_resume/widgets/widgets.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('VISA', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Icon(Icons.more_horiz, color: fCD,),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('8014', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Card Holder', style: TextStyle(color: fCL, fontSize: 12, fontWeight: FontWeight.w700)),
                  Text('Lindsey Johnson', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Expires', style: TextStyle(color: fCL, fontSize: 12, fontWeight: FontWeight.w700)),
                  Text('08 / 21', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;
  const NMCard({this.active, this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          Icon(icon, color: fCL),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                color: fCD, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Spacer(),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 40,
            child: Container(
              margin: active
                  ? EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          ),
        ],
      ),
    );
  }
}