import 'package:flutter/material.dart';

Color mC = Colors.grey[900];
Color mCL = Colors.grey[850];
Color mCD = Colors.black.withOpacity(0.1090);
Color fCD = Colors.white;
Color fCL = Colors.blue[400].withOpacity(0.95);
Color fCR = Colors.red[700].withOpacity(0.65);
Color fCT = Colors.blue[300 ].withOpacity(0.95);
Color fCB = Colors.blue[600].withOpacity(0.95);
Color solidGreen = Colors.green.withOpacity(0.65);
Color hCT = Colors.white;
Color cAuth = Colors.white60;



BoxDecoration nMbox = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mC,
    boxShadow: [
      BoxShadow(
        color: mCD,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: mCL,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);

BoxDecoration nMboxInvert = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mCD,
    boxShadow: [
      BoxShadow(
          color: mCL,
          offset: Offset(3, 3),
          blurRadius: 3,
          spreadRadius: -3
      ),
    ]
);

BoxDecoration nMEduboxInvert = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mCD,
    boxShadow: [
      BoxShadow(
          color: mCL,
          offset: Offset(1, 1),
          blurRadius: 1,
          spreadRadius: -1
      ),
    ]
);

BoxDecoration profileBox = BoxDecoration(
     shape: BoxShape.circle,
    color: mC,
    border: Border.all(
      width: 2,
      color: mC
    ),
    boxShadow: [
      BoxShadow(
        color: mCD,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: mCL,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);

BoxDecoration eduBox = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mC,
    boxShadow: [
      BoxShadow(
        color: mCD,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: mCL,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);

BoxDecoration profileBoxInvert = BoxDecoration(
     color: mCD,
     shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
          color: mCL,
          offset: Offset(3, 3),
          blurRadius: 3,
          spreadRadius: -3
      ),
    ]
);


BoxDecoration eduBoxInvert = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: mCD,
    boxShadow: [
      BoxShadow(
          color: mCL,
          offset: Offset(3, 3),
          blurRadius: 3,
          spreadRadius: -3
      ),
    ]
);



BoxDecoration nMbtn = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: mC,
    boxShadow: [
      BoxShadow(
        color: mCD,
        offset: Offset(2, 2),
        blurRadius: 2,
      )
    ]
);