import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'feed_model.dart';
import 'feed_provider.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});
  FeedProvider? _feedProvider;

  Widget get pageViewWidget => Consumer<FeedProvider>(
        builder: (context, value, child) => PageView.builder(
          controller: value.pageController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: value.feedData.length,
          itemBuilder: (context, index) {
            final FeedModel data = value.feedData[index];
            return data.controller == null
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          SizedBox(
                            width: 5.0,
                          ),
                          Flexible(child: LinearProgressIndicator()),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      data.controller!.value.isPlaying
                          ? data.controller!.pause()
                          : data.controller!.play();
                    },
                    child: Stack(
                      children: [
                        SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: SizedBox(
                              width: data.controller!.value.size.width,
                              height: data.controller!.value.size.height,
                              child: VideoPlayer(data.controller!),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ListTile(
                            leading: CircleAvatar(),
                            title: Text("userName"),
                            subtitle: Text("sub"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  );
          },
          onPageChanged: value.onChanged,
        ),
      );

  @override
  Widget build(BuildContext context) {
    _feedProvider ??= context.read<FeedProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Consumer<FeedProvider>(
              builder: (context, feed, child) {
                if (feed.loading) return const CircularProgressIndicator();
                return pageViewWidget;
              },
            ),
          ),
          Positioned(
            top: 45,
            left: 10,
            child: CircleAvatar(
              radius: 25,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            ),
          )
        ],
      ),
    );
  }
}
