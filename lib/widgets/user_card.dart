import 'package:flutter/material.dart';

import '../screens/finder/user_profile.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => const UserProfileScreen(),
      ),
      child: Card(
        color: Colors.blue.withOpacity(0.5),
        margin: const EdgeInsets.all(10),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              const Positioned(
                bottom: 3,
                left: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Raj Jaiswal",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_history),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("India")
                          ],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.event_note),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("21")
                          ],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.offline_bolt_outlined),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Online")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
