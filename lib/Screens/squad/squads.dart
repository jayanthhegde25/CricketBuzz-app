import 'package:cricbuzz/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquadsPage extends StatefulWidget {
  int index;
   SquadsPage({
    required this.index,
    super.key});

  @override
  State<SquadsPage> createState() => _SquadsPageState();
}

class _SquadsPageState extends State<SquadsPage> {
    MatchController matchController = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 12.w),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 197, 227, 223),
            ),
            child: Row(
              children: [
               Container(
                        width: 25.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.matches[widget.index].matchInfo.team1.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                       ),
                SizedBox(width: 8.w,),
                Text( matchController.matches[widget.index].matchInfo.team1.teamSName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)
                ),
                const Spacer(),
                Text( matchController.matches[widget.index].matchInfo.team2.teamSName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)
                ),
                  SizedBox(width: 8.w,),
                Container(
                        width: 25.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.matches[widget.index].matchInfo.team2.imageId.toString()}/i.jpg',
                        fit: BoxFit.cover,
                        headers: const {
                            'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                            'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                        },
                        )
                       ),
    
               
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Center(child: Text("Playing XI",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),)),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:matchController.team1Players.length,
                  itemBuilder: (context,index){
                  return Container(
                    // margin: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(horizontal: 8.w,),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),
                      right: BorderSide(width: 1,color: Colors.grey.shade200)
                      )
                    ),
                  child:
                   Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team1Players[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       ),
                          SizedBox(width: 6.w,),
                           Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(matchController.team1Players[index]!.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:10.sp ),
                                    ),
                                   matchController.team1Players[index]!.captain == true? Text("(c)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:11.sp ),
                                    ): matchController.team1Players[index]!.keeper == true ? 
                                    Text("(wk)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:11.sp ),):const Text(""),
                                  ],
                                ),
                                Text(matchController.team1Players[index]!.role,
                                style: TextStyle(
                                  fontSize:10.sp,
                                  color: Colors.grey[600]
                                   ),
                                ),
                              ],
                           ),
                           ),
                        ],
                      )
                    ],
                  ),
                );
                }),
              ),
             
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:matchController.team2Players.length,
                  itemBuilder: (context,index) {
                    return Container(
                       padding: EdgeInsets.symmetric(horizontal: 8.w,),
                       decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),),),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [ 
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Row(
                               children: [
                                 Text(matchController.team2Players[index]!.name,
                                 textAlign: TextAlign.end,
                                   style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     fontSize:11.sp ),
                                   ),
                                   matchController.team2Players[index]!.captain == true? Text("(c)",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w500,
                                   fontSize:11.sp ),
                                 ): matchController.team2Players[index]!.keeper == true ? 
                                 Text("(wk)",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w500,
                                   fontSize:11.sp ),):const Text(""),
                                   
                               ],
                             ),
                               Text(matchController.team2Players[index]!.role,
                               textAlign: TextAlign.end,
                               style: TextStyle(
                                 fontSize:10.sp,
                                 color: Colors.grey[600]
                                  ),
                               ),
                           ],
                          ),
                        ),  
                       SizedBox(width: 6.w,),
                       Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team2Players[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       )

                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          ),
           Container(
            // margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.symmetric(vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Center(child: Text("On Bench",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),)),
          ),

           Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.team1OnBench.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),
                      right: BorderSide(width: 1,color: Colors.grey.shade200)
                      )
                    ),
                  child:
                   Column(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team1OnBench[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       ),
                          SizedBox(width: 6.w,),
                           Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(matchController.team1OnBench[index]!.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:11.sp ),
                                ),
                                Text(matchController.team1OnBench[index]!.role,
                                style: TextStyle(
                                  fontSize:10.sp,
                                  color: Colors.grey[600]
                                   ),
                                ),
                              ],
                           ),
                           ),
                        ],
                      )
                    ],
                  ),
                );
                }),
              ),

               Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.team2OnBench.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),
                      right: BorderSide(width: 1,color: Colors.grey.shade200)
                      )
                    ),
                  child:
                   Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(matchController.team2OnBench[index]!.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:11.sp ),
                                ),
                                Text(matchController.team2OnBench[index]!.role,
                                style: TextStyle(
                                  fontSize:10.sp,
                                  color: Colors.grey[600]
                                   ),
                                ),
                              ],
                           ),
                           ),
                           SizedBox(width: 6.w,),
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team2OnBench[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       ),
                        ],
                      )
                    ],
                  ),
                );
                }),
              ),

            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Center(child: Text("Support Staff",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),)),
          ),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.team1Support.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),
                      right: BorderSide(width: 1,color: Colors.grey.shade200)
                      )
                    ),
                  child:
                   Column(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                        Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team1Support[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       ),
                          SizedBox(width: 6.w,),
                           Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(matchController.team1Support[index]!.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:11.sp ),
                                ),
                                Text(matchController.team1Support[index]!.role,
                                style: TextStyle(
                                  fontSize:10.sp,
                                  color: Colors.grey[600]
                                   ),
                                ),
                              ],
                           ),
                           ),
                        ],
                      )
                    ],
                  ),
                );
                }),
              ),

               Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchController.team2Support.length,
                  itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200),
                      right: BorderSide(width: 1,color: Colors.grey.shade200)
                      )
                    ),
                  child:
                   Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Container(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(matchController.team2Support[index]!.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:11.sp ),
                                ),
                                Text(matchController.team2Support[index]!.role,
                                style: TextStyle(
                                  fontSize:10.sp,
                                  color: Colors.grey[600]
                                   ),
                                ),
                              ],
                           ),
                           ),
                           SizedBox(width: 6.w,),
                         Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),

                        ),
                        child: ClipOval(
                          child: Image.network('https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c${matchController.team2Support[index]!.faceImageId.toString()}/i.jpg',
                          fit: BoxFit.cover,
                          headers: const {
                              'X-RapidAPI-Key': 'cf3315174amsh2d2c5f9d1b5690fp110929jsn5a7c9913a769',
                              'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
                          },
                          ),
                        )
                       ),
                        ],
                      )
                    ],
                  ),
                );
                }),
              ),

            ],
          ),





      
        ],
      ),
    );
  }
}