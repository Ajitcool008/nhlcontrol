import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhlcontrol/src/models/nhl_response_model.dart';

class RoundScreen extends StatelessWidget {
  final RoundElement? round;
  const RoundScreen({
    required this.round,
  });

  @override
  Widget build(BuildContext context) {
    return round == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(round!.names.name),
            ),
            body: ListView.builder(
                shrinkWrap: true,
                itemCount: round!.series.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMatchCard(series: round!.series[index]);
                }));
  }

  Widget _buildMatchCard({required Series series}) {
    return Card(
      margin: EdgeInsets.all(Get.width * 0.03),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.03),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(series.currentGame.seriesSummary.seriesStatus, style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: series.matchupTeams.length,
                itemBuilder: (BuildContext context, int position) {
                  return _cardData(
                      team: series.matchupTeams[position],
                      series: series,
                      position: position,
                      isWin: getWinTeam(
                          team: position == 0 ? series.names.teamAbbreviationA : series.names.teamAbbreviationB,
                          series: series));
                })
          ],
        ),
      ),
    );
  }

  bool getWinTeam({
    required String team,
    required Series series,
  }) {
    return series.currentGame.seriesSummary.seriesStatusShort.contains(team);
  }

  Widget _cardData({required MatchupTeam team, required Series series, required int position, required bool isWin}) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: Get.width * 0.08,
            width: Get.width * 0.08,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            child: Text(
              position == 0 ? series.names.teamAbbreviationA : series.names.teamAbbreviationB,
              style: TextStyle(fontSize: Get.width * 0.03),
            ),
          ),
          SizedBox(width: Get.width * 0.03),
          Text(team.team.name ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, color: isWin ? Colors.green : Colors.black))
        ],
      ),
    );
  }
}
