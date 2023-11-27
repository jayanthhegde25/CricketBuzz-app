import 'dart:convert';
import 'dart:developer';

import 'package:cricbuzz/Api/base_client.dart';
import 'package:cricbuzz/Api/match_api.dart';
import 'package:cricbuzz/models/commentary.dart';
import 'package:cricbuzz/models/get_info.dart';
import 'package:cricbuzz/models/match_list.dart';
import 'package:cricbuzz/models/score_card.dart';
import 'package:cricbuzz/models/squads_model.dart';
import 'package:cricbuzz/models/upcoming_matches.dart';
import 'package:http/http.dart' as http;

BaseClient baseClient = BaseClient();

class ApiCall{

   static Future<MatchList?> matchListsGet() async {
    String endpoint = MatchApis.matches;

    http.Response? response = await baseClient.getData(endpoint);
      if(response != null){
        return MatchList?.fromJson(jsonDecode(response.body));
      }
      else{
        return null;
      }
      
   }

   static Future<UpcomingMatches?> upcomingLists() async {
    String endpoint = MatchApis.upcoming;

    http.Response? response = await baseClient.getData(endpoint);
      if(response != null){
        return UpcomingMatches?.fromJson(jsonDecode(response.body));
      }
      else{
        return null;
      }
      
   }

   static Future<ScoreCard?> scoredBoard(String matchId)async{
    log("print 1 matchId${matchId}");
    String endpoint = 'mcenter/v1/$matchId/scard';
    http.Response? response = await baseClient.getData(endpoint);
      if(response != null){
        return ScoreCard?.fromJson(jsonDecode(response.body));
      }
      else{
        return null;
      }
   }

   static Future<Commentary?> getCommentary(String matchId)async{
    String endpoint = 'mcenter/v1/$matchId/comm';
    http.Response? response = await baseClient.getData(endpoint);
    if(response != null){
      return Commentary?.fromJson(jsonDecode(response.body));
    }
    else{
      return null;
    }
    
   }
   static Future<Squad?> getSquad(String teamId, String matchId)async{
  
    String endpoint = 'mcenter/v1/$matchId/team/$teamId';
    http.Response? response = await baseClient.getData(endpoint);
    if(response != null){
      return Squad?.fromJson(jsonDecode(response.body));
    }
    else{
      return null;
    }
    
   }
   static Future<Info?> getInfo(String matchId)async{
  
    String endpoint = 'mcenter/v1/$matchId';
    http.Response? response = await baseClient.getData(endpoint);
    if(response != null){
      return Info?.fromJson(jsonDecode(response.body));
    }
    else{
      return null;
    }
    
   }

  


}