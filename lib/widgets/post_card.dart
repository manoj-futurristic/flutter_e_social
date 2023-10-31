import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:provider_practice/utils/data.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  final String dummyImg =
      "data:image/jpeg;base64,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";

  Widget get likeButton => Builder(
        builder: (context) {
          return SizedBox.square(
            dimension: 30,
            child: ReactionButton<String>(
              toggle: false,
              onReactionChanged: (Reaction<String>? reaction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected reaction: ${reaction?.value}'),
                  ),
                );
              },
              reactions: reactions,
              placeholder: reactions.first,
              boxColor: Colors.black.withOpacity(0.5),
              boxRadius: 10,
              itemsSpacing: 10,
              itemSize: const Size(30, 50),
              animateBox: true,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(dummyImg),
              ),
              title: const Text('Raj Jaiswal'),
              subtitle: const Text('Software Developer'),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  debugPrint(value);
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext bc) {
                  return const [
                    PopupMenuItem(
                      value: '/save',
                      child: Text("Save"),
                    ),
                    PopupMenuItem(
                      value: '/share',
                      child: Text("Share"),
                    ),
                    PopupMenuItem(
                      value: '/delete',
                      child: Text("Delete"),
                    )
                  ];
                },
              ),
            ),
            const Text("Caption here..."),
            const SizedBox(
              height: 6.0,
            ),
            AspectRatio(
              aspectRatio: 2,
              child: Image.network(
                'https://picsum.photos/250?image=${index}',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: reactions.first.icon,
                    label: Text("raj and ${index + 2} others")),
                TextButton(onPressed: () {}, child: Text("$index comments"))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                likeButton,
                IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
