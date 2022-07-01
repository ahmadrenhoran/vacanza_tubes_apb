import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vacanza/model/destination.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../helper/app_colors.dart';

class DetailDestinationScreen extends StatefulWidget {
  Destination destination;

  DetailDestinationScreen({required this.destination});

  @override
  State<DetailDestinationScreen> createState() =>
      _DetailDestinationScreenState();
}

class _DetailDestinationScreenState extends State<DetailDestinationScreen> {
  late Destination destination;
  int _weekend = 1;
  int _weekday = 1;
  late GoogleMapController mapController;
  late List<Marker> _markers = [];
  late YoutubePlayerController _controller;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(destination.price),
            position: LatLng(destination.latitude, destination.longitude),
            infoWindow: InfoWindow(title: destination.locationName)),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    destination = widget.destination;
    String? youtubeUrl = YoutubePlayer.convertUrlToId(destination.youtubeUrl);
    _controller = YoutubePlayerController(
      initialVideoId:
          youtubeUrl ?? 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,

      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              destination.locationName,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            elevation: 2,
            backgroundColor: AppColor.background),
        body: ListView(
          padding: const EdgeInsets.all(12),
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
                              destination.imageUrl,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          destination.locationName,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          destination.location,
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
                                      child: Text('${destination.price}\$',
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
                                        destination.description,
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
            const Text(
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
                          "${destination.locationName} weekdays",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 4, bottom: 8),
                        child: Text(
                            'Price : ${int.parse(destination.price) * _weekday}\$'),
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
                                    onPressed: () {
                                      setState(() {
                                        _weekday++;
                                      });
                                    },
                                  )),
                            ),
                            Text(
                              "$_weekday",
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
                                    onPressed: () {
                                      setState(() {
                                        _weekday--;
                                      });
                                    },
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
                          "${destination.locationName} weekends",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 4, bottom: 8),
                        child: Text(
                            'Price : ${int.parse(destination.price) * _weekend}\$'),
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
                                    onPressed: () {
                                      setState(() {
                                        _weekend++;
                                      });
                                    },
                                  )),
                            ),
                            Text(
                              "$_weekend",
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
                                    onPressed: () {
                                      setState(() {
                                        _weekend--;
                                      });
                                    },
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
            const Text(
              'Video preview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: AppColor.green,
            ),
            SizedBox(height: 20,),
            const Text(
              'Google maps view',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26)),
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Container(
                  height: 400.0,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target:
                            LatLng(destination.latitude, destination.longitude),
                        zoom: 11.0),
                    onMapCreated: _onMapCreated,
                    markers: Set<Marker>.of(_markers),
                  ),
                ),
              ),
            ),
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
