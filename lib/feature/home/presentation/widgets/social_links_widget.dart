import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/social_link_entity.dart';
import '../utils/personal_information_icon_extension.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({
    super.key,
    required this.socialLinkEntityList,
  });

  final List<SocialLinkEntity> socialLinkEntityList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => launchUrl(
              Uri.parse(
                socialLinkEntityList[index].link,
              ),
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: FaIcon(
                socialLinkEntityList[index].icon.getIcon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: socialLinkEntityList.where((element) => element.showInHeader).length,
        ),
      ),
    );
  }
}
