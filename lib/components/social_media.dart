import 'package:flutter/material.dart';
import 'package:flutter_for_web/models/social_media.dart';
import 'package:flutter_for_web/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<SocialMedia> socialMediaItems = [
  SocialMedia(
      socialLink: "https://github.com/mujhtech",
      socialIcon: FontAwesomeIcons.github),
  SocialMedia(
      socialLink: "https://twitter.com/mmujhtech",
      socialIcon: FontAwesomeIcons.twitter),
  SocialMedia(
      socialLink: "https://facebook.com/mujeeb.muhideen",
      socialIcon: FontAwesomeIcons.facebook),
  SocialMedia(
      socialLink:
          "https://www.linkedin.com/in/muhideen-mujeeb-adeoye-42378a15b",
      socialIcon: FontAwesomeIcons.linkedin),
];

class SocialMediaItemBtn extends StatelessWidget {
  const SocialMediaItemBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialMediaItems
          .map((item) => Padding(
                padding: EdgeInsets.all(2),
                child: IconButton(
                    icon: FaIcon(item.socialIcon),
                    iconSize: 20,
                    onPressed: () => launchURL(item.socialLink),
                    hoverColor: Colors.white),
              ))
          .toList(),
    );
  }
}
