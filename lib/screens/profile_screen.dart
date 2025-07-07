import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/person.jpg"),
            ),
            Text("Mark Adam"),
            Text("Sunny_Koelpin45@hotmail.com"),
            Container(
              height: 48,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffF8F7F7),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2),
                      Text("Profile")
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}