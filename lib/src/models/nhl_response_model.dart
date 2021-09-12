class NhlResponseModel {
  NhlResponseModel({
    this.copyright,
    this.id,
    this.name,
    this.season,
    this.defaultRound,
    this.rounds,
  });

  String? copyright;
  int? id;
  String? name;
  String? season;
  int? defaultRound;
  List<RoundElement>? rounds;

  factory NhlResponseModel.fromJson(Map<String, dynamic> json) => NhlResponseModel(
        copyright: json["copyright"],
        id: json["id"],
        name: json["name"],
        season: json["season"],
        defaultRound: json["defaultRound"],
        rounds: List<RoundElement>.from(json["rounds"].map((x) => RoundElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "id": id,
        "name": name,
        "season": season,
        "defaultRound": defaultRound,
        "rounds": rounds,
      };
}

class RoundElement {
  RoundElement({
    required this.number,
    required this.code,
    required this.names,
    required this.format,
    required this.series,
  });

  int number;
  int code;
  RoundNames names;
  Format format;
  List<Series> series;

  factory RoundElement.fromJson(Map<String, dynamic> json) => RoundElement(
        number: json["number"],
        code: json["code"],
        names: RoundNames.fromJson(json["names"]),
        format: Format.fromJson(json["format"]),
        series: List<Series>.from(json["series"].map((x) => Series.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "code": code,
        "names": names.toJson(),
        "format": format.toJson(),
        "series": List<dynamic>.from(series.map((x) => x.toJson())),
      };
}

class Format {
  Format({
    required this.name,
    required this.description,
    required this.numberOfGames,
    required this.numberOfWins,
  });

  String name;
  String description;
  int numberOfGames;
  int numberOfWins;

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        name: json["name"],
        description: json["description"],
        numberOfGames: json["numberOfGames"],
        numberOfWins: json["numberOfWins"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "numberOfGames": numberOfGames,
        "numberOfWins": numberOfWins,
      };
}

class RoundNames {
  RoundNames({
    required this.name,
    required this.shortName,
  });

  String name;
  String shortName;

  factory RoundNames.fromJson(Map<String, dynamic> json) => RoundNames(
        name: json["name"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "shortName": shortName,
      };
}

class Series {
  Series({
    required this.seriesNumber,
    required this.seriesCode,
    required this.names,
    required this.currentGame,
    required this.conference,
    required this.round,
    required this.matchupTeams,
  });

  int seriesNumber;
  String seriesCode;
  SeriesNames names;
  CurrentGame currentGame;
  Conference conference;
  SeriesRound round;
  List<MatchupTeam> matchupTeams;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        seriesNumber: json["seriesNumber"],
        seriesCode: json["seriesCode"],
        names: SeriesNames.fromJson(json["names"]),
        currentGame: CurrentGame.fromJson(json["currentGame"]),
        conference: Conference.fromJson(json["conference"]),
        round: SeriesRound.fromJson(json["round"]),
        matchupTeams: List<MatchupTeam>.from(json["matchupTeams"].map((x) => MatchupTeam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seriesNumber": seriesNumber,
        "seriesCode": seriesCode,
        "names": names.toJson(),
        "currentGame": currentGame.toJson(),
        "conference": conference.toJson(),
        "round": round.toJson(),
        "matchupTeams": List<dynamic>.from(matchupTeams.map((x) => x.toJson())),
      };
}

class Conference {
  Conference({
    this.id,
    this.name,
    this.link,
  });

  int? id;
  String? name;
  String? link;

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
        id: json["id"],
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
      };
}

class CurrentGame {
  CurrentGame({
    required this.seriesSummary,
  });

  SeriesSummary seriesSummary;

  factory CurrentGame.fromJson(Map<String, dynamic> json) => CurrentGame(
        seriesSummary: SeriesSummary.fromJson(json["seriesSummary"]),
      );

  Map<String, dynamic> toJson() => {
        "seriesSummary": seriesSummary.toJson(),
      };
}

class SeriesSummary {
  SeriesSummary({
    required this.gamePk,
    required this.gameNumber,
    required this.gameLabel,
    required this.necessary,
    required this.gameCode,
    required this.gameTime,
    required this.seriesStatus,
    required this.seriesStatusShort,
  });

  int gamePk;
  int gameNumber;
  String gameLabel;
  bool necessary;
  int gameCode;
  DateTime gameTime;
  String seriesStatus;
  String seriesStatusShort;

  factory SeriesSummary.fromJson(Map<String, dynamic> json) => SeriesSummary(
        gamePk: json["gamePk"],
        gameNumber: json["gameNumber"],
        gameLabel: json["gameLabel"],
        necessary: json["necessary"],
        gameCode: json["gameCode"],
        gameTime: DateTime.parse(json["gameTime"]),
        seriesStatus: json["seriesStatus"],
        seriesStatusShort: json["seriesStatusShort"],
      );

  Map<String, dynamic> toJson() => {
        "gamePk": gamePk,
        "gameNumber": gameNumber,
        "gameLabel": gameLabel,
        "necessary": necessary,
        "gameCode": gameCode,
        "gameTime": gameTime.toIso8601String(),
        "seriesStatus": seriesStatus,
        "seriesStatusShort": seriesStatusShort,
      };
}

class MatchupTeam {
  MatchupTeam({
    required this.team,
    required this.seed,
    required this.seriesRecord,
  });

  Conference team;
  Seed seed;
  SeriesRecord seriesRecord;

  factory MatchupTeam.fromJson(Map<String, dynamic> json) => MatchupTeam(
        team: Conference.fromJson(json["team"]),
        seed: Seed.fromJson(json["seed"]),
        seriesRecord: SeriesRecord.fromJson(json["seriesRecord"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "seed": seed.toJson(),
        "seriesRecord": seriesRecord.toJson(),
      };
}

class Seed {
  Seed({
    required this.type,
    required this.rank,
    required this.isTop,
  });

  String type;
  int rank;
  bool isTop;

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        type: json["type"],
        rank: json["rank"],
        isTop: json["isTop"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "rank": rank,
        "isTop": isTop,
      };
}

class SeriesRecord {
  SeriesRecord({
    required this.wins,
    required this.losses,
  });

  int wins;
  int losses;

  factory SeriesRecord.fromJson(Map<String, dynamic> json) => SeriesRecord(
        wins: json["wins"],
        losses: json["losses"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
      };
}

class SeriesNames {
  SeriesNames({
    required this.matchupName,
    required this.matchupShortName,
    required this.teamAbbreviationA,
    required this.teamAbbreviationB,
    required this.seriesSlug,
  });

  String matchupName;
  String matchupShortName;
  String teamAbbreviationA;
  String teamAbbreviationB;
  String seriesSlug;

  factory SeriesNames.fromJson(Map<String, dynamic> json) => SeriesNames(
        matchupName: json["matchupName"],
        matchupShortName: json["matchupShortName"],
        teamAbbreviationA: json["teamAbbreviationA"],
        teamAbbreviationB: json["teamAbbreviationB"],
        seriesSlug: json["seriesSlug"],
      );

  Map<String, dynamic> toJson() => {
        "matchupName": matchupName,
        "matchupShortName": matchupShortName,
        "teamAbbreviationA": teamAbbreviationA,
        "teamAbbreviationB": teamAbbreviationB,
        "seriesSlug": seriesSlug,
      };
}

class SeriesRound {
  SeriesRound({
    required this.number,
  });

  int number;

  factory SeriesRound.fromJson(Map<String, dynamic> json) => SeriesRound(
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
      };
}
