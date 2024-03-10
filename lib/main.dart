import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'invite_user_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CallPage(callID: '',),
    );
  }
}
class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call'),
        actions: [
          InviteUserWidget(
            onUserSelected: (userId, userName) {
              // Initiate the invitation process using Zego SDK
              print('Inviting user: $userId, $userName');
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return ZegoUIKitPrebuiltCall(
            appID: 48360799, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign: '04bb0772e7ba5aa8df4ff5c9e50bb807b6614cac810c6c7b1804f3cea3285e8f', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: '12345',
            userName: 'Sirajul',
            callID: "12",
            // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
          );
        }
      )
    );
  }
}
