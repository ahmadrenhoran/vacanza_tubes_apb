import 'package:flutter/material.dart';
import 'package:vacanza/helper/app_colors.dart';
import 'package:vacanza/view/home_page.dart';
import 'package:vacanza/view/profile_page.dart';

 
class NavBar extends StatefulWidget {
  static var tag;

  NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedTab =
      0;  

  final PageStorageBucket bucket = PageStorageBucket();

  List screens = [
    HomeScreen(),
    ProfileScreen(),
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
         
        color: AppColor.background,
        elevation: 0,
        child: Container(
           
          margin: EdgeInsets.only(bottom: 12, left: 16, right: 16),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColor.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                       
                       
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.home_outlined,
                          color: AppColor.subtitle,
                          size: 26,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 2,
                          width: 16,
                           
                           
                          color: selectedTab == 0
                              ? AppColor.green
                              : Colors.transparent,
                        )
                      ],
                    )),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.person_outline,
                          color: AppColor.subtitle,
                          size: 26,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 2,
                          width: 16,
                          color: selectedTab == 1
                              ? AppColor.green
                              : Colors.transparent,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(bucket: bucket, child: screens[selectedTab]),
       
    );
  }
}
