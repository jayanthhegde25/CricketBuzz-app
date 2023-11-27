import 'package:cricbuzz/Screens/finished_page.dart';
import 'package:cricbuzz/controller/api_call.dart';
import 'package:cricbuzz/controller/match_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'matches_upcoming.dart';

MatchController matchController = Get.put(MatchController());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
    TabController? tabController;


  @override
  void initState() {
    matchController.matchList();
    matchController.upcomingMatches();
    super.initState();
    tabController = TabController(length: 3, vsync: this,); // Number of tabs
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 243, 243),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 118, 61),
          centerTitle: false,
          // actions: [
          //   const Icon(Icons.search,color: Colors.white,size: 28,),
          //   const SizedBox(width: 20,),
          // ],
          title:  Text('Cricketbuzz',
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500),),
            bottom:  TabBar(
              isScrollable: true,
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              labelStyle:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
              indicatorWeight:4,
              indicatorColor: Colors.red,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white38,
              controller: tabController,
              tabs: const [
                Tab(text: 'Live',),
                Tab(text: 'Upcoming'),
                Tab(text: 'Finished'),
            
               
              
              
              ]),
        ),
        body:  TabBarView(
           controller: tabController,
            children: const [

                Center(
                  child: Text('Live'),
                ),
                
              UpcomingMatchList(),
        
               FinishedPage()
         
          ]),
      
    );
  }

}