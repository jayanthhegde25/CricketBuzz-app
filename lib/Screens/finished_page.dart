
import 'package:cricbuzz/Screens/score_card_page.dart';
import 'package:cricbuzz/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({super.key});

  @override
  State<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  bool isdropdown = true;
  MatchController matchController = Get.put(MatchController());

  @override
  void initState() {
   matchController.matchList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
       child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount:matchController.matches.length,
          itemBuilder: (context, index){
          return GestureDetector(
            onTap: ()async{
              setState((){
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

              await matchController.getMatchInfo(matchController.matches[index].matchInfo.matchId.toString());
              await matchController.commentary(matchController.matches[index].matchInfo.matchId.toString());
              await matchController.scoreCard(matchController.matches[index].matchInfo.matchId.toString());

              // log(matchController.team2.length);
                
              Get.to(()=>  ScoreBoardPage(index: index,));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${matchController.matches[index].matchInfo.matchDesc},${matchController.matches[index].matchInfo.seriesName}",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey[600],
                            
                        ),
                        ),
                      ),
                     
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Container(
                        width: 20.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.matches[index].matchInfo.team1.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                       ),
                              SizedBox(width: 10.w,),
                              Text(matchController.matches[index].matchInfo.team1.teamSName,
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.black,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                             SizedBox(width: 6.w,),
                              Text(matchController.matches[index].matchScore?.team1Score.inngs1.runs.toString()??'',
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                              Text("-",
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                             Text(matchController.matches[index].matchScore?.team1Score.inngs1.wickets.toString()??'',
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                              SizedBox(width: 8.w,),
                              Text(matchController.matches[index].matchScore?.team1Score.inngs1.overs.toString()??'',
                               style: TextStyle(
                                 fontSize: 12.sp,
                                 color: Colors.grey[700],
                                 fontWeight: FontWeight.w400
                                ),
                              ),
                
                            ],
                          ),
                
                           SizedBox(height: 5.h,),
                           Row(
                            children: [
                              Container(
                        width: 20.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.matches[index].matchInfo.team2.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                       ),
                              SizedBox(width: 10.w,),
                              Text(matchController.matches[index].matchInfo.team2.teamSName,
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.black,
                                 fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(width: 10.w,),
                               Text(matchController.matches[index].matchScore?.team2Score?.inngs1.runs.toString()??'',
                                style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                              Text("-",
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                             Text(matchController.matches[index].matchScore?.team2Score?.inngs1.wickets.toString()??'',
                               style: TextStyle(
                                 fontSize: 16.sp,
                                 color: Colors.blue,
                                 fontWeight: FontWeight.w400
                                ),
                             ),
                              SizedBox(width: 8.w,),
                              Text(matchController.matches[index].matchScore?.team2Score?.inngs1.overs.toString()??'',
                               style: TextStyle(
                                 fontSize: 12.sp,
                                 color: Colors.grey[700],
                                 fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                           )
                        ],
                      ),
                    SizedBox(width: 16.w,),
                      
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(width: 1,color: Colors.grey))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(matchController.matches[index].matchInfo.status,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color.fromARGB(255, 1, 119, 174),
                            fontWeight: FontWeight.w400
                              
                          ),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );             
        })
    );
  }
}