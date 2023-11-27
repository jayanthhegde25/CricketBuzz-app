// To parse this JSON data, do
//
//     final squad = squadFromJson(jsonString);

import 'dart:convert';

Squad squadFromJson(String str) => Squad.fromJson(json.decode(str));

String squadToJson(Squad data) => json.encode(data.toJson());

class Squad {
    Players players;

    Squad({
        required this.players,
    });

    factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        players: Players.fromJson(json["players"]),
    );

    Map<String, dynamic> toJson() => {
        "players": players.toJson(),
    };
}

class Players {
    List<Bench> playingXi;
    List<Bench> bench;

    Players({
        required this.playingXi,
        required this.bench,
    });

    factory Players.fromJson(Map<String, dynamic> json) => Players(
        playingXi: List<Bench>.from(json["playing XI"].map((x) => Bench.fromJson(x))),
        bench: List<Bench>.from(json["bench"].map((x) => Bench.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "playing XI": List<dynamic>.from(playingXi.map((x) => x.toJson())),
        "bench": List<dynamic>.from(bench.map((x) => x.toJson())),
    };
}

class Bench {
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
    TeamName? teamName;
    int faceImageId;
    bool? isSupportStaff;

    Bench({
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

    factory Bench.fromJson(Map<String, dynamic> json) => Bench(
        id: json["id"],
        name: json["name"],
        fullName: json["fullName"],
        nickName: json["nickName"],
        captain: json["captain"],
        role: json["role"],
        keeper: json["keeper"],
        substitute: json["substitute"],
        teamId: json["teamId"],
        battingStyle: json["battingStyle"] !=null?battingStyleValues.map[json["battingStyle"]]:null,
        bowlingStyle: json["bowlingStyle"],
        teamName: json["teamName"] !=null ?teamNameValues.map[json["teamName"]]:null,
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
        "teamName": teamNameValues.reverse[teamName],
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

enum TeamName {
    IND
}

final teamNameValues = EnumValues({
    "IND": TeamName.IND
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
