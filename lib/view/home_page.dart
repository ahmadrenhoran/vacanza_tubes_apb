
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vacanza/helper/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late DatabaseReference ref;
  //
  // List<Map<dynamic, dynamic>> data = [];
  // List<String> dataKeys = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   ref = FirebaseDatabase.instance.ref('data');
  //   ref.onValue.listen((event) {
  //     final rows = event.snapshot.value as Map;
  //     List<Map> d = [];
  //     List<String> k = [];
  //     rows.forEach((key, value) {
  //       d.add(value as Map);
  //       k.add(key);
  //     });
  //     setState(() {
  //       data = d;
  //       dataKeys = k;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      Text("Lukman" + "!",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg",
                      fit: BoxFit.cover,
                      height: 32,
                      width: 32,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(bottom: 13, right: 16, left: 16),
              height: 45,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.green, shape: BoxShape.circle),
                          child: Icon(
                            Icons.search,
                            color: AppColor.white,
                            size: 15,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      isDense: true),
                ),
              ),
            ),
            // Expanded(
              // child: ListView.builder(
              //   physics: BouncingScrollPhysics(),
              //   itemCount: data.length,
              //   itemBuilder: (context, index) {
              //     /* setiap indexnya akan dibuatkan widget DestinationCard yang dibuat terpisah pada file lain dengan mengirimkan
              //     satu buah objek Destination sesuai yang diminta pada constructor DestinationCard dimana setiap objeknya didapatkan dari
              //     list destinations dan diambil sesuai indeks yang sedang dijalankan pada ListView.builder*/
              //     return Center(
              //         child: Container(
              //       width: 289,
              //       height: 231,
              //       padding: EdgeInsets.all(5),
              //       margin: EdgeInsets.only(bottom: 22),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(30),
              //           color: AppColor.white),
              //       child: Column(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(23),
              //             child: Image.network(
              //               data[index]["imageUrl"] ?? '',
              //               fit: BoxFit.cover,
              //               width: double.infinity,
              //               height: 150,
              //             ),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(right: 15, left: 15, top: 12),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(data[index]["locationName"] ?? '',
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.w500)),
              //                     SizedBox(height: 5),
              //                     Text(data[index]["location"] ?? '',
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             fontSize: 12,
              //                             fontWeight: FontWeight.w400,
              //                             color: AppColor.subtitle))
              //                   ],
              //                 ),
              //                 Container(
              //                   width: 42,
              //                   height: 37,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       color: AppColor.green),
              //                   child: Center(
              //                     child: Text(
              //                       data[index]["price"] ?? '',
              //                       style: TextStyle(
              //                           color: AppColor.white,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ));
              //   },
              // ),
            // )
          ],
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/lottie_warning.json',
                      height: 100),
                  SizedBox(height: 25),
                  Text(
                    'Mohon maaf, destinasi ditutup karena dalam proses perbaikan. silahkan cek destinasi lain yang tersedia',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 30),
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text('Tutup'))
                ],
              ),
            ),
          ),
        );
      });
}
