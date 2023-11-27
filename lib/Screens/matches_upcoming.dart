import 'dart:developer';
import 'package:cricbuzz/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpcomingMatchList extends StatefulWidget {
  const UpcomingMatchList({super.key});

  @override
  State<UpcomingMatchList> createState() => _UpcomingMatchListState();
}

class _UpcomingMatchListState extends State<UpcomingMatchList> {
   MatchController matchController = Get.put(MatchController());
   @override
  void initState() {
    matchController.upcomingMatches();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int selectedIndex = -1;

    return ListView.builder(
     shrinkWrap: true,
       itemCount:matchController.upcomingLists.length,
       itemBuilder: (context, index){
         var item = matchController.upcomingLists[index];
         // log(item!.scheduleAdWrapper.toString());
       return Column(
         children: [
           GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
                
              });
              log(selectedIndex.toString());
            },
             child: Container(
              margin: EdgeInsets.only(top: 12.h),
               padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8.w),
               decoration:   BoxDecoration(
                border: Border(top: BorderSide(width: 1,color: Colors.grey.shade400),bottom:BorderSide(width: 1,color: Colors.grey.shade400) )
                
               ),
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(item!.scheduleAdWrapper!.date,
                       style: TextStyle(
                         fontSize: 13.sp,
                         color: const Color.fromARGB(255, 0, 0, 0),
                         fontWeight: FontWeight.w500
                       ),),
                      // selectedIndex == index?Icon(Icons.arrow_drop_up): Icon(Icons.arrow_drop_down)
                     ],
                   ),
                 ]
               )
             ),
           ),
               
                 ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: item.scheduleAdWrapper!.matchScheduleList.length,
                  itemBuilder: (context,index){
                    var schedule = item.scheduleAdWrapper!.matchScheduleList[index];
                   return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                        decoration:  const BoxDecoration(
                           color:Color.fromARGB(255, 208, 230, 237),
                            // Color.fromARGB(255, 216, 233, 252),
                          
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(item.scheduleAdWrapper!.matchScheduleList[index].seriesName,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 13, 105, 180),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),),
                            ),
                          ],
                        )
                       ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: schedule.matchInfo.length,
                            itemBuilder: (context,index){
                              int time = int.parse(schedule.matchInfo[index].startDate);
                               DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
                               String formattedDate = formatDateWithAMPM(date);
                              
                                
                            return GestureDetector(
                              onTap: (){
                                //  matchController.scoreCard(matchController.matches[index].matchInfo.matchId.toString());
                                //  Get.to(()=>  ScoreBoardPage(index: index,));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
                                margin: EdgeInsets.only(bottom: 10.h,),
                                decoration: BoxDecoration(
                                   color: Colors.grey[100],
                                 
                                  border: Border(bottom: BorderSide( width:1,color: Colors.grey.shade300))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text("${schedule.matchInfo[index].matchFormat}-${schedule.matchInfo[index].matchDesc}",
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[700],
                                          
                            
                                        )
                                        ),
                                      
                                        Text(formattedDate,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color.fromARGB(255, 60, 0, 0),
                                          fontWeight: FontWeight.w500
                            
                                        ),),
                            
                                       
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                    
                                    Row(
                                      children: [
                        Container(
                        width: 20.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${schedule.matchInfo[index].team1.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': '019f2cfd9dmsh53d65439fef7340p195021jsnca3a8c7a30f8',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                       ),
                                        SizedBox(width: 8.h,),
                                        Text(schedule.matchInfo[index].team1.teamName,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                      SizedBox(height: 10.h,),
                                    Row(
                                      children: [
                                        Container(
                        width: 20.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${schedule.matchInfo[index].team2.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': '019f2cfd9dmsh53d65439fef7340p195021jsnca3a8c7a30f8',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                      ),
                       SizedBox(width: 8.h,),
                                        Text(schedule.matchInfo[index].team2.teamName,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          Icon(Icons.pin_drop,size: 16.sp,),
                                            SizedBox(width: 4.h,),
                                          Expanded(
                                            child: Text('${schedule.matchInfo[index].venueInfo.ground} - ${schedule.matchInfo[index].venueInfo.city}',
                                            style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w400
                                            ),
                                            ),
                                          ),
                                           
                                        ],
                                      ),
                            
                                   
                            
                                  ],
                                ),
                              ),
                            );
                          })
                            
                          ],
                        
                   );
                 })
               
               
                 
               ],
       );             
     });
  }
  String formatDateWithAMPM(DateTime date) {
  // Use the intl package for formatting
  // Add 'am' or 'pm' to the end of the formatted string
  return " Starts at -${DateFormat(' hh:mm').format(date)} ${DateFormat('a').format(date)}";
}
}