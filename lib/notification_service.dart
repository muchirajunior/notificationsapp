import 'package:flutter/material.dart';

class NotificationService{
  ///this shows a in app notification
  ///
  ///The [param] `context` is passed to show the dialog
  static  showAlertNotification(BuildContext context){
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
}