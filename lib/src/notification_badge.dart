import 'package:flutter/material.dart';

class NotificationBadge extends StatefulWidget {
  int? totalNotification;
  NotificationBadge({super.key,this.totalNotification});

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle
        ),
        child: Center(child: Text("${widget.totalNotification}")),


      );
  }
}
