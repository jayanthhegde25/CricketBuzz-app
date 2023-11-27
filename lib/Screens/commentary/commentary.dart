import 'package:cricbuzz/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentaryPage extends StatefulWidget {
  int index;
   CommentaryPage({
     required this.index,
    super.key});

  @override
  State<CommentaryPage> createState() => _CommentaryPageState();
}

class _CommentaryPageState extends State<CommentaryPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                      margin: EdgeInsets.only(top: 16.h,),
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
      
                    Container(
                      margin: EdgeInsets.only(top: 16.h,),
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
                      "(${matchController.matches[widget.index].matchScore?.team2Score!.inngs1.overs.toString()??''})",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color:const Color.fromARGB(255, 39, 39, 39),
                        fontWeight: FontWeight.w400
                      ),
                     ),
                                  
                                  
                                  
                    ],
                   ),
                                  
                 ),
      
              ],
            ),
      
            SizedBox(height: 20.h,),
            Center(
            child: Text(matchController.matches[widget.index].matchInfo.status,
             style: TextStyle(
             fontSize: 13.sp,
             color: const Color.fromARGB(255, 1, 119, 174),
             fontWeight: FontWeight.w600 ),),
          ),
          SizedBox(height: 20.h,),
      
      
            
            
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: matchController.commentaryList.length,
              itemBuilder: (context,index){
                var commenLength = matchController.commentaryList[index];
              return Column(
                children: [
                  Text(commenLength!.commText,
                  textAlign: TextAlign.justify,),
                  SizedBox(height: 20.h,)
                ],
              );
                  
            })
            
          
          ],
        ),
      ),
    );
  }
}