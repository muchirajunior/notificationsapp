import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notificationapp/main.dart';
import 'package:notificationapp/notification_screen.dart';

class NotificationService{
  ///this shows a in app notification
  ///
  ///The [param] `context` is passed to show the dialog
  static  showInAppNotification(){
    var context= MyApp.navigatorKey.currentContext!;
    showDialog(context: context, barrierDismissible: false, builder: (context)=>AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      titlePadding:  EdgeInsets.zero,
      title: Stack(
        children: [
          Image.network('https://t4.ftcdn.net/jpg/03/62/03/11/360_F_362031177_BBsdlV5luoG2s2e2GL17K41mZNYt9CiB.jpg', fit: BoxFit.fitWidth,),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              child: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.close)),
            ),
          )
        ],
      ),
      content: const ListTile(
        title: Text("HELLO USER !", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        subtitle: Text('This is as long as this text is readable to the user it is amazing. we will try to keep this content short meanwhile for readability'),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width*.5,
          height: 40,
           child: FilledButton(onPressed: ()=>Navigator.pop(context), child: const Text('accept'))
          )
      ],
    ));
  }

  ///awesome nofification 
  static Future initializeAwesomeNotifications()async{
    await AwesomeNotifications().initialize(
      null, //'resource://drawable/res_app_icon',//
        [
          NotificationChannel(
            channelKey: 'alerts',
            channelName: 'Alerts',
            channelDescription: 'Notification tests as alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.deepPurple
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel',
              channelGroupName: 'Basic group')
        ],
        debug: true
      );
    
    await AwesomeNotifications().isNotificationAllowed().then((value) async{
      if(!value){
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    //these are not necessary 
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
      onNotificationCreatedMethod: _onNotificationCreatedMethod,
      onDismissActionReceivedMethod: _onDismissActionReceivedMethod,
      onNotificationDisplayedMethod: _onNotificationDisplayedMethod
    );

  }

  static Future _onActionReceivedMethod(ReceivedAction action)async{
    MyApp.navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>NotificationScreen(payload:action.payload! )));
    debugPrint(action.body);
  }

  static Future _onNotificationCreatedMethod(ReceivedNotification notification)async{
    debugPrint(notification.body);
  }

  static Future _onDismissActionReceivedMethod(ReceivedAction action)async{
    debugPrint(action.body);
  }

  static Future _onNotificationDisplayedMethod(ReceivedNotification notification)async{
    debugPrint(notification.body);
  }

  static Future createNotification()async{
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          bigPicture: 'https://t4.ftcdn.net/jpg/03/62/03/11/360_F_362031177_BBsdlV5luoG2s2e2GL17K41mZNYt9CiB.jpg',
          channelKey: 'alerts',
          actionType: ActionType.Default,
          title: 'Hello World!',
          body: 'This is my first notification!',
          payload: { 'message':'this an awesome notofication' }
      )
    );
  }

  

}