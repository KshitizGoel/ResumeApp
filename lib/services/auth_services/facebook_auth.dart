  import 'package:injectable/injectable.dart';

@Singleton()
class FacebookAuth {
  // Future<String> facebookSignIn() async {
  //   String loginStatus = '';
  //
  //   final FacebookLogin facebookSignIn = new FacebookLogin();
  //
  //   final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  //
  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       final FacebookAccessToken accessToken = result.accessToken;
  //
  //       loginStatus = '''
  //        Logged in!
  //        Token: ${accessToken.token}
  //        User id: ${accessToken.userId}
  //        Expires: ${accessToken.expires}
  //        Permissions: ${accessToken.permissions}
  //        Declined permissions: ${accessToken.declinedPermissions}
  //        ''';
  //       return loginStatus;
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       loginStatus = 'Login cancelled by the user.';
  //       return loginStatus;
  //       break;
  //     case FacebookLoginStatus.error:
  //       loginStatus = 'Something went wrong with the login process.\n'
  //           'Here\'s the error Facebook gave us: ${result.errorMessage}';
  //
  //       return loginStatus;
  //       break;
  //   }
  //
  //   return loginStatus;
  // }

  Future <String> facebookSignIn() async{
    return "Facebook Sign In in progress!!!!";
  }
}
