import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_for_web/components/social_media.dart';
import 'package:flutter_for_web/models/footer_item.dart';
import 'package:flutter_for_web/utils/constants.dart';
import 'package:flutter_for_web/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: Icons.home,
    title: "ADDRESS",
    text1: "Federal University of Technology,\nMinna",
  ),
  FooterItem(
    iconPath: Icons.email,
    title: "EMAIL",
    text1: "mujeeb.muhideen@gmail.com",
  ),
  FooterItem(
    iconPath: Icons.phone,
    title: "WHATSAPP",
    text1: "+234 7063148208",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  footerItem.iconPath,
                                  color: Color(0xFFBA0000),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  footerItem.title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFBA0000),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "${footerItem.text1}",
                                  style: TextStyle(
                                    color: Color(0xFFBA0000),
                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021. All rights Reserved",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SocialMediaItemBtn()
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
