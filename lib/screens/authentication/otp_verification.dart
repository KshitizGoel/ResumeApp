import 'package:flutter/material.dart';
import 'package:my_resume/services/firebase/phone_auth.dart';
import 'package:my_resume/widgets/decorations.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  TextEditingController otpCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Text("Verification"),
            Text(
              "Mobile Number",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text("OTP"),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFFEFF3F6),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0),
                      BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0)
                    ]),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: TextField(
                    autofocus: true,
                    controller: otpCodeController,
                    keyboardType: TextInputType.phone,
                    decoration:
                    InputDecoration(border: InputBorder.none, hintText: "Enter 6 digit OTP code"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: (){
                  verifyingTheOTP(otpCodeController.text.toString());
                },
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )),
                  decoration: BoxDecoration(
                      color: fCL,
                      borderRadius: BorderRadius.circular(100.0),
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
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
