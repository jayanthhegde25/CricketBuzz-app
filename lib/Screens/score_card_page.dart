import 'package:cricbuzz/Screens/commentary/commentary.dart';
import 'package:cricbuzz/Screens/home_page.dart';
import 'package:cricbuzz/Screens/info/info_page.dart';
import 'package:cricbuzz/Screens/scoreCard/page_score_card.dart';
import 'package:cricbuzz/Screens/squad/squads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScoreBoardPage extends StatefulWidget {

  int index ;
   ScoreBoardPage({
    required this.index,
    super.key});

  @override
  State<ScoreBoardPage> createState() => _ScoreBoardPageState();
}

class _ScoreBoardPageState extends State<ScoreBoardPage> with SingleTickerProviderStateMixin {

   TabController? tabController2;


  @override
  void initState() {
   
    super.initState();
    tabController2 = TabController(length: 5, vsync: this,); // Number of tabs
  }

  @override
  void dispose() {
    tabController2?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: const Color.fromARGB(255, 0, 118, 61),
        leading: GestureDetector(
          onTap: (){
            setState(() {
              matchController.team1Players.clear();
              matchController.team1OnBench.clear();
              matchController.team1Support.clear();
              matchController.team2Players.clear();
              matchController.team2OnBench.clear();
              matchController.team2Support.clear();
              matchController.firstTeambatList.clear();
              matchController.firstTeamNotBatted.clear();
              matchController.secondTeambatList.clear();
              matchController.secondTeamNotBatted.clear();
              matchController.wicketsTeam1.clear();
               matchController.wicketsTeam2.clear();
            });
            Navigator.of(context).pop();
          
          },
        child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        centerTitle: false,
        title: Row(
          children: [
             Text(
              matchController.matches[widget.index].matchInfo.team1.teamSName,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500
            )),


             Text(" vs ",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500
            )),

             Text(
              matchController.matches[widget.index].matchInfo.team2.teamSName,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500
            )),

             Text(",",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white
            )),

            Expanded(
              child: Text(
                matchController.matches[widget.index].matchInfo.matchDesc,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500
              )),
            ),
          ],
        ),
        bottom:  TabBar(
              isScrollable: true,
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              labelStyle:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
              indicatorWeight:4,
              indicatorColor: Colors.red,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white38,
              controller: tabController2,
              tabs: const [
                Tab(text: 'Info',),
                Tab(text: 'Squads'),
                Tab(text: 'Scorecard',),
                Tab(text: 'Commentary'),
              ]),

      ),
      body: TabBarView(
            controller: tabController2,
             children:  [
              const InfoPage(),
              SquadsPage(index: widget.index),
              ParticularScore(index:widget.index,),  
              CommentaryPage(index: widget.index,),  
              ]
            )
       

    );
  }
}