import 'package:flutter/material.dart';
import 'package:my_resume/screens/web_view.dart';
import 'package:my_resume/widgets/decorations.dart';

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  final String webUrl;
  const NMButton({this.down, this.icon , this.webUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return WebViewPage(webUrl);
        }));
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: down ? nMboxInvert : nMbox,
        child: Icon(
          icon,
          color: down ? fCL : fCD,
        ),
      ),
    );
  }
}
