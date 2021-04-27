import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class AuthStore {
  AuthStore();

  @observable
  String userGoogleID;

  @observable
  String userPhoneID;

  @action
  Future<void> sendOtp() async {}
}
