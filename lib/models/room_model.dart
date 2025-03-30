class Room {
  final int? id;
  final String name;
  final String image;
  final double price;
  final double rate;
  final bool available;
  final String description;
  final List<String> images;
  final bool tv;
  final bool shower;
  final bool wifi;
  final bool breakfast;
  final String status;

  // final List<Map<String, dynamic>> features; // New field for features

  Room({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.available,
    required this.description,
    required this.images,
    required this.tv,
    required this.shower,
    required this.wifi,
    required this.breakfast,
    this.status = 'available'
    // required this.features,
  });

  // Convert Room to a Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'rate': rate,
      'available': available ? 1 : 0, // Store boolean as integer
      'description': description,
      'images': images.join(','), // Convert images list to a string
      'tv': tv ? 1 : 0,
      'shower': shower ? 1 : 0,
      'wifi': wifi ? 1 : 0,
      'breakfast': breakfast ? 1 : 0,
      'status': status
      // 'features': features
      //     .map((feature) => '${feature['iconPath']},${feature['available']}')
      //     .join(';'), // Serialize features list
    };
  }

  // Convert a Map to a Room object
  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      rate: map['rate'],
      available: map['available'] == 1,
      description: map['description'],
      images: map['images'].split(','), // Parse string back into list
      tv: map['tv'] == 1,
      shower: map['shower'] == 1,
      wifi: map['wifi'] == 1,
      breakfast: map['breakfast'] == 1,
      status: map['status']

      // features: map['features']
      //     .split(';') // Split serialized features string into individual feature maps
      //     .map((featureString) {
      //   List<String> parts = featureString.split(',');
      //   return {
      //     'iconPath': parts[0],
      //     'available': parts[1] == 'true',
      //   };
      // }).toList(),
    );
  }
}
