import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(
          'images/profile_photo.png',
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
