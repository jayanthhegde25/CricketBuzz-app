// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
    MatchInfo matchInfo;
    VenueInfo venueInfo;
    List<BroadcastInfo> broadcastInfo;

    Info({
        required this.matchInfo,
        required this.venueInfo,
        required this.broadcastInfo,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        matchInfo: MatchInfo.fromJson(json["matchInfo"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
        broadcastInfo: List<BroadcastInfo>.from(json["broadcastInfo"].map((x) => BroadcastInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo.toJson(),
        "venueInfo": venueInfo.toJson(),
        "broadcastInfo": List<dynamic>.from(broadcastInfo.map((x) => x.toJson())),
    };
}

class BroadcastInfo {
    String country;
    List<Broadcaster> broadcaster;

    BroadcastInfo({
        required this.country,
        required this.broadcaster,
    });

    factory BroadcastInfo.fromJson(Map<String, dynamic> json) => BroadcastInfo(
        country: json["country"],
        broadcaster: List<Broadcaster>.from(json["broadcaster"].map((x) => Broadcaster.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "broadcaster": List<dynamic>.from(broadcaster.map((x) => x.toJson())),
    };
}

class Broadcaster {
    String broadcastType;
    String value;

    Broadcaster({
        required this.broadcastType,
        required this.value,
    });

    factory Broadcaster.fromJson(Map<String, dynamic> json) => Broadcaster(
        broadcastType: json["broadcastType"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "broadcastType": broadcastType,
        "value": value,
    };
}

class MatchInfo {
    int matchId;
    String matchDescription;
    String matchFormat;
    String matchType;
    bool complete;
    bool domestic;
    int matchStartTimestamp;
    int matchCompleteTimestamp;
    bool dayNight;
    int year;
    String state;
    Team team1;
    Team team2;
    Series series;
    Referee? umpire1;
    Referee umpire2;
    Referee umpire3;
    Referee referee;
    TossResults tossResults;
    Result result;
    Venue venue;
    String status;
    List<PlayersOfThe> playersOfTheMatch;
    List<PlayersOfThe> playersOfTheSeries;
    RevisedTarget revisedTarget;
    List<MatchTeamInfo> matchTeamInfo;
    bool isMatchNotCovered;
    int hysEnabled;
    bool livestreamEnabled;
    bool isFantasyEnabled;
    List<dynamic> livestreamEnabledGeo;
    String alertType;
    String shortStatus;

    MatchInfo({
        required this.matchId,
        required this.matchDescription,
        required this.matchFormat,
        required this.matchType,
        required this.complete,
        required this.domestic,
        required this.matchStartTimestamp,
        required this.matchCompleteTimestamp,
        required this.dayNight,
        required this.year,
        required this.state,
        required this.team1,
        required this.team2,
        required this.series,
        this.umpire1,
        required this.umpire2,
        required this.umpire3,
        required this.referee,
        required this.tossResults,
        required this.result,
        required this.venue,
        required this.status,
        required this.playersOfTheMatch,
        required this.playersOfTheSeries,
        required this.revisedTarget,
        required this.matchTeamInfo,
        required this.isMatchNotCovered,
        required this.hysEnabled,
        required this.livestreamEnabled,
        required this.isFantasyEnabled,
        required this.livestreamEnabledGeo,
        required this.alertType,
        required this.shortStatus,
    });

    factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        matchDescription: json["matchDescription"],
        matchFormat: json["matchFormat"],
        matchType: json["matchType"],
        complete: json["complete"],
        domestic: json["domestic"],
        matchStartTimestamp: json["matchStartTimestamp"],
        matchCompleteTimestamp: json["matchCompleteTimestamp"],
        dayNight: json["dayNight"],
        year: json["year"],
        state: json["state"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        series: Series.fromJson(json["series"]),
        umpire1: Referee.fromJson(json["umpire1"]),
        umpire2: Referee.fromJson(json["umpire2"]),
        umpire3: Referee.fromJson(json["umpire3"]),
        referee: Referee.fromJson(json["referee"]),
        tossResults: TossResults.fromJson(json["tossResults"]),
        result: Result.fromJson(json["result"]),
        venue: Venue.fromJson(json["venue"]),
        status: json["status"],
        playersOfTheMatch: List<PlayersOfThe>.from(json["playersOfTheMatch"].map((x) => PlayersOfThe.fromJson(x))),
        playersOfTheSeries: List<PlayersOfThe>.from(json["playersOfTheSeries"].map((x) => PlayersOfThe.fromJson(x))),
        revisedTarget: RevisedTarget.fromJson(json["revisedTarget"]),
        matchTeamInfo: List<MatchTeamInfo>.from(json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        hysEnabled: json["HYSEnabled"],
        livestreamEnabled: json["livestreamEnabled"],
        isFantasyEnabled: json["isFantasyEnabled"],
        livestreamEnabledGeo: List<dynamic>.from(json["livestreamEnabledGeo"].map((x) => x)),
        alertType: json["alertType"],
        shortStatus: json["shortStatus"],
    );

    Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "matchDescription": matchDescription,
        "matchFormat": matchFormat,
        "matchType": matchType,
        "complete": complete,
        "domestic": domestic,
        "matchStartTimestamp": matchStartTimestamp,
        "matchCompleteTimestamp": matchCompleteTimestamp,
        "dayNight": dayNight,
        "year": year,
        "state": state,
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "series": series.toJson(),
        "umpire1": umpire1!.toJson(),
        "umpire2": umpire2.toJson(),
        "umpire3": umpire3.toJson(),
        "referee": referee.toJson(),
        "tossResults": tossResults.toJson(),
        "result": result.toJson(),
        "venue": venue.toJson(),
        "status": status,
        "playersOfTheMatch": List<dynamic>.from(playersOfTheMatch.map((x) => x.toJson())),
        "playersOfTheSeries": List<dynamic>.from(playersOfTheSeries.map((x) => x.toJson())),
        "revisedTarget": revisedTarget.toJson(),
        "matchTeamInfo": List<dynamic>.from(matchTeamInfo.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "HYSEnabled": hysEnabled,
        "livestreamEnabled": livestreamEnabled,
        "isFantasyEnabled": isFantasyEnabled,
        "livestreamEnabledGeo": List<dynamic>.from(livestreamEnabledGeo.map((x) => x)),
        "alertType": alertType,
        "shortStatus": shortStatus,
    };
}

class MatchTeamInfo {
    int battingTeamId;
    Name? battingTeamShortName;
    int bowlingTeamId;
    Name? bowlingTeamShortName;

    MatchTeamInfo({
        required this.battingTeamId,
        this.battingTeamShortName,
        required this.bowlingTeamId,
         this.bowlingTeamShortName,
    });

    factory MatchTeamInfo.fromJson(Map<String, dynamic> json) => MatchTeamInfo(
        battingTeamId: json["battingTeamId"],
        battingTeamShortName:json["battingTeamShortName"] !=null? nameValues.map[json["battingTeamShortName"]]:null,
        bowlingTeamId: json["bowlingTeamId"],
        bowlingTeamShortName:json["bowlingTeamShortName"]!=null? nameValues.map[json["bowlingTeamShortName"]]:null,
    );

    Map<String, dynamic> toJson() => {
        "battingTeamId": battingTeamId,
        "battingTeamShortName": nameValues.reverse[battingTeamShortName],
        "bowlingTeamId": bowlingTeamId,
        "bowlingTeamShortName": nameValues.reverse[bowlingTeamShortName],
    };
}

enum Name {
    AUS,
    IND
}

final nameValues = EnumValues({
    "AUS": Name.AUS,
    "IND": Name.IND
});

class PlayersOfThe {
    int id;
    String name;
    String fullName;
    String nickName;
    bool captain;
    bool keeper;
    bool substitute;
    String? teamName;
    int faceImageId;
    String? bowlingStyle;

    PlayersOfThe({
        required this.id,
        required this.name,
        required this.fullName,
        required this.nickName,
        required this.captain,
        required this.keeper,
        required this.substitute,
        this.teamName,
        required this.faceImageId,
        this.bowlingStyle,
    });

    factory PlayersOfThe.fromJson(Map<String, dynamic> json) => PlayersOfThe(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamName: json["teamName"],
        faceImageId: json["faceImageId"],
        bowlingStyle: json["bowlingStyle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "captain": captain,
        "keeper": keeper,
        "substitute": substitute,
        "teamName": teamName,
        "faceImageId": faceImageId,
        "bowlingStyle": bowlingStyle,
    };
}

class Referee {
    int? id;
    String name;
    String country;

    Referee({
         this.id,
        required this.name,
        required this.country,
    });

    factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        id: json["id"],
        name: json["name"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
    };
}

class Result {
    String resultType;
    String winningTeam;
    int winningteamId;
    int winningMargin;
    bool winByRuns;
    bool winByInnings;

    Result({
        required this.resultType,
        required this.winningTeam,
        required this.winningteamId,
        required this.winningMargin,
        required this.winByRuns,
        required this.winByInnings,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        resultType: json["resultType"],
        winningTeam: json["winningTeam"],
        winningteamId: json["winningteamId"],
        winningMargin: json["winningMargin"],
        winByRuns: json["winByRuns"],
        winByInnings: json["winByInnings"],
    );

    Map<String, dynamic> toJson() => {
        "resultType": resultType,
        "winningTeam": winningTeam,
        "winningteamId": winningteamId,
        "winningMargin": winningMargin,
        "winByRuns": winByRuns,
        "winByInnings": winByInnings,
    };
}

class RevisedTarget {
    String reason;

    RevisedTarget({
        required this.reason,
    });

    factory RevisedTarget.fromJson(Map<String, dynamic> json) => RevisedTarget(
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
    };
}

class Series {
    int id;
    String name;
    String seriesType;
    int startDate;
    int endDate;
    String seriesFolder;
    String odiSeriesResult;
    String t20SeriesResult;
    String testSeriesResult;
    bool? tournament;

    Series({
        required this.id,
        required this.name,
        required this.seriesType,
        required this.startDate,
        required this.endDate,
        required this.seriesFolder,
        required this.odiSeriesResult,
        required this.t20SeriesResult,
        required this.testSeriesResult,
        required this.tournament,
    });

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["id"],
        name: json["name"],
        seriesType: json["seriesType"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        seriesFolder: json["seriesFolder"],
        odiSeriesResult: json["odiSeriesResult"],
        t20SeriesResult: json["t20SeriesResult"],
        testSeriesResult: json["testSeriesResult"],
        tournament: json["tournament"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "seriesType": seriesType,
        "startDate": startDate,
        "endDate": endDate,
        "seriesFolder": seriesFolder,
        "odiSeriesResult": odiSeriesResult,
        "t20SeriesResult": t20SeriesResult,
        "testSeriesResult": testSeriesResult,
        "tournament": tournament,
    };
}

class Team {
    int id;
    String name;
    List<PlayerDetail> playerDetails;
    Name? shortName;

    Team({
        required this.id,
        required this.name,
        required this.playerDetails,
         this.shortName,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        playerDetails: List<PlayerDetail>.from(json["playerDetails"].map((x) => PlayerDetail.fromJson(x))),
        shortName:json["shortName"]!= null? nameValues.map[json["shortName"]]:null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "playerDetails": List<dynamic>.from(playerDetails.map((x) => x.toJson())),
        "shortName": nameValues.reverse[shortName],
    };
}

class PlayerDetail {
    int id;
    String name;
    String fullName;
    String nickName;
    bool? captain;
    String role;
    bool? keeper;
    bool? substitute;
    int teamId;
    BattingStyle? battingStyle;
    String? bowlingStyle;
    Name? teamName;
    int faceImageId;
    bool? isSupportStaff;

    PlayerDetail({
        required this.id,
        required this.name,
        required this.fullName,
        required this.nickName,
        this.captain,
        required this.role,
        this.keeper,
        this.substitute,
        required this.teamId,
        this.battingStyle,
        this.bowlingStyle,
         this.teamName,
        required this.faceImageId,
        this.isSupportStaff,
    });

    factory PlayerDetail.fromJson(Map<String, dynamic> json) => PlayerDetail(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        role: json["role"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamId: json["teamId"],
        battingStyle: json["battingStyle"] != null ? battingStyleValues.map[json["battingStyle"]]:null,
        bowlingStyle: json["bowlingStyle"],
        teamName:json["teamName"]!=null? nameValues.map[json["teamName"]]:null,
        faceImageId: json["faceImageId"],
        isSupportStaff: json["isSupportStaff"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "nickName": nickName,
        "captain": captain,
        "role": role,
        "keeper": keeper,
        "substitute": substitute,
        "teamId": teamId,
        "battingStyle": battingStyleValues.reverse[battingStyle],
        "bowlingStyle": bowlingStyle,
        "teamName": nameValues.reverse[teamName],
        "faceImageId": faceImageId,
        "isSupportStaff": isSupportStaff,
    };
}

enum BattingStyle {
    LEFT,
    RIGHT
}

final battingStyleValues = EnumValues({
    "LEFT": BattingStyle.LEFT,
    "RIGHT": BattingStyle.RIGHT
});

class TossResults {
    int tossWinnerId;
    String tossWinnerName;
    String decision;

    TossResults({
        required this.tossWinnerId,
        required this.tossWinnerName,
        required this.decision,
    });

    factory TossResults.fromJson(Map<String, dynamic> json) => TossResults(
        tossWinnerId: json["tossWinnerId"],
        tossWinnerName: json["tossWinnerName"],
        decision: json["decision"],
    );

    Map<String, dynamic> toJson() => {
        "tossWinnerId": tossWinnerId,
        "tossWinnerName": tossWinnerName,
        "decision": decision,
    };
}

class Venue {
    int id;
    String name;
    String city;
    String country;
    String timezone;
    String latitude;
    String longitude;

    Venue({
        required this.id,
        required this.name,
        required this.city,
        required this.country,
        required this.timezone,
        required this.latitude,
        required this.longitude,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class VenueInfo {
    int established;
    String capacity;
    String? knownAs;
    String? ends;
    String city;
    String country;
    String timezone;
    String? homeTeam;
    bool floodlights;
    String? curator;
    String? profile;
    String imageUrl;
    String ground;
    double groundLength;
    double groundWidth;
    dynamic otherSports;

    VenueInfo({
        required this.established,
        required this.capacity,
         this.knownAs,
         this.ends,
        required this.city,
        required this.country,
        required this.timezone,
         this.homeTeam,
        required this.floodlights,
         this.curator,
       this.profile,
        required this.imageUrl,
        required this.ground,
        required this.groundLength,
        required this.groundWidth,
        required this.otherSports,
    });

    factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        established: json["established"],
        capacity: json["capacity"],
        knownAs:  json["knownAs"],
        ends: json["ends"],
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
        homeTeam: json["homeTeam"],
        floodlights: json["floodlights"],
        curator: json["curator"],
        profile: json["profile"],
        imageUrl: json["imageUrl"],
        ground: json["ground"],
        groundLength: json["groundLength"],
        groundWidth: json["groundWidth"],
        otherSports: json["otherSports"],
    );

    Map<String, dynamic> toJson() => {
        "established": established,
        "capacity": capacity,
        "knownAs": knownAs,
        "ends": ends,
        "city": city,
        "country": country,
        "timezone": timezone,
        "homeTeam": homeTeam,
        "floodlights": floodlights,
        "curator": curator??"",
        "profile": profile,
        "imageUrl": imageUrl,
        "ground": ground,
        "groundLength": groundLength,
        "groundWidth": groundWidth,
        "otherSports": otherSports,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
