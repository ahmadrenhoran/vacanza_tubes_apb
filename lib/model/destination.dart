class Destination {
  final String locationName;
  final String location;
  final double latitude;
  final double longitude;
  final String price;
  final String imageUrl;
  final String description;

  Destination({
    required this.locationName,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Destination.fromMap(Map<dynamic, dynamic> map) {
    return Destination(
      imageUrl: map['imageUrl'] ?? '',
      location: map['location'] ?? '',
      locationName: map['locationName'] ?? '',
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
      price: map['price'] ?? '0',
      description: map['description'] ?? '',
    );
  }
}
