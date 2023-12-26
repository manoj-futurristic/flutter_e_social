import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String url =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              width: double.infinity,
              color: Colors.blueAccent.shade100.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Raj Jaiswal",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w100),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.clear_rounded)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Want to make new friends...",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Let's Connect",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100),
                      ),
                      Icon(Icons.arrow_forward_rounded),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: LinearProgressIndicator(
                          backgroundColor:
                              Colors.blueAccent.shade100.withOpacity(0.5),
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(25),
                          minHeight: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: userImages,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get userImages => ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.blueAccent.withOpacity(0.5), width: 5),
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 8.0,
        ),
        itemCount: 10,
      );
}
