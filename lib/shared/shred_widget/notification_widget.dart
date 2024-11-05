import 'package:flutter/material.dart';
import 'package:olx/app_settings/views/notification_screen.dart';
import 'package:olx/shared/shared_theme/app_colors.dart';



class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.orangeColor,
          shape: BoxShape.circle
        ),
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Icon(Icons.notifications, color: AppColors.whiteColor, size: 20.0)
      ),
    );
  }
}