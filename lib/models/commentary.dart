// To parse this JSON data, do
//
//     final commentary = commentaryFromJson(jsonString);

import 'dart:convert';

Commentary commentaryFromJson(String str) => Commentary.fromJson(json.decode(str));

String commentaryToJson(Commentary data) => json.encode(data.toJson());

class Commentary {
    List<CommentaryList> commentaryList;
    MatchHeader matchHeader;
    Miniscore miniscore;
    List<CommentarySnippetList> commentarySnippetList;
    String page;
    bool enableNoContent;
    List<MatchVideo> matchVideos;
    int responseLastUpdated;

    Commentary({
        required this.commentaryList,
        required this.matchHeader,
        required this.miniscore,
        required this.commentarySnippetList,
        required this.page,
        required this.enableNoContent,
        required this.matchVideos,
        required this.responseLastUpdated,
    });

    factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
        commentaryList: List<CommentaryList>.from(json["commentaryList"].map((x) => CommentaryList.fromJson(x))),
        matchHeader: MatchHeader.fromJson(json["matchHeader"]),
        miniscore: Miniscore.fromJson(json["miniscore"]),
        commentarySnippetList: List<CommentarySnippetList>.from(json["commentarySnippetList"].map((x) => CommentarySnippetList.fromJson(x))),
        page: json["page"],
        enableNoContent: json["enableNoContent"],
        matchVideos: List<MatchVideo>.from(json["matchVideos"].map((x) => MatchVideo.fromJson(x))),
        responseLastUpdated: json["responseLastUpdated"],
    );

    Map<String, dynamic> toJson() => {
        "commentaryList": List<dynamic>.from(commentaryList.map((x) => x.toJson())),
        "matchHeader": matchHeader.toJson(),
        "miniscore": miniscore.toJson(),
        "commentarySnippetList": List<dynamic>.from(commentarySnippetList.map((x) => x.toJson())),
        "page": page,
        "enableNoContent": enableNoContent,
        "matchVideos": List<dynamic>.from(matchVideos.map((x) => x.toJson())),
        "responseLastUpdated": responseLastUpdated,
    };
}

class CommentaryList {
    String commText;
    int timestamp;
    int ballNbr;
    int inningsId;
    Event? event;
    BatTeamName? batTeamName;
    CommentaryFormats commentaryFormats;
    double? overNumber;

    CommentaryList({
        required this.commText,
        required this.timestamp,
        required this.ballNbr,
        required this.inningsId,
         this.event,
         this.batTeamName,
        required this.commentaryFormats,
        this.overNumber,
    });

    factory CommentaryList.fromJson(Map<String, dynamic> json) => CommentaryList(
        commText: json["commText"],
        timestamp: json["timestamp"],
        ballNbr: json["ballNbr"],
        inningsId: json["inningsId"],
        event:json["event"]!= null ? eventValues.map[json["event"]]:null,
        batTeamName: json["batTeamName"] != null ?batTeamNameValues.map[json["batTeamName"]]:null,
        commentaryFormats: CommentaryFormats.fromJson(json["commentaryFormats"]),
        overNumber: json["overNumber"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "commText": commText,
        "timestamp": timestamp,
        "ballNbr": ballNbr,
        "inningsId": inningsId,
        "event": eventValues.reverse[event],
        "batTeamName": batTeamNameValues.reverse[batTeamName],
        "commentaryFormats": commentaryFormats.toJson(),
        "overNumber": overNumber,
    };
}

enum BatTeamName {
    NED
}

final batTeamNameValues = EnumValues({
    "NED": BatTeamName.NED
});

class CommentaryFormats {
    Bold? italic;
    Bold? bold;

    CommentaryFormats({
        this.italic,
        this.bold,
    });

    factory CommentaryFormats.fromJson(Map<String, dynamic> json) => CommentaryFormats(
        italic: json["italic"] == null ? null : Bold.fromJson(json["italic"]),
        bold: json["bold"] == null ? null : Bold.fromJson(json["bold"]),
    );

    Map<String, dynamic> toJson() => {
        "italic": italic?.toJson(),
        "bold": bold?.toJson(),
    };
}

class Bold {
    List<String> formatId;
    List<String> formatValue;

    Bold({
        required this.formatId,
        required this.formatValue,
    });

    factory Bold.fromJson(Map<String, dynamic> json) => Bold(
        formatId: List<String>.from(json["formatId"].map((x) => x)),
        formatValue: List<String>.from(json["formatValue"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "formatId": List<dynamic>.from(formatId.map((x) => x)),
        "formatValue": List<dynamic>.from(formatValue.map((x) => x)),
    };
}

enum Event {
    FIFTY,
    NONE,
    WICKET
}

final eventValues = EnumValues({
    "FIFTY": Event.FIFTY,
    "NONE": Event.NONE,
    "WICKET": Event.WICKET
});

class CommentarySnippetList {
    int commId;
    int matchId;
    int inningsId;
    String infraType;
    String headline;
    int imageId;
    String itemId;
    int timestamp;
    List<dynamic> parsedContent;
    List<String> videoGeo;
    VideoType videoType;
    String url;
    bool isLive;
    int videoId;
    String mappingId;
    String videoUrl;
    String adTag;
    List<CommentarySnippetListCategory> categories;
    Language language;
    int planId;
    List<CommentarySnippetListTag> tags;
    bool isPremiumFree;

    CommentarySnippetList({
        required this.commId,
        required this.matchId,
        required this.inningsId,
        required this.infraType,
        required this.headline,
        required this.imageId,
        required this.itemId,
        required this.timestamp,
        required this.parsedContent,
        required this.videoGeo,
        required this.videoType,
        required this.url,
        required this.isLive,
        required this.videoId,
        required this.mappingId,
        required this.videoUrl,
        required this.adTag,
        required this.categories,
        required this.language,
        required this.planId,
        required this.tags,
        required this.isPremiumFree,
    });

    factory CommentarySnippetList.fromJson(Map<String, dynamic> json) => CommentarySnippetList(
        commId: json["commId"],
        matchId: json["matchId"],
        inningsId: json["inningsId"],
        infraType: json["infraType"],
        headline: json["headline"],
        imageId: json["imageId"],
        itemId: json["itemId"],
        timestamp: json["timestamp"],
        parsedContent: List<dynamic>.from(json["parsedContent"].map((x) => x)),
        videoGeo: List<String>.from(json["videoGeo"].map((x) => x)),
        videoType: videoTypeValues.map[json["videoType"]]!,
        url: json["url"],
        isLive: json["isLive"],
        videoId: json["videoId"],
        mappingId: json["mappingId"],
        videoUrl: json["videoUrl"],
        adTag: json["adTag"],
        categories: List<CommentarySnippetListCategory>.from(json["categories"].map((x) => CommentarySnippetListCategory.fromJson(x))),
        language: languageValues.map[json["language"]]!,
        planId: json["planId"],
        tags: List<CommentarySnippetListTag>.from(json["tags"].map((x) => CommentarySnippetListTag.fromJson(x))),
        isPremiumFree: json["isPremiumFree"],
    );

    Map<String, dynamic> toJson() => {
        "commId": commId,
        "matchId": matchId,
        "inningsId": inningsId,
        "infraType": infraType,
        "headline": headline,
        "imageId": imageId,
        "itemId": itemId,
        "timestamp": timestamp,
        "parsedContent": List<dynamic>.from(parsedContent.map((x) => x)),
        "videoGeo": List<dynamic>.from(videoGeo.map((x) => x)),
        "videoType": videoTypeValues.reverse[videoType],
        "url": url,
        "isLive": isLive,
        "videoId": videoId,
        "mappingId": mappingId,
        "videoUrl": videoUrl,
        "adTag": adTag,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "language": languageValues.reverse[language],
        "planId": planId,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "isPremiumFree": isPremiumFree,
    };
}

class CommentarySnippetListCategory {
    int id;
    String name;
    int imageId;

    CommentarySnippetListCategory({
        required this.id,
        required this.name,
        required this.imageId,
    });

    factory CommentarySnippetListCategory.fromJson(Map<String, dynamic> json) => CommentarySnippetListCategory(
        id: json["ID"],
        name: json["name"],
        imageId: json["imageID"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "imageID": imageId,
    };
}

enum Language {
    ENGLISH,
    HINDI
}

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Hindi": Language.HINDI
});

class CommentarySnippetListTag {
    ItemType itemType;
    int itemId;
    String itemName;

    CommentarySnippetListTag({
        required this.itemType,
        required this.itemId,
        required this.itemName,
    });

    factory CommentarySnippetListTag.fromJson(Map<String, dynamic> json) => CommentarySnippetListTag(
        itemType: itemTypeValues.map[json["itemType"]]!,
        itemId: json["itemId"],
        itemName: json["itemName"],
    );

    Map<String, dynamic> toJson() => {
        "itemType": itemTypeValues.reverse[itemType],
        "itemId": itemId,
        "itemName": itemName,
    };
}

enum ItemType {
    MATCH,
    PLAYER,
    SERIES,
    TEAM
}

final itemTypeValues = EnumValues({
    "match": ItemType.MATCH,
    "player": ItemType.PLAYER,
    "series": ItemType.SERIES,
    "team": ItemType.TEAM
});

enum VideoType {
    ANALYSIS
}

final videoTypeValues = EnumValues({
    "Analysis": VideoType.ANALYSIS
});

class MatchHeader {
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
    String status;
    TossResults tossResults;
    Result result;
    RevisedTarget revisedTarget;
    List<PlayersOfTheMatch> playersOfTheMatch;
    List<dynamic> playersOfTheSeries;
    List<MatchTeamInfo> matchTeamInfo;
    bool isMatchNotCovered;
    Team team1;
    Team team2;
    String seriesDesc;
    int seriesId;
    String seriesName;
    String alertType;
    bool livestreamEnabled;

    MatchHeader({
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
        required this.status,
        required this.tossResults,
        required this.result,
        required this.revisedTarget,
        required this.playersOfTheMatch,
        required this.playersOfTheSeries,
        required this.matchTeamInfo,
        required this.isMatchNotCovered,
        required this.team1,
        required this.team2,
        required this.seriesDesc,
        required this.seriesId,
        required this.seriesName,
        required this.alertType,
        required this.livestreamEnabled,
    });

    factory MatchHeader.fromJson(Map<String, dynamic> json) => MatchHeader(
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
        status: json["status"],
        tossResults: TossResults.fromJson(json["tossResults"]),
        result: Result.fromJson(json["result"]),
        revisedTarget: RevisedTarget.fromJson(json["revisedTarget"]),
        playersOfTheMatch: List<PlayersOfTheMatch>.from(json["playersOfTheMatch"].map((x) => PlayersOfTheMatch.fromJson(x))),
        playersOfTheSeries: List<dynamic>.from(json["playersOfTheSeries"].map((x) => x)),
        matchTeamInfo: List<MatchTeamInfo>.from(json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        seriesDesc: json["seriesDesc"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        alertType: json["alertType"],
        livestreamEnabled: json["livestreamEnabled"],
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
        "status": status,
        "tossResults": tossResults.toJson(),
        "result": result.toJson(),
        "revisedTarget": revisedTarget.toJson(),
        "playersOfTheMatch": List<dynamic>.from(playersOfTheMatch.map((x) => x.toJson())),
        "playersOfTheSeries": List<dynamic>.from(playersOfTheSeries.map((x) => x)),
        "matchTeamInfo": List<dynamic>.from(matchTeamInfo.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "seriesDesc": seriesDesc,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "alertType": alertType,
        "livestreamEnabled": livestreamEnabled,
    };
}

class MatchTeamInfo {
    int battingTeamId;
    String battingTeamShortName;
    int bowlingTeamId;
    String bowlingTeamShortName;

    MatchTeamInfo({
        required this.battingTeamId,
        required this.battingTeamShortName,
        required this.bowlingTeamId,
        required this.bowlingTeamShortName,
    });

    factory MatchTeamInfo.fromJson(Map<String, dynamic> json) => MatchTeamInfo(
        battingTeamId: json["battingTeamId"],
        battingTeamShortName: json["battingTeamShortName"],
        bowlingTeamId: json["bowlingTeamId"],
        bowlingTeamShortName: json["bowlingTeamShortName"],
    );

    Map<String, dynamic> toJson() => {
        "battingTeamId": battingTeamId,
        "battingTeamShortName": battingTeamShortName,
        "bowlingTeamId": bowlingTeamId,
        "bowlingTeamShortName": bowlingTeamShortName,
    };
}

class PlayersOfTheMatch {
    int id;
    String name;
    String fullName;
    String nickName;
    bool captain;
    bool keeper;
    bool substitute;
    String teamName;
    int faceImageId;

    PlayersOfTheMatch({
        required this.id,
        required this.name,
        required this.fullName,
        required this.nickName,
        required this.captain,
        required this.keeper,
        required this.substitute,
        required this.teamName,
        required this.faceImageId,
    });

    factory PlayersOfTheMatch.fromJson(Map<String, dynamic> json) => PlayersOfTheMatch(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamName: json["teamName"],
        faceImageId: json["faceImageId"],
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

class Team {
    int id;
    String name;
    List<dynamic> playerDetails;
    String shortName;

    Team({
        required this.id,
        required this.name,
        required this.playerDetails,
        required this.shortName,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        playerDetails: List<dynamic>.from(json["playerDetails"].map((x) => x)),
        shortName: json["shortName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "playerDetails": List<dynamic>.from(playerDetails.map((x) => x)),
        "shortName": shortName,
    };
}

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

class MatchVideo {
    InfraType infraType;
    String headline;
    String commTimestamp;
    String itemId;
    String appLinkUrl;
    int imageId;
    String mappingId;
    String videoUrl;
    AdTag? adTag;
    Language language;
    int videoId;
    VideoType videoType;
    List<MatchVideoCategory> category;
    List<MatchVideoTag> tags;

    MatchVideo({
        required this.infraType,
        required this.headline,
        required this.commTimestamp,
        required this.itemId,
        required this.appLinkUrl,
        required this.imageId,
        required this.mappingId,
        required this.videoUrl,
         this.adTag,
        required this.language,
        required this.videoId,
        required this.videoType,
        required this.category,
        required this.tags,
    });

    factory MatchVideo.fromJson(Map<String, dynamic> json) => MatchVideo(
        infraType: infraTypeValues.map[json["infraType"]]!,
        headline: json["headline"],
        commTimestamp: json["commTimestamp"],
        itemId: json["itemId"],
        appLinkUrl: json["appLinkUrl"],
        imageId: json["imageId"],
        mappingId: json["mappingId"],
        videoUrl: json["videoUrl"],
        adTag: json["adTag"] != null?adTagValues.map[json["adTag"]]:null,
        language: languageValues.map[json["language"]]!,
        videoId: json["videoId"],
        videoType: videoTypeValues.map[json["videoType"]]!,
        category: List<MatchVideoCategory>.from(json["category"].map((x) => MatchVideoCategory.fromJson(x))),
        tags: List<MatchVideoTag>.from(json["tags"].map((x) => MatchVideoTag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "infraType": infraTypeValues.reverse[infraType],
        "headline": headline,
        "commTimestamp": commTimestamp,
        "itemId": itemId,
        "appLinkUrl": appLinkUrl,
        "imageId": imageId,
        "mappingId": mappingId,
        "videoUrl": videoUrl,
        "adTag": adTagValues.reverse[adTag],
        "language": languageValues.reverse[language],
        "videoId": videoId,
        "videoType": videoTypeValues.reverse[videoType],
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    };
}

enum AdTag {
    VAST_CRICBUZZ_LIVE,
    VAST_CRICBUZZ_LIVE_TALKING_POINTS_HINDI
}

final adTagValues = EnumValues({
    "vast-Cricbuzz-Live": AdTag.VAST_CRICBUZZ_LIVE,
    "vast-Cricbuzz-Live-Talking-Points-Hindi": AdTag.VAST_CRICBUZZ_LIVE_TALKING_POINTS_HINDI
});

class MatchVideoCategory {
    int id;
    Name name;
    int imageId;

    MatchVideoCategory({
        required this.id,
        required this.name,
        required this.imageId,
    });

    factory MatchVideoCategory.fromJson(Map<String, dynamic> json) => MatchVideoCategory(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        imageId: json["imageID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "imageID": imageId,
    };
}

enum Name {
    CRICBUZZ_LIVE,
    CRICBUZZ_LIVE_HINDI,
    CRICBUZZ_LIVE_TALKING_POINTS,
    CRICBUZZ_LIVE_TALKING_POINTS_HINDI
}

final nameValues = EnumValues({
    "Cricbuzz Live": Name.CRICBUZZ_LIVE,
    "Cricbuzz Live Hindi": Name.CRICBUZZ_LIVE_HINDI,
    "Cricbuzz LIVE - Talking Points": Name.CRICBUZZ_LIVE_TALKING_POINTS,
    "Cricbuzz Live - Talking Points (Hindi)": Name.CRICBUZZ_LIVE_TALKING_POINTS_HINDI
});

enum InfraType {
    CONTENT_PROMOTION_VIDEO
}

final infraTypeValues = EnumValues({
    "Content_Promotion - Video": InfraType.CONTENT_PROMOTION_VIDEO
});

class MatchVideoTag {
    String itemName;
    ItemType itemType;
    String itemId;

    MatchVideoTag({
        required this.itemName,
        required this.itemType,
        required this.itemId,
    });

    factory MatchVideoTag.fromJson(Map<String, dynamic> json) => MatchVideoTag(
        itemName: json["itemName"],
        itemType: itemTypeValues.map[json["itemType"]]!,
        itemId: json["itemId"],
    );

    Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "itemType": itemTypeValues.reverse[itemType],
        "itemId": itemId,
    };
}

class Miniscore {
    int inningsId;
    BatsmanNStriker batsmanStriker;
    BatsmanNStriker batsmanNonStriker;
    BatTeam batTeam;
    BowlerStriker bowlerStriker;
    BowlerStriker bowlerNonStriker;
    double overs;
    String recentOvsStats;
    int? target;
    PartnerShip partnerShip;
    double currentRunRate;
    double requiredRunRate;
    String lastWicket;
    MatchScoreDetails matchScoreDetails;
    List<LatestPerformance> latestPerformance;
    PpData ppData;
    MatchUdrs? matchUdrs;
    List<dynamic> overSummaryList;
    String status;
    int lastWicketScore;
    int remRunsToWin;
    int responseLastUpdated;
    Event? event;

    Miniscore({
        required this.inningsId,
        required this.batsmanStriker,
        required this.batsmanNonStriker,
        required this.batTeam,
        required this.bowlerStriker,
        required this.bowlerNonStriker,
        required this.overs,
        required this.recentOvsStats,
        required this.target,
        required this.partnerShip,
        required this.currentRunRate,
        required this.requiredRunRate,
        required this.lastWicket,
        required this.matchScoreDetails,
        required this.latestPerformance,
        required this.ppData,
        this.matchUdrs,
        required this.overSummaryList,
        required this.status,
        required this.lastWicketScore,
        required this.remRunsToWin,
        required this.responseLastUpdated,
         this.event,
    });

    factory Miniscore.fromJson(Map<String, dynamic> json) => Miniscore(
        inningsId: json["inningsId"],
        batsmanStriker: BatsmanNStriker.fromJson(json["batsmanStriker"]),
        batsmanNonStriker: BatsmanNStriker.fromJson(json["batsmanNonStriker"]),
        batTeam: BatTeam.fromJson(json["batTeam"]),
        bowlerStriker: BowlerStriker.fromJson(json["bowlerStriker"]),
        bowlerNonStriker: BowlerStriker.fromJson(json["bowlerNonStriker"]),
        overs: json["overs"]?.toDouble(),
        recentOvsStats: json["recentOvsStats"],
        target: json["target"],
        partnerShip: PartnerShip.fromJson(json["partnerShip"]),
        currentRunRate: json["currentRunRate"]?.toDouble(),
        requiredRunRate: json["requiredRunRate"],
        lastWicket: json["lastWicket"],
        matchScoreDetails: MatchScoreDetails.fromJson(json["matchScoreDetails"]),
        latestPerformance: List<LatestPerformance>.from(json["latestPerformance"].map((x) => LatestPerformance.fromJson(x))),
        ppData: PpData.fromJson(json["ppData"]),
        matchUdrs: json["matchUdrs"] != null ? MatchUdrs.fromJson(json["matchUdrs"]):null,
        overSummaryList: List<dynamic>.from(json["overSummaryList"].map((x) => x)),
        status: json["status"],
        lastWicketScore: json["lastWicketScore"],
        remRunsToWin: json["remRunsToWin"],
        responseLastUpdated: json["responseLastUpdated"],
        event: json["event"]!=null?eventValues.map[json["event"]]:null,
    );

    Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "batsmanStriker": batsmanStriker.toJson(),
        "batsmanNonStriker": batsmanNonStriker.toJson(),
        "batTeam": batTeam.toJson(),
        "bowlerStriker": bowlerStriker.toJson(),
        "bowlerNonStriker": bowlerNonStriker.toJson(),
        "overs": overs,
        "recentOvsStats": recentOvsStats,
        "target": target,
        "partnerShip": partnerShip.toJson(),
        "currentRunRate": currentRunRate,
        "requiredRunRate": requiredRunRate,
        "lastWicket": lastWicket,
        "matchScoreDetails": matchScoreDetails.toJson(),
        "latestPerformance": List<dynamic>.from(latestPerformance.map((x) => x.toJson())),
        "ppData": ppData.toJson(),
        "matchUdrs": matchUdrs!.toJson(),
        "overSummaryList": List<dynamic>.from(overSummaryList.map((x) => x)),
        "status": status,
        "lastWicketScore": lastWicketScore,
        "remRunsToWin": remRunsToWin,
        "responseLastUpdated": responseLastUpdated,
        "event": eventValues.reverse[event],
    };
}

class BatTeam {
    int teamId;
    int teamScore;
    int teamWkts;

    BatTeam({
        required this.teamId,
        required this.teamScore,
        required this.teamWkts,
    });

    factory BatTeam.fromJson(Map<String, dynamic> json) => BatTeam(
        teamId: json["teamId"],
        teamScore: json["teamScore"],
        teamWkts: json["teamWkts"],
    );

    Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamScore": teamScore,
        "teamWkts": teamWkts,
    };
}

class BatsmanNStriker {
    int batBalls;
    int batDots;
    int batFours;
    int batId;
    String batName;
    int batMins;
    int batRuns;
    int batSixes;
    double batStrikeRate;

    BatsmanNStriker({
        required this.batBalls,
        required this.batDots,
        required this.batFours,
        required this.batId,
        required this.batName,
        required this.batMins,
        required this.batRuns,
        required this.batSixes,
        required this.batStrikeRate,
    });

    factory BatsmanNStriker.fromJson(Map<String, dynamic> json) => BatsmanNStriker(
        batBalls: json["batBalls"],
        batDots: json["batDots"],
        batFours: json["batFours"],
        batId: json["batId"],
        batName: json["batName"],
        batMins: json["batMins"],
        batRuns: json["batRuns"],
        batSixes: json["batSixes"],
        batStrikeRate: json["batStrikeRate"],
    );

    Map<String, dynamic> toJson() => {
        "batBalls": batBalls,
        "batDots": batDots,
        "batFours": batFours,
        "batId": batId,
        "batName": batName,
        "batMins": batMins,
        "batRuns": batRuns,
        "batSixes": batSixes,
        "batStrikeRate": batStrikeRate,
    };
}

class BowlerStriker {
    int bowlId;
    String bowlName;
    int bowlMaidens;
    int bowlNoballs;
    double bowlOvs;
    int bowlRuns;
    int bowlWides;
    int bowlWkts;
    double bowlEcon;

    BowlerStriker({
        required this.bowlId,
        required this.bowlName,
        required this.bowlMaidens,
        required this.bowlNoballs,
        required this.bowlOvs,
        required this.bowlRuns,
        required this.bowlWides,
        required this.bowlWkts,
        required this.bowlEcon,
    });

    factory BowlerStriker.fromJson(Map<String, dynamic> json) => BowlerStriker(
        bowlId: json["bowlId"],
        bowlName: json["bowlName"],
        bowlMaidens: json["bowlMaidens"],
        bowlNoballs: json["bowlNoballs"],
        bowlOvs: json["bowlOvs"]?.toDouble(),
        bowlRuns: json["bowlRuns"],
        bowlWides: json["bowlWides"],
        bowlWkts: json["bowlWkts"],
        bowlEcon: json["bowlEcon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "bowlId": bowlId,
        "bowlName": bowlName,
        "bowlMaidens": bowlMaidens,
        "bowlNoballs": bowlNoballs,
        "bowlOvs": bowlOvs,
        "bowlRuns": bowlRuns,
        "bowlWides": bowlWides,
        "bowlWkts": bowlWkts,
        "bowlEcon": bowlEcon,
    };
}

class LatestPerformance {
    int runs;
    int wkts;
    String label;

    LatestPerformance({
        required this.runs,
        required this.wkts,
        required this.label,
    });

    factory LatestPerformance.fromJson(Map<String, dynamic> json) => LatestPerformance(
        runs: json["runs"],
        wkts: json["wkts"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "runs": runs,
        "wkts": wkts,
        "label": label,
    };
}

class MatchScoreDetails {
    int matchId;
    List<InningsScoreList> inningsScoreList;
    TossResults tossResults;
    List<MatchTeamInfo> matchTeamInfo;
    bool isMatchNotCovered;
    String matchFormat;
    String state;
    String customStatus;
    int highlightedTeamId;

    MatchScoreDetails({
        required this.matchId,
        required this.inningsScoreList,
        required this.tossResults,
        required this.matchTeamInfo,
        required this.isMatchNotCovered,
        required this.matchFormat,
        required this.state,
        required this.customStatus,
        required this.highlightedTeamId,
    });

    factory MatchScoreDetails.fromJson(Map<String, dynamic> json) => MatchScoreDetails(
        matchId: json["matchId"],
        inningsScoreList: List<InningsScoreList>.from(json["inningsScoreList"].map((x) => InningsScoreList.fromJson(x))),
        tossResults: TossResults.fromJson(json["tossResults"]),
        matchTeamInfo: List<MatchTeamInfo>.from(json["matchTeamInfo"].map((x) => MatchTeamInfo.fromJson(x))),
        isMatchNotCovered: json["isMatchNotCovered"],
        matchFormat: json["matchFormat"],
        state: json["state"],
        customStatus: json["customStatus"],
        highlightedTeamId: json["highlightedTeamId"],
    );

    Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "inningsScoreList": List<dynamic>.from(inningsScoreList.map((x) => x.toJson())),
        "tossResults": tossResults.toJson(),
        "matchTeamInfo": List<dynamic>.from(matchTeamInfo.map((x) => x.toJson())),
        "isMatchNotCovered": isMatchNotCovered,
        "matchFormat": matchFormat,
        "state": state,
        "customStatus": customStatus,
        "highlightedTeamId": highlightedTeamId,
    };
}

class InningsScoreList {
    int inningsId;
    int batTeamId;
    String batTeamName;
    int score;
    int wickets;
    double overs;
    bool isDeclared;
    bool isFollowOn;
    int ballNbr;

    InningsScoreList({
        required this.inningsId,
        required this.batTeamId,
        required this.batTeamName,
        required this.score,
        required this.wickets,
        required this.overs,
        required this.isDeclared,
        required this.isFollowOn,
        required this.ballNbr,
    });

    factory InningsScoreList.fromJson(Map<String, dynamic> json) => InningsScoreList(
        inningsId: json["inningsId"],
        batTeamId: json["batTeamId"],
        batTeamName: json["batTeamName"],
        score: json["score"],
        wickets: json["wickets"],
        overs: json["overs"]?.toDouble(),
        isDeclared: json["isDeclared"],
        isFollowOn: json["isFollowOn"],
        ballNbr: json["ballNbr"],
    );

    Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "batTeamId": batTeamId,
        "batTeamName": batTeamName,
        "score": score,
        "wickets": wickets,
        "overs": overs,
        "isDeclared": isDeclared,
        "isFollowOn": isFollowOn,
        "ballNbr": ballNbr,
    };
}

class MatchUdrs {
    int matchId;
    int inningsId;
    DateTime timestamp;
    int team1Id;
    int team1Remaining;
    int team1Successful;
    int team1Unsuccessful;
    int team2Id;
    int team2Remaining;
    int team2Successful;
    int team2Unsuccessful;

    MatchUdrs({
        required this.matchId,
        required this.inningsId,
        required this.timestamp,
        required this.team1Id,
        required this.team1Remaining,
        required this.team1Successful,
        required this.team1Unsuccessful,
        required this.team2Id,
        required this.team2Remaining,
        required this.team2Successful,
        required this.team2Unsuccessful,
    });

    factory MatchUdrs.fromJson(Map<String, dynamic> json) => MatchUdrs(
        matchId: json["matchId"],
        inningsId: json["inningsId"],
        timestamp: DateTime.parse(json["timestamp"]),
        team1Id: json["team1Id"],
        team1Remaining: json["team1Remaining"],
        team1Successful: json["team1Successful"],
        team1Unsuccessful: json["team1Unsuccessful"],
        team2Id: json["team2Id"],
        team2Remaining: json["team2Remaining"],
        team2Successful: json["team2Successful"],
        team2Unsuccessful: json["team2Unsuccessful"],
    );

    Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "inningsId": inningsId,
        "timestamp": timestamp.toIso8601String(),
        "team1Id": team1Id,
        "team1Remaining": team1Remaining,
        "team1Successful": team1Successful,
        "team1Unsuccessful": team1Unsuccessful,
        "team2Id": team2Id,
        "team2Remaining": team2Remaining,
        "team2Successful": team2Successful,
        "team2Unsuccessful": team2Unsuccessful,
    };
}

class PartnerShip {
    int balls;
    int runs;

    PartnerShip({
        required this.balls,
        required this.runs,
    });

    factory PartnerShip.fromJson(Map<String, dynamic> json) => PartnerShip(
        balls: json["balls"],
        runs: json["runs"],
    );

    Map<String, dynamic> toJson() => {
        "balls": balls,
        "runs": runs,
    };
}

class PpData {
    Pp1 pp1;

    PpData({
        required this.pp1,
    });

    factory PpData.fromJson(Map<String, dynamic> json) => PpData(
        pp1: Pp1.fromJson(json["pp_1"]),
    );

    Map<String, dynamic> toJson() => {
        "pp_1": pp1.toJson(),
    };
}

class Pp1 {
    int ppId;
    double ppOversFrom;
    double ppOversTo;
    String ppType;
    int runsScored;

    Pp1({
        required this.ppId,
        required this.ppOversFrom,
        required this.ppOversTo,
        required this.ppType,
        required this.runsScored,
    });

    factory Pp1.fromJson(Map<String, dynamic> json) => Pp1(
        ppId: json["ppId"],
        ppOversFrom: json["ppOversFrom"]?.toDouble(),
        ppOversTo: json["ppOversTo"],
        ppType: json["ppType"],
        runsScored: json["runsScored"],
    );

    Map<String, dynamic> toJson() => {
        "ppId": ppId,
        "ppOversFrom": ppOversFrom,
        "ppOversTo": ppOversTo,
        "ppType": ppType,
        "runsScored": runsScored,
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
