
import 'dart:developer';

import 'package:cricbuzz/Api/base_client.dart';
import 'package:cricbuzz/controller/api_call.dart';
import 'package:cricbuzz/models/commentary.dart';
import 'package:cricbuzz/models/get_info.dart' as get_info;
import 'package:cricbuzz/models/match_list.dart' as list_match;
import 'package:cricbuzz/models/score_card.dart';
import 'package:cricbuzz/models/squads_model.dart';
import 'package:cricbuzz/models/upcoming_matches.dart' ;
import 'package:get/get.dart';

BaseClient baseClient = BaseClient();

class MatchController extends GetxController {
var isLoading = true.obs;
 RxList<list_match.TypeMatch> matchLists = <list_match.TypeMatch>[].obs ;
 RxList<list_match.Match> matches = <list_match.Match>[].obs;

 RxList<MatchScheduleMap?> upcomingLists = <MatchScheduleMap>[].obs;
 RxList<MatchScheduleList?> listUpcoming = <MatchScheduleList>[].obs;
 RxList<MatchInfo> matchInfo = <MatchInfo>[].obs;

 RxList<ScoreCardElement> boards = <ScoreCardElement>[].obs;
 RxMap<String ,BatsmenDatum> secondTeamScoreCards = <String ,BatsmenDatum>{}.obs;
 RxMap<String ,BatsmenDatum> firstTeamScoreCards = <String ,BatsmenDatum>{}.obs;
 List<ScoreCardElement> firstTeam =<ScoreCardElement>[].obs;
 List<ScoreCardElement> secondTeam =<ScoreCardElement>[].obs;

 RxList<BatsmenDatum> firstTeambatList = <BatsmenDatum>[].obs;
 RxList<BatsmenDatum> secondTeambatList = <BatsmenDatum>[].obs;
  RxList<BatsmenDatum> firstTeamNotBatted = <BatsmenDatum>[].obs;
  RxList<BatsmenDatum> secondTeamNotBatted = <BatsmenDatum>[].obs;
  RxList<WicketsDatum?> wicketsTeam1 = <WicketsDatum>[].obs;
  RxList<WicketsDatum?> wicketsTeam2 = <WicketsDatum>[].obs;

 int targetInningsId = 1;

 RxList<CommentaryList?> commentaryList  = <CommentaryList>[].obs;

 RxList<Bench?> teamSquadList =  <Bench>[].obs;
  RxList<Bench?> onBenchList =  <Bench>[].obs;
 

  // get_info.Team?  team1;
   get_info.Info? info;
  RxList<get_info.PlayerDetail?> team1Players =  <get_info.PlayerDetail>[].obs; 
  RxList<get_info.PlayerDetail?> team1OnBench =  <get_info.PlayerDetail>[].obs; 
  RxList<get_info.PlayerDetail?> team1Support=  <get_info.PlayerDetail>[].obs; 

  RxList<get_info.PlayerDetail?> team2Players =  <get_info.PlayerDetail>[].obs; 
  RxList<get_info.PlayerDetail?> team2OnBench =  <get_info.PlayerDetail>[].obs; 
  RxList<get_info.PlayerDetail?> team2Support=  <get_info.PlayerDetail>[].obs; 

  
  matchList() async{
   list_match. MatchList? matchList = await ApiCall.matchListsGet();
    matchLists.value = matchList!.typeMatches; 
      for (var cricket in matchLists){
        for (var seriesMatch in cricket.seriesMatches) {
          matches.addAll(seriesMatch.seriesAdWrapper?.matches ?? []);
        }
      }
     // print( 'matchLists${matches.length}');
  }

    upcomingMatches()async{
      UpcomingMatches? upcomingList = await ApiCall.upcomingLists();
      upcomingLists.value = upcomingList!.matchScheduleMap;
       // log(upcomingLists.length.toString());
      upcomingLists.removeWhere((element) => element!.scheduleAdWrapper == null);
      //  log(upcomingLists.length.toString());
      for(var upcoming in upcomingLists ){ 
        listUpcoming.addAll(upcoming!.scheduleAdWrapper!.matchScheduleList); 
        for(var matchIn in upcoming.scheduleAdWrapper!.matchScheduleList){
         matchInfo.addAll(matchIn.matchInfo);
        }
      }
    }
    
  scoreCard(String matchId)async {
    ScoreCard? score = await ApiCall.scoredBoard(matchId);
    boards.value = score!.scoreCard;
    firstTeam = boards.where((element) => element.inningsId == targetInningsId).toList(); 
    for(var list in firstTeam ){
      firstTeamScoreCards.addAll(list.batTeamDetails.batsmenData);
      wicketsTeam1.addAll(list.wicketsData.values);

      firstTeambatList.addAll(firstTeamScoreCards.values);
      firstTeambatList.removeWhere((element) => element.outDesc.isEmpty);

      ///////did not bet///////
      firstTeamNotBatted.addAll(firstTeamScoreCards.values);
      firstTeamNotBatted.removeWhere((element) => element.outDesc.isNotEmpty);

    }
    secondTeam = boards.where((element) => element.inningsId != targetInningsId).toList();
     for(var list in secondTeam){ 
      secondTeamScoreCards.addAll(list.batTeamDetails.batsmenData);
      wicketsTeam2.addAll(list.wicketsData.values);
      
       secondTeambatList.addAll(secondTeamScoreCards.values);
       secondTeambatList.removeWhere((element)=> element.outDesc.isEmpty);

       //////////did not bet///////////
       secondTeamNotBatted.addAll(secondTeamScoreCards.values);
       secondTeamNotBatted.removeWhere((element) => element.outDesc.isNotEmpty);   
     
  }
  }

    commentary(String matchId) async{
        Commentary? commen = await ApiCall.getCommentary(matchId);
        commentaryList.value = commen!.commentaryList;
    }

    teamSquads(String teamId, String matchId) async{
        log('match id $matchId');
        Squad? squad = await ApiCall.getSquad(teamId,matchId);
        teamSquadList.value = squad!.players.playingXi;
        onBenchList.value = squad.players.bench;
      
    } 

    getMatchInfo(String matchId) async{
      // get_info.Info? 
      info = await ApiCall.getInfo(matchId);

      ///team1 players list
      team1Players.addAll(info!.matchInfo.team1.playerDetails);
      team1Players.removeWhere((element) => element!.substitute == true);
      team1Players.removeWhere((element) => element!.isSupportStaff == true);

      /////team1 players onbench
      team1OnBench.addAll(info!.matchInfo.team1.playerDetails);
      team1OnBench.removeWhere((element) => element!.substitute == false);
      team1OnBench.removeWhere((element) => element!.isSupportStaff == true);

      /// team1 support staff
      team1Support.addAll(info!.matchInfo.team1.playerDetails);
      team1Support.removeWhere((element) => element!.substitute == false);
      team1Support.removeWhere((element) => element!.substitute == true);

    ///////////////---------------------------------------------------------
    
       ///team2 players list
      team2Players.addAll(info!.matchInfo.team2.playerDetails);
      team2Players.removeWhere((element) => element!.substitute == true);
      team2Players.removeWhere((element) => element!.isSupportStaff == true);

       /////team1 players onbench
      team2OnBench.addAll(info!.matchInfo.team2.playerDetails);
      team2OnBench.removeWhere((element) => element!.substitute == false);
      team2OnBench.removeWhere((element) => element!.isSupportStaff == true);

      /// team1 support staff
      team2Support.addAll(info!.matchInfo.team2.playerDetails);
      team2Support.removeWhere((element) => element!.substitute == false);
      team2Support.removeWhere((element) => element!.substitute == true);

     
     


    } 
 }
 

