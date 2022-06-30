 
class Destination {
  final String locationName;  
  final String location;  
  final int price;  
  final String imageUrl;  

   
  Destination(
      {required this.locationName,
      required this.location,
      required this.price,
      required this.imageUrl});

  factory Destination.fromMap(Map<dynamic, dynamic> map) {
    return Destination(
      imageUrl: map['imageUrl'] ?? '',
      location: map['location'] ?? '',
      locationName: map['locationName'] ?? '',
      price: map['price'] ?? 0,
    );
  }
}

 

