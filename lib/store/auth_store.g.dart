// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$userGoogleIDAtom = Atom(name: '_AuthStore.userGoogleID');

  @override
  String get userGoogleID {
    _$userGoogleIDAtom.reportRead();
    return super.userGoogleID;
  }

  @override
  set userGoogleID(String value) {
    _$userGoogleIDAtom.reportWrite(value, super.userGoogleID, () {
      super.userGoogleID = value;
    });
  }

  final _$userPhoneIDAtom = Atom(name: '_AuthStore.userPhoneID');

  @override
  String get userPhoneID {
    _$userPhoneIDAtom.reportRead();
    return super.userPhoneID;
  }

  @override
  set userPhoneID(String value) {
    _$userPhoneIDAtom.reportWrite(value, super.userPhoneID, () {
      super.userPhoneID = value;
    });
  }

  final _$facebookIDAtom = Atom(name: '_AuthStore.facebookID');

  @override
  String get facebookID {
    _$facebookIDAtom.reportRead();
    return super.facebookID;
  }

  @override
  set facebookID(String value) {
    _$facebookIDAtom.reportWrite(value, super.facebookID, () {
      super.facebookID = value;
    });
  }

  final _$sendOtpAsyncAction = AsyncAction('_AuthStore.sendOtp');

  @override
  Future<Null> sendOtp(String phoneNumber) {
    return _$sendOtpAsyncAction.run(() => super.sendOtp(phoneNumber));
  }

  final _$verifyTheOtpAsyncAction = AsyncAction('_AuthStore.verifyTheOtp');

  @override
  Future<void> verifyTheOtp(String verificationCode) {
    return _$verifyTheOtpAsyncAction
        .run(() => super.verifyTheOtp(verificationCode));
  }

  final _$googleSignInAsyncAction = AsyncAction('_AuthStore.googleSignIn');

  @override
  Future<void> googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  final _$facebookLoginAsyncAction = AsyncAction('_AuthStore.facebookLogin');

  @override
  Future<String> facebookLogin() {
    return _$facebookLoginAsyncAction.run(() => super.facebookLogin());
  }

  @override
  String toString() {
    return '''
userGoogleID: ${userGoogleID},
userPhoneID: ${userPhoneID},
facebookID: ${facebookID}
    ''';
  }
}
