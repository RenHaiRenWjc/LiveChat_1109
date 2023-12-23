import 'package:com.jc.livechat/pages/main/MainController.dart';
import 'package:com.jc.livechat/pages/splash/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../GlobalConstant/ColorConst.dart';
import 'message/ConversationPage.dart';

class MainPage extends GetView<MainController> {
  final _bottomNavList = ["首页", "消息", "我的"];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (logic) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: logic.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorConst.wyMainColor,
            unselectedItemColor: HexColor("#78777F"),
            selectedFontSize: 30,
            unselectedFontSize: 30,
            onTap: (index) {
              _pageController.jumpToPage(index);
              logic.onBottomTap(index);
            },
            items: [
              BottomNavigationBarItem(label: _bottomNavList[0], icon: logic.currentIndex == 0 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
              BottomNavigationBarItem(label: _bottomNavList[1], icon: logic.currentIndex == 1 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
              BottomNavigationBarItem(label: _bottomNavList[2], icon: logic.currentIndex == 2 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
            ],
          ),
          body: _currentPage(),
        );
      },
    );
  }

  // 底部导航对应的页面
  Widget _currentPage() {
    var pages = [
      ConversationPage(),
      SplashPage(),
      SplashPage(),
    ];
    return PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: (int index) {
          controller.onBottomTap(index);
        },
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index]);
  }

  Widget _bottomIcon(path) {
    return Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Image.asset(
          path,
          width: 25,
          height: 25,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ));
  }
}
