
import 'dart:developer';

import 'package:cricbuzz/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParticularScore extends StatefulWidget {
  int index;
  ParticularScore({
    required this.index,
    super.key});

  @override
  State<ParticularScore> createState() => _ParticularScoreState();
}

class _ParticularScoreState extends State<ParticularScore> {
  MatchController matchController = Get.put(MatchController());

 
  bool isFirstList = true;
  bool isSecondList = false;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                   
                   
                  });
      
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1,color: const Color(0xff636363)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text( matchController.matches[widget.index].matchInfo.team1.teamSName,
                      style: TextStyle(
                       fontSize: 14.sp,
                       color: Colors.black,
                       fontWeight: FontWeight.w500)
                      ),
                
                      SizedBox(width: 8.w,),
                      Text(matchController.matches[widget.index].matchScore!.team1Score.inngs1.runs.toString(),
                      style: TextStyle(
                       fontSize: 14.sp,
                       color:  Colors.black,
                       fontWeight: FontWeight.w500)
                      ),
                
                      Text("-",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                
                      Text(matchController.matches[widget.index].matchScore?.team1Score.inngs1.wickets.toString()??'',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color:  Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                     ), SizedBox(width: 5.w,),
                
                     Text(
                      "(${matchController.matches[widget.index].matchScore?.team1Score.inngs1.overs.toString()??''})",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromARGB(255, 39, 39, 39),
                        fontWeight: FontWeight.w400
                      ),
                     ),
                    ],
                  ),
                
                ),
              ),
      
              GestureDetector(
                onTap: (){
                  setState(() {
                   
                    
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16.h),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    border: Border.all(width: 1,color: const Color(0xff636363)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text( matchController.matches[widget.index].matchInfo.team2.teamSName,
                      style: TextStyle(
                       fontSize: 14.sp,
                       color: Colors.black,
                       fontWeight: FontWeight.w400)
                      ),
                
                      SizedBox(width: 8.w,),
                      Text(matchController.matches[widget.index].matchScore!.team2Score!.inngs1.runs.toString(),
                      style: TextStyle(
                       fontSize: 14.sp,
                       color: Colors.black,
                       fontWeight: FontWeight.w500)
                      ),
                
                      Text("-",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                
                      Text(matchController.matches[widget.index].matchScore?.team2Score!.inngs1.wickets.toString()??'',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                     ), SizedBox(width: 5.w,),
                
                     Text(
                      "(${matchController.matches[widget.index].matchScore!.team2Score!.inngs1.overs.toString()??''})",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color:const Color.fromARGB(255, 39, 39, 39),
                        fontWeight: FontWeight.w400
                      ),
                     ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h,),
          Center(
            child: Text(matchController.matches[widget.index].matchInfo.status,
             style: TextStyle(
             fontSize: 13.sp,
             color: const Color.fromARGB(255, 1, 119, 174),
             fontWeight: FontWeight.w600 ),),
          ),

          SizedBox(height: 14.h,),
          ListView.builder(
             padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: matchController.firstTeam.length,
            itemBuilder: (context,index){
              var team1 =  matchController.firstTeam[index];
              // log(matchController.firstTeam.length.toString());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                       isFirstList = !isFirstList;
                       isSecondList = false;
                    });

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: isFirstList?const Color.fromARGB(255, 0, 118, 61):Colors.grey.shade100,
                      border: Border.all(width: 1,color: Colors.grey.shade300)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(team1.batTeamDetails.batTeamName,
                        style: TextStyle(
                          color:isFirstList?Colors.white:Colors.black ,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500
                        ),),
                       isFirstList? const Icon(Icons.arrow_drop_up,
                       color: Colors.white,
                       ): const Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ),
                ),

               isFirstList? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Batter",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("R",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("B",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                               
                                      
                                Text("6s",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                color:  Colors.black
                                ),),
                               
                                      
                                Text("4s",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                              
                                      
                                Text("SR",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                                
                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:  matchController.firstTeambatList.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Expanded(
                                flex: 3,
                                 child: Row(
                                   children: [
                                     Text(matchController.firstTeambatList[index].batName,
                                      style: TextStyle(fontSize: 12.sp,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),),
                                       matchController.firstTeambatList[index].isCaptain? Text("(c)",style: TextStyle(fontSize: 11.sp,color: Colors.blueAccent),):
                                       matchController.firstTeambatList[index].isKeeper? Text("(wk)",style: TextStyle(fontSize: 11.sp,color: Colors.blueAccent),):
                                  const Text(""),
                                   ],
                                 ),
                               ),
                              
                                // const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeambatList[index].runs.toString(),
                                      style: TextStyle(fontSize: 11.sp),
                                      ),
                                      //  SizedBox(width: 20.w,),
                                  Text(matchController.firstTeambatList[index].balls.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.firstTeambatList[index].sixes.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.firstTeambatList[index].fours.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.firstTeambatList[index].strikeRate.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                            SizedBox(height: 0.h,),
                            Text(matchController.firstTeambatList[index].outDesc,
                            style: TextStyle(fontSize: 11.sp,color: Colors.grey[700]),)
                          ],
    
                        )
                     
                  );
                 }),

                 Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                              Row(
                                children: [
                                  Text("Extras",
                                   style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                  ),
                                  ),
                                ],
                              ),       
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(matchController.firstTeam[index].extrasData.total.toString(),
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),

                                SizedBox(width: 8.w,),
                                
                                    
                              Text("b\t",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.grey.shade600
                              ),),
                               Text("${matchController.firstTeam[index].extrasData.byes.toString()},",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.grey.shade600
                                  ),),

                                SizedBox(width: 4.w,),
                               
                                    
                              Text("lb\t",
                               style: TextStyle(
                                fontSize: 12.sp,
                              color:  Colors.grey.shade600
                              ),),
                               Text("${matchController.firstTeam[index].extrasData.legByes.toString()},",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.grey.shade600
                                  ),),

                              SizedBox(width: 4.w,),

                               
                                    
                              Text("w\t",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.grey.shade600
                              ),),
                               Text("${matchController.firstTeam[index].extrasData.wides.toString()},",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.grey.shade600
                                  ),),

                              SizedBox(width: 4.w,),
                              
                                    
                              Text("nb\t",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.grey.shade600
                              ),),
                              Text("${matchController.firstTeam[index].extrasData.noBalls.toString()},",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.grey.shade600
                                  ),),

                              SizedBox(width: 4.w,),
                               Text("p\t",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.grey.shade600
                              ),),
                              Text("${matchController.firstTeam[index].extrasData.penalty.toString()},",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.grey.shade600
                                  ),),
                              
                                ],
                              ),
                              
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1,color: Colors.grey.shade200))
                      ),
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                              Row(
                                children: [
                                  Text("Total",
                                   style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                  ),
                                  ),
                                ],
                              ),       
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(matchController.firstTeam[index].scoreDetails.runs.toString(),
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),  
                              Text("-",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.black
                              ),),
                               Text("${matchController.firstTeam[index].scoreDetails.wickets}",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),

                                SizedBox(width: 4.w,),

                               Text("(${matchController.firstTeam[index].scoreDetails.overs.toString()})",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),
                                ],
                              ),     
                        ],
                      ),
                    ),
                    matchController.firstTeamNotBatted.isNotEmpty? 
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.w),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1,color: Colors.grey.shade200))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Did not bat",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500
                          ),),

                       
                         Container(
                          height: 40.h,
                           child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                              itemCount: matchController.firstTeamNotBatted.length,
                              itemBuilder: (context,index){
                              return Row(
                                children: [
                                  Text("${matchController.firstTeamNotBatted[index].batName},\t"),

                                ],
                              );
                            }),
                         ),
                        ],
                      ),
                    ):Container(),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Bowler",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("O",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("M",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                               
                                      
                                Text("R",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                color:  Colors.black
                                ),),
                               
                                      
                                Text("W",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                              
                                      
                                Text("ER",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                                
                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                
                   Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                     child: Column(
                       children: [
                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl1.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl2.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl3.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl4.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl5.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.overs !=0? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl6!.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),

                         matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName == "null"?const Divider(
                          thickness: 0.4,
                         ):Container(),
                          matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName == "null"? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl7?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),


                          matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName == "null"? const Divider(
                          thickness: 0.4,
                         ):Container(),

                          matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName == "null"? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl8?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),

                         matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName == "null" ?
                          const Divider(
                          thickness: 0.4,
                         ):Container(),
                          matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName == "null" ? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.firstTeam[index].bowlTeamDetails.bowlersData.bowl9?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),





                       ],
                     )
                   ),

                   Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Fall of Wickets",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Score",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("Over",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),

                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                  ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.wicketsTeam1.length,
                  itemBuilder: (context,index){
                  log( matchController.wicketsTeam1.length.toString());
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Expanded(
                                flex: 3,
                                 child: Row(
                                   children: [
                                     Text(matchController.wicketsTeam1[index]!.batName ,
                                      style: TextStyle(fontSize: 12.sp,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),),
                                      
                                   ],
                                 ),
                               ),
                              
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  
                                  Text("${matchController.wicketsTeam1[index]!.wktRuns.toString()}-${matchController.wicketsTeam1[index]!.wktNbr.toString()}",
                                  style: TextStyle(fontSize: 11.sp),),
                            
                                  Text(matchController.wicketsTeam1[index]!.wktOver.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                           
                          ],
    
                        )
                     
                  );
                 }),

                 Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("PowerPlay",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Overs",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("Runs",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),

                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                      child: Row(
                        children: [
                           Expanded(
                             flex: 3,
                            child: Text("mandatory",
                            style:TextStyle(fontSize: 13.sp,color:Colors.grey[800]))),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [  
                                Text("${matchController.firstTeam[index].ppData.pp1.ppOversFrom}-${matchController.secondTeam[index].ppData.pp1.ppOversTo}",
                                style: TextStyle(
                                  fontSize: 12.sp
                                ),),
                                Text(matchController.firstTeam[index].ppData.pp1.runsScored.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp
                                ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    )


       
              
            ]
            ):Container(),

              ]
            );
            }),

            
///////////////////second team list////////////////////////
          ListView.builder(
             padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: matchController.secondTeam.length,
            itemBuilder: (context,index){
              var team2 =  matchController.secondTeam[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isSecondList = !isSecondList;
                      isFirstList = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: isSecondList?const Color.fromARGB(255, 0, 118, 61):Colors.grey.shade100,
                      border: Border.all(width: 1,color: Colors.grey.shade300)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(team2.batTeamDetails.batTeamName,
                        style: TextStyle(
                          color: isSecondList?Colors.white:Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500
                        ),),
                         isSecondList? const Icon(Icons.arrow_drop_up,color: Colors.white,): const Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ),
                ),
               isSecondList? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Batter",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("R",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("B",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                               
                                      
                                Text("6s",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                color:  Colors.black
                                ),),
                               
                                      
                                Text("4s",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                              
                                      
                                Text("SR",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                                
                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                 ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:  matchController.secondTeambatList.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Expanded(
                                flex: 3,
                                 child: Row(
                                   children: [
                                     Text(matchController.secondTeambatList[index].batName,
                                      style: TextStyle(fontSize: 12.sp,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),),
                                       matchController.secondTeambatList[index].isCaptain? Text("(c)",style: TextStyle(fontSize: 11.sp,color: Colors.blueAccent),):
                                       matchController.secondTeambatList[index].isKeeper? Text("(wk)",style: TextStyle(fontSize: 11.sp,color: Colors.blueAccent),):
                                  const Text(""),
                                   ],
                                 ),
                               ),
                              
                                // const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeambatList[index].runs.toString(),
                                      style: TextStyle(fontSize: 11.sp),
                                      ),
                                      //  SizedBox(width: 20.w,),
                                  Text(matchController.secondTeambatList[index].balls.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.secondTeambatList[index].sixes.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.secondTeambatList[index].fours.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                  // SizedBox(width: 20.w,),
                                  Text(matchController.secondTeambatList[index].strikeRate.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                            SizedBox(height: 0.h,),
                            Text(matchController.secondTeambatList[index].outDesc,
                            style: TextStyle(fontSize: 10.sp,color: Colors.grey[700]),)
                          ],
    
                        )
                     
                  );
                 }),

                  Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Extras",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:4,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(matchController.secondTeam[index].extrasData.total.toString(),
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),

                                  SizedBox(width: 8.w,),
                                  
                                      
                                Text("b\t",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.grey.shade600
                                ),),
                                 Text("${matchController.secondTeam[index].extrasData.byes.toString()},",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.grey.shade600
                                    ),),

                                  SizedBox(width: 4.w,),
                               
                                      
                                Text("lb\t",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                color:  Colors.grey.shade600
                                ),),
                                 Text("${matchController.secondTeam[index].extrasData.legByes.toString()},",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.grey.shade600
                                    ),),

                                SizedBox(width: 4.w,),

                               
                                      
                                Text("w\t",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.grey.shade600
                                ),),
                                 Text("${matchController.secondTeam[index].extrasData.wides.toString()},",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.grey.shade600
                                    ),),

                                SizedBox(width: 4.w,),
                              
                                      
                                Text("nb\t",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.grey.shade600
                                ),),
                                Text("${matchController.secondTeam[index].extrasData.noBalls.toString()},",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.grey.shade600
                                    ),),

                                SizedBox(width: 4.w,),
                                 Text("p\t",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.grey.shade600
                                ),),
                                Text("${matchController.secondTeam[index].extrasData.penalty.toString()},",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.grey.shade600
                                    ),),
                                
                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1,color: Colors.grey.shade200))
                      ),
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                              Row(
                                children: [
                                  Text("Total",
                                   style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                  ),
                                  ),
                                ],
                              ),       
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(matchController.secondTeam[index].scoreDetails.runs.toString(),
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),  
                              Text("-",
                               style: TextStyle(
                                fontSize: 12.sp,
                                color:  Colors.black
                              ),),
                               Text("${matchController.secondTeam[index].scoreDetails.wickets}",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),

                                SizedBox(width: 4.w,),

                               Text("(${matchController.secondTeam[index].scoreDetails.overs.toString()})",
                                   style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  Colors.black
                                  ),),
                                ],
                              ),     
                        ],
                      ),
                    ),

                    matchController.secondTeamNotBatted.isNotEmpty?
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.w),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1,color: Colors.grey.shade200))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Did not bat",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500
                          ),),
                          
                        
                         Container(
                          // color: Colors.red,
                          height: 40.h,
                           child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                              itemCount: matchController.secondTeamNotBatted.length,
                              itemBuilder: (context,index){
                              return Row(
                                children: [
                                  Text("${matchController.secondTeamNotBatted[index].batName}, "),
                                
                                ],
                              );
                            }),
                        ),




                        ],
                      ),
                    ):Container(),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Bowler",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("O",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("M",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                               
                                      
                                Text("R",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                color:  Colors.black
                                ),),
                               
                                      
                                Text("W",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                              
                                      
                                Text("ER",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),
                                
                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                    Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                     child: Column(
                       children: [
                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl1.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl2.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl3.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl4.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                         Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.bowlName,
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.overs.toString(),
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.maidens.toString(),
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.runs.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.wickets.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl5.economy.toString(),
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ),

                         const Divider(
                          thickness: 0.4,
                         ),

                          matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.bowlName == "null" ? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl6?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),

                         matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName == "null"?const Divider(
                          thickness: 0.4,
                         ):Container(),
                          matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName == "null"? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl7?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),


                          matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName == "null"? const Divider(
                          thickness: 0.4,
                         ):Container(),

                          matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName == "null"? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl8?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),

                         matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName == "null" ?
                          const Divider(
                          thickness: 0.4,
                         ):Container(),
                          matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName == "null" ? Row(
                           children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.bowlName??"null",
                                    style: TextStyle(fontSize: 12.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),

                              Expanded(
                                flex: 3,
                                child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.overs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),  
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.maidens.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp),),
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.runs.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.wickets.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                      Text(matchController.secondTeam[index].bowlTeamDetails.bowlersData.bowl9?.economy.toString()??"0",
                                        style: TextStyle(fontSize: 11.sp), ), 
                                           

                                    ],
                                 
                                  ),
                              ),
                           ],
                         ):Container(),

                       ],
                     )
                   ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("Fall of Wickets",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Score",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("Over",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),

                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),

                  ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.wicketsTeam2.length,
                  itemBuilder: (context,index){
                 
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Expanded(
                                flex: 3,
                                 child: Row(
                                   children: [
                                     Text(matchController.wicketsTeam2[index]!.batName,
                                      style: TextStyle(fontSize: 12.sp,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),),
                                      
                                   ],
                                 ),
                               ),
                              
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                  
                                  Text("${matchController.wicketsTeam2[index]!.wktRuns.toString()}-${matchController.wicketsTeam2[index]!.wktNbr.toString()}",
                                  style: TextStyle(fontSize: 11.sp),),
                            
                                  Text(matchController.wicketsTeam2[index]!.wktOver.toString(),
                                  style: TextStyle(fontSize: 11.sp),),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                           
                          ],
    
                        )
                     
                  );
                 }),
                 Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100
                      ),
                      child: Row(
                        children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Text("PowerPlay",
                                     style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ],
                                ),
                              ),       
                              Expanded(
                                flex:3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Overs",
                                     style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  Colors.black
                                    ),),
                                  
                                      
                                Text("Runs",
                                 style: TextStyle(
                                  fontSize: 12.sp,
                                  color:  Colors.black
                                ),),

                                  ],
                                ),
                              ),
                              
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                      child: Row(
                        children: [
                           Expanded(
                             flex: 3,
                            child: Text("mandatory",
                            style:TextStyle(fontSize: 13.sp,color:Colors.grey[800]))),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [  
                                Text("${matchController.secondTeam[index].ppData.pp1.ppOversFrom}-${matchController.secondTeam[index].ppData.pp1.ppOversTo}",
                                style: TextStyle(
                                  fontSize: 12.sp
                                ),),
                                Text(matchController.secondTeam[index].ppData.pp1.runsScored.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp
                                ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    )








                  ],
              ):Container(),

              ]
            );
            }),
        ],
      
     )
    );
    }
  }
