import 'package:com.jc.livechat/pages/main/MainController.dart';
import 'package:com.jc.livechat/pages/main/home/HomePage.dart';
import 'package:com.jc.livechat/pages/main/me/MinePage.dart';
import 'package:com.jc.livechat/tim_ui_kit/ui/widgets/keepalive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GlobalConstant/ColorConst.dart';
import 'message/ConversationPage.dart';

class MainPage extends GetView<MainController> {
  final _bottomNavList = ["首页", "消息", "我的"];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (MainController logic) {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorConst.wyMainColor,
            currentIndex: logic.currentIndex,
            unselectedItemColor: HexColor("#78777F"),
            selectedFontSize: 30,
            unselectedFontSize: 30,
            onTap: (index) {
              _pageController.jumpToPage(index);
              logic.onBottomTap(index);
            },
            items: [
              BottomNavigationBarItem(
                  label: _bottomNavList[0],
                  icon: logic.currentIndex == 0 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[1],
                  icon: logic.currentIndex == 1 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[2],
                  icon: logic.currentIndex == 2 ? _bottomIcon('images/tim_kit/close.png') : _bottomIcon('images/tim_kit/clear.png')),
            ],
          );
        },
      ),
      body: showPageView(),
    );
  }

  Widget showPageView() {
    var pages = [
      KeepAliveWrapper(child: HomePage()),
      KeepAliveWrapper(child: ConversationPage()),
      KeepAliveWrapper(child: MinePage()),
    ];

    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        controller.onBottomTap(index);
      },
      children: pages,
    );
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
