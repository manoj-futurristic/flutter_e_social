import 'package:advstory/advstory.dart';
import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_practice/screens/finder/user_profile.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class UserFinderScreen extends StatefulWidget {
  const UserFinderScreen({super.key});

  @override
  State<UserFinderScreen> createState() => _UserFinderScreenState();
}

class _UserFinderScreenState extends State<UserFinderScreen> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.webp',
              ),
              fit: BoxFit.cover,
              opacity: 0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            usersStatusBAr,
            Expanded(child: circleUsers),
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.chat_bubble_outline),
            onPressed: () {
              context.push("/chat");
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {
              context.push("/search");
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              context.push("/feed");
            },
          ),
        ],
      ),
    );
  }

  Widget get circleUsers => CircularRotation(
        circularRotationProperty: CircularRotationModel(
          defaultCircleStrokeWidth: 1,
          defaultCircleStrokeColor: Colors.indigoAccent,
          startAnimation: true,
          curve: Curves.bounceIn,
          firstCircleStrokeWidth: 2.5,
          secondCircleStrokeWidth: 2,
          thirdCircleStrokeWidth: 1.5,
          repeatAnimation: false,
          firstCircleAnimationDuration: 5000,
          secondCircleAnimationDuration: 7000,
          thirdCircleAnimationDuration: 10000,
          centerWidget: const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
          firstCircleWidgets: [
            rUsers(
                "https://img.mensxp.com/media/content/2021/Nov/Header__618b638d068a4.png?w=820&h=540&cc=1"),
            rUsers(
                "https://img.mensxp.com/media/content/2021/Nov/Header__618b638d068a4.png?w=820&h=540&cc=1"),
            rUsers(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGyHgcY8dCg8t2fWU-AyQLv9nD05uVn-Vr_w&usqp=CAU")
          ],
          secondCircleWidgets: [
            rUsers(
                "https://img.mensxp.com/media/content/2021/Nov/Header__618b638d068a4.png?w=820&h=540&cc=1"),
            rUsers(
                "https://st3.depositphotos.com/13194036/18900/i/450/depositphotos_189004064-stock-photo-handsome-student-showing-thump-isolated.jpg"),
            rUsers(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGyHgcY8dCg8t2fWU-AyQLv9nD05uVn-Vr_w&usqp=CAU")
          ],
          thirdCircleWidgets: [
            rUsers(
                "https://st3.depositphotos.com/13194036/18900/i/450/depositphotos_189004064-stock-photo-handsome-student-showing-thump-isolated.jpg"),
          ],
        ),
      );

  Widget get usersStatusBAr => SizedBox(
        width: double.infinity,
        height: 110,
        child: AdvStory(
          storyCount: 10,
          storyBuilder: (storyIndex) => Story(
            contentCount: 3,
            contentBuilder: (contentIndex) => ImageContent(
              url: "https://picsum.photos/250?image=${contentIndex + 100}",
              header: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/250?image=51"),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("USERNAME"),
                  ],
                ),
              ),
            ),
          ),
          trayBuilder: (index) => AdvStoryTray(
            url: "https://picsum.photos/250?image=${index + 4}",
            username: Text("u name"),
          ),
        ),
      );

  Widget rUsers(String url) => InkWell(
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => const UserProfileScreen(),
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(url),
        ),
      );
}
