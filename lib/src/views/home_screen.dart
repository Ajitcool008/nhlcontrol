import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhlcontrol/src/constants/strings.dart';
import 'package:nhlcontrol/src/controllers/home_controller.dart';
import 'package:nhlcontrol/src/utils/helpers/methods.dart';
import 'package:nhlcontrol/src/views/round_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController homeController = Get.put(HomeScreenController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Methods().onWillPop,
      child: MaterialApp(
        home: DefaultTabController(
          length: 5,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    MyStrings.appName,
                    style: TextStyle(color: Colors.black),
                  ),
                  bottom: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.deepPurpleAccent, Colors.lightBlue],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.redAccent,
                      ),
                      tabs: const [
                        Text(MyStrings.round1),
                        Text(MyStrings.round2),
                        Text(MyStrings.round3),
                        Text(MyStrings.round4),
                        Text(MyStrings.round5),
                      ]),
                ),
                body: GetX<HomeScreenController>(builder: (homeCon) {
                  return TabBarView(children: [
                    RoundScreen(round: homeCon.nhlData.value?.rounds?[0]),
                    RoundScreen(round: homeCon.nhlData.value?.rounds?[1]),
                    RoundScreen(round: homeCon.nhlData.value?.rounds?[2]),
                    RoundScreen(round: homeCon.nhlData.value?.rounds?[3]),
                    RoundScreen(round: homeCon.nhlData.value?.rounds?[4]),
                  ]);
                })),
          ),
        ),
      ),
    );
  }
}
