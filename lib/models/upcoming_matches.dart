// To parse this JSON data, do
//
//     final upcomingMatches = upcomingMatchesFromJson(jsonString);

import 'dart:convert';

UpcomingMatches upcomingMatchesFromJson(String str) => UpcomingMatches.fromJson(json.decode(str));

String upcomingMatchesToJson(UpcomingMatches data) => json.encode(data.toJson());

class UpcomingMatches {
    List<MatchScheduleMap> matchScheduleMap;
    List<String> startDt;
    AppIndex appIndex;

    UpcomingMatches({
        required this.matchScheduleMap,
        required this.startDt,
        required this.appIndex,
    });

    factory UpcomingMatches.fromJson(Map<String, dynamic> json) => UpcomingMatches(
        matchScheduleMap: List<MatchScheduleMap>.from(json["matchScheduleMap"].map((x) => MatchScheduleMap.fromJson(x))),
        startDt: List<String>.from(json["startDt"].map((x) => x)),
        appIndex: AppIndex.fromJson(json["appIndex"]),
    );

    Map<String, dynamic> toJson() => {
        "matchScheduleMap": List<dynamic>.from(matchScheduleMap.map((x) => x.toJson())),
        "startDt": List<dynamic>.from(startDt.map((x) => x)),
        "appIndex": appIndex.toJson(),
    };
}

class AppIndex {
    String seoTitle;
    String webUrl;

    AppIndex({
        required this.seoTitle,
        required this.webUrl,
    });

    factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webURL"],
    );

    Map<String, dynamic> toJson() => {
        "seoTitle": seoTitle,
        "webURL": webUrl,
    };
}

class MatchScheduleMap {
    ScheduleAdWrapper? scheduleAdWrapper;
    AdDetail? adDetail;

    MatchScheduleMap({
        this.scheduleAdWrapper,
        this.adDetail,
    });

    factory MatchScheduleMap.fromJson(Map<String, dynamic> json) => MatchScheduleMap(
        scheduleAdWrapper: json["scheduleAdWrapper"] == null ? null : ScheduleAdWrapper.fromJson(json["scheduleAdWrapper"]),
        adDetail: json["adDetail"] == null ? null : AdDetail.fromJson(json["adDetail"]),
    );

    Map<String, dynamic> toJson() => {
        "scheduleAdWrapper": scheduleAdWrapper?.toJson(),
        "adDetail": adDetail?.toJson(),
    };
}

class AdDetail {
    String name;
    String layout;
    int position;

    AdDetail({
        required this.name,
        required this.layout,
        required this.position,
    });

    factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
    };
}

class ScheduleAdWrapper {
    String date;
    List<MatchScheduleList> matchScheduleList;
    String longDate;

    ScheduleAdWrapper({
        required this.date,
        required this.matchScheduleList,
        required this.longDate,
    });

    factory ScheduleAdWrapper.fromJson(Map<String, dynamic> json) => ScheduleAdWrapper(
        date: json["date"],
        matchScheduleList: List<MatchScheduleList>.from(json["matchScheduleList"].map((x) => MatchScheduleList.fromJson(x))),
        longDate: json["longDate"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "matchScheduleList": List<dynamic>.from(matchScheduleList.map((x) => x.toJson())),
        "longDate": longDate,
    };
}

class MatchScheduleList {
    String seriesName;
    List<MatchInfo> matchInfo;
    int seriesId;
    int? seriesHomeCountry;
    String seriesCategory;

    MatchScheduleList({
        required this.seriesName,
        required this.matchInfo,
        required this.seriesId,
        required this.seriesHomeCountry,
        required this.seriesCategory,
    });

    factory MatchScheduleList.fromJson(Map<String, dynamic> json) => MatchScheduleList(
        seriesName: json["seriesName"],
        matchInfo: List<MatchInfo>.from(json["matchInfo"].map((x) => MatchInfo.fromJson(x))),
        seriesId: json["seriesId"],
        seriesHomeCountry: json["seriesHomeCountry"],
        seriesCategory: json["seriesCategory"],
    );

    Map<String, dynamic> toJson() => {
        "seriesName": seriesName,
        "matchInfo": List<dynamic>.from(matchInfo.map((x) => x.toJson())),
        "seriesId": seriesId,
        "seriesHomeCountry": seriesHomeCountry,
        "seriesCategory": seriesCategory,
    };
}

class MatchInfo {
    int matchId;
    int seriesId;
    String matchDesc;
    String matchFormat;
    String startDate;
    String endDate;
    Team team1;
    Team team2;
    VenueInfo venueInfo;

    MatchInfo({
        required this.matchId,
        required this.seriesId,
        required this.matchDesc,
        required this.matchFormat,
        required this.startDate,
        required this.endDate,
        required this.team1,
        required this.team2,
        required this.venueInfo,
    });

    factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        matchDesc: json["matchDesc"],
        matchFormat: json["matchFormat"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "matchDesc": matchDesc,
        "matchFormat": matchFormat,
        "startDate": startDate,
        "endDate": endDate,
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "venueInfo": venueInfo.toJson(),
    };
}

class Team {
    int teamId;
    String teamName;
    String teamSName;
    bool? isFullMember;
    int imageId;

    Team({
        required this.teamId,
        required this.teamName,
        required this.teamSName,
        this.isFullMember,
        required this.imageId,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        isFullMember: json["isFullMember"],
        imageId: json["imageId"],
    );

    Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "isFullMember": isFullMember,
        "imageId": imageId,
    };
}

class VenueInfo {
    String ground;
    String city;
    String country;
    String timezone;

    VenueInfo({
        required this.ground,
        required this.city,
        required this.country,
        required this.timezone,
    });

    factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        ground: json["ground"],
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "ground": ground,
        "city": city,
        "country": country,
        "timezone": timezone,
    };
}
