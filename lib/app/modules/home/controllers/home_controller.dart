import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pushnotification/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var tokenused = ''.obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    // deeplinkController.initDynamicLink();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                  "channel.id 01", "channel.name",
                  color: Colors.white, icon: '@mipmap/ic_launcher'),
            ));
      }
    });
    super.onInit();
  }

  void sendPushMessage() async {
    print('Sent Message');
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA45-QD8c:APA91bGeGZk0WcFjZNrNkUqbVN5YM0r60qFJ-NgYO4_5KyKQ-e5p8JAQOwdilrt50zo3oemM5Y81LR_TCSlIb2goe5wwQIbu_WFU3lGdCcnSJSQDe72zWaX0dNDWHYX7kQidYaeWrq7V',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'You recieved a Payment from Farhan',
              'title': 'Gifts',
            },
            'priority': 'high',

            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to":
                'c_c_GOfJREirQNNPaY4yZi:APA91bE-EFs2nB6RHklmfImnGv6MI5vjeo2emz5HBOXkp2hPKCPk7xrRKbPP1LKmsPChFTzS95DidVBigzVtnxSuXJRrmuDTMaoNjA3eerrQh9M0m_qDbU8BVYMKSf-gSFptKc5RbiSJ'
            // tokenforperson,
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }
}
