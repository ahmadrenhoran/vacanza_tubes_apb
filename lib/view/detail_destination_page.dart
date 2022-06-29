import 'package:flutter/material.dart';

class DetailDestionatioScreen extends StatelessWidget {
  const DetailDestionatioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            "Detail Destination",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(179, 148, 145, 145),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.place, color: Colors.green, size: 30),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            Column(
              children: [
                Container(
                  child: Card(
                      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.network(
                              "https://travelspromo.com/wp-content/uploads/2018/07/Oc-Forest-Sky-Bridge.jpg",
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 8, top: 12),
                                        child: Text(
                                          "Orchid forest cikole",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 40, top: 6),
                                        child: Text(
                                          "Lembang Bandung",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  Card(
                                    color: Colors.green[800],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: EdgeInsets.only(right: 20),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 14,
                                          right: 14,
                                          top: 8,
                                          bottom: 8),
                                      child: Text('2\$',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 21, top: 12, bottom: 8),
                                      child: Text(
                                        'Terletak di Cikole, Lembang, Kabupaten Bandung Barat, Orchid Forest Cikole adalah sebuah tempat wisata di tengah Hutan Pinus yang asri, di mana ribuan jenis anggrek dikembangkan dan dilestarikan!',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 12,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
            Text(
              'Ticket',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Card(
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 12),
                        child: Text(
                          "Orchid forest cikole weekdays",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 4, bottom: 8),
                        child: Text('Price : 2\$'),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 4, bottom: 8),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              margin: EdgeInsets.only(left: 220, right: 6),
                              color: Colors.green[800],
                              child: SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.green,
                                    icon: new Icon(
                                      Icons.add,
                                      size: 14.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  )),
                            ),
                            Text(
                              "1",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Card(
                              margin: EdgeInsets.only(left: 6, right: 6),
                              color: Colors.green[800],
                              child: SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.green,
                                    icon: new Icon(
                                      Icons.remove,
                                      size: 14.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 12),
                        child: Text(
                          "Orchid forest cikole weekends",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 4, bottom: 8),
                        child: Text('Price : 2\$'),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 4, bottom: 8),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              margin: EdgeInsets.only(left: 220, right: 6),
                              color: Colors.green[800],
                              child: SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.green,
                                    icon: new Icon(
                                      Icons.add,
                                      size: 14.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  )),
                            ),
                            Text(
                              "1",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Card(
                              margin: EdgeInsets.only(left: 6, right: 6),
                              color: Colors.green[800],
                              child: SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.green,
                                    icon: new Icon(
                                      Icons.remove,
                                      size: 14.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  minimumSize: Size(150, 40),  
                ),
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: TextStyle(
                      color: Colors.green[800], fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
