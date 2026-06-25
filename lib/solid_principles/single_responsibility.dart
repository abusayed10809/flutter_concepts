/// S – Single Responsibility Principle (SRP)

/// A class should have one, and only one, reason to change
/// A class should do one job and do it well.

/// The Analogy: The Swiss Army Knife vs. A Chef's Knife
/// Imagine a Swiss Army Knife.
/// It’s a knife, a pair of scissors, a bottle opener, and a screwdriver all in one.

/// The Problem: If the scissors break or get jammed, you might have to send the whole tool in for repair
/// meaning you lose your knife and bottle opener too
/// Upgrading the screwdriver might require redesigning the entire casing

/// The SRP Solution: A Chef's Knife. It has one job: cutting.
/// It doesn't care about opening bottles or turning screws.
/// If you need to sharpen it, replace it, or modify it, none of your other kitchen tools are affected.

///
/// Bad example
///

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  String _userData = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // ❌ Violation: UI layer is handling raw HTTP networking
  Future<void> _fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.example.com/user'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _userData = data['name'];
        });
      }
    } catch (e) {
      setState(() {
        _userData = "Failed to load user";
      });
    }
  }

  // ❌ Violation: UI layer is managing layout AND formatting raw data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: Text(
          'Welcome, ${_userData.toUpperCase()}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

///
/// Good example
///
/// To fix this, we break the code into three distinct responsibilities:
/// 	1.	The Model: A class representing the data.
/// 	2.	The Service/Repository: A class dedicated only to fetching data.
/// 	3.	The Widget (UI): A class dedicated only to displaying the layout.

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? '',
    );
  }
}

class UserService {
  final http.Client client;

  UserService({required this.client});

  Future<UserModel> fetchUserData() async {
    final response = await client.get(
      Uri.parse('https://api.example.com/user'),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

class UserProfilePage extends StatelessWidget {
  final UserService userService;

  const UserProfilePage({super.key, required this.userService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: userService.fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('An error occurred');
            } else if (snapshot.hasData) {
              // The widget just renders the clean data model
              return Text(
                'Welcome, ${snapshot.data!.name}!',
                style: const TextStyle(fontSize: 24),
              );
            }
            return const Text('No data found');
          },
        ),
      ),
    );
  }
}
