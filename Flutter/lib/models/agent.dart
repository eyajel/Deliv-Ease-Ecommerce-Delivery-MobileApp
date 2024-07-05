import 'dart:io';

class Agent {
  int? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String region;


  Agent({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.region, // Nullable File
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      region :json['region'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'region': region,
    };
  }
}


