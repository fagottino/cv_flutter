import 'package:flutter/material.dart';

import '../../domain/entities/driving_license_entity.dart';

class DrivingLicenseWidget extends StatelessWidget {
  const DrivingLicenseWidget({
    super.key,
    required this.drivingLicenseEntityList,
  });

  final List<DrivingLicenseEntity> drivingLicenseEntityList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titolo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 1,
                child: SizedBox(
                  width: 70,
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Patenti'.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        drivingLicenseEntityList.map((e) => e.value).toList().join(' | '),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
