class Agency {
  final int id;
  final String name;
  final String description;
  final String
      adresse; // Change this line to match the field name in the Spring Boot model

  Agency({
    required this.id,
    required this.name,
    required this.description,
    required this.adresse,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      adresse: json['adresse'],
    );
  }

}
