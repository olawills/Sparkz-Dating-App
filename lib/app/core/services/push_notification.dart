import 'package:dating_app/app/core/services/auth_local_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebasePushNotificationServce {
  FirebasePushNotificationServce._();
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static void init() {
    // ** get notification token
    firebaseMessaging.getToken().then((value) async {
      debugPrint("getToken :$value");
      await LocalDataStorage.instance.saveNotificationMessage(value!);
    });
  }
}
