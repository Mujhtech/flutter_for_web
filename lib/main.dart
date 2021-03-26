import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_for_web/components/carousel.dart';
import 'package:flutter_for_web/components/cv_section.dart';
import 'package:flutter_for_web/components/education_section.dart';
import 'package:flutter_for_web/components/footer.dart';
import 'package:flutter_for_web/components/header.dart';
import 'package:flutter_for_web/components/portfolio_stat.dart';
import 'package:flutter_for_web/components/skill_section.dart';
import 'package:flutter_for_web/utils/globals.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_for_web/components/scroll_to_top.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Portfolio',
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: Color(0xFFBA0000),
          primaryColor: Colors.white,
          canvasColor: Color(0xFFBA0000),
          textTheme: TextTheme(
              headline6: TextStyle(fontFamily: "Chivo", color: Colors.white))),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Container(
          color: Color(0xFFBA0000),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget sectionWidget(int i) {
    if (i == 0) {
      return Column(children: [
        Header(),
        Carousel(),
        SizedBox(
          height: 20.0,
        )
      ]);
    } else if (i == 1) {
      return CvSection();
    } else if (i == 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: PortfolioStats(),
      );
    } else if (i == 3) {
      return Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          EducationSection(),
        ],
      );
    } else if (i == 4) {
      return SkillSection();
    } else if (i == 5) {
      return ScrollToTop(
        onPressed: () => Globals.scroll(0),
      );
    } else if (i == 6) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: () => Globals.scroll(headerItems[index].index),
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: RawScrollbar(
        controller: Globals.scrollController,
        thumbColor: Colors.white,
        thickness: 5.0,
        child: ScrollablePositionedList.builder(
          itemScrollController: Globals.itemScrollController,
          itemPositionsListener: Globals.itemPositionListener,
          itemCount: 8,
          itemBuilder: (context, index) {
            return sectionWidget(index);
          },
        ),
      ),
    );
  }
}
