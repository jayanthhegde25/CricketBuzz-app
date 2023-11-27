import 'package:cricbuzz/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {

    
     int time = matchController.info!.matchInfo.matchStartTimestamp;
     DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
     String formattedDate = formatDateWithAMPM(date);
     String formattedTime = formatDate(date);
      
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h,horizontal:16.w ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          child: Text("INFO",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade800
          ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Match",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.matchDescription,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Series",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.series.name,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Date",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(formattedDate,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Time",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(formattedTime,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Toss",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.status,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Venue",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text("${matchController.info!.venueInfo.knownAs!}\t${matchController.info!.venueInfo.city}",
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Umpires",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text("${matchController.info!.matchInfo.umpire1!.name},${matchController.info!.matchInfo.umpire2.name}",
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),

         Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("3rd Umpires",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.umpire3.name,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Referee",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.referee.name,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h,horizontal:16.w ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          child: Text("VENUE GUIDE",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade800
          ),
          ),
        ),

         Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Stadium",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.venue.name,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("City",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.matchInfo.venue.city,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Capacity",
                style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[800]
                )),
              ),
        
               Expanded(
                flex: 3,
                 child: Text(matchController.info!.venueInfo.capacity,
                  style: TextStyle(
                  fontSize: 12.sp)),
               ),
        
            ],
          ),
        ),



       
     ],
    );
  }
  String formatDateWithAMPM(DateTime date) {
   return " ${DateFormat('EEE,MMM dd').format(date)} ";
  }

  String formatDate(DateTime date) {
   return " ${DateFormat(' hh:mm').format(date)} ${DateFormat('a').format(date)} ";
  }
}