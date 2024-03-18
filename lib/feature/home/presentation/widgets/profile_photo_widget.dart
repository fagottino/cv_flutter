import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 20,
      ),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          'images/profile_photo.png',
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
