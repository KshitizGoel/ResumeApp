import 'package:flutter/material.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:provider/provider.dart';
import 'package:my_resume/screens/home.dart';
import 'package:my_resume/store/auth_store.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController otpCodeController = TextEditingController();

  late AuthStore authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authStore = Provider.of<AuthStore>(context);
  }

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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter 6 digit OTP code"),
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
                onTap: () {
                  //May or May not work.....

                  authStore.verifyTheOtp(otpCodeController.text.toString());

                  // This is supposed to be
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HomeScreen(0);
                  }));
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
