import 'package:video_player/video_player.dart';

class FeedModel {
  FeedModel({
    String? title,
    String? url,
  }) {
    _title = title;
    _url = url;
  }

  FeedModel.fromJson(dynamic json) {
    _title = json['title'];
    _url = json['url'];
  }
  String? _title;
  String? _url;
  VideoPlayerController? controller;
  FeedModel copyWith({
    String? title,
    String? url,
  }) =>
      FeedModel(
        title: title ?? _title,
        url: url ?? _url,
      );
  String? get title => _title;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }

  Future loadController() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(url!));
    await controller?.initialize();
    controller?.setLooping(true);
  }
}

List data = [
  {
    "title": "New reel",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
  },
  {
    "title": "New reel",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
  },
  {
    "title": "New reel",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4"
  },
  {
    "title": "shop Now",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
  },
  {
    "title": "Pro added",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
  },
  {
    "title": "Book my show",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
  },
  {
    "title": "viewer",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
  },
  {
    "title": "Ultra Max Power",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
  },
  {
    "title": "Ultra Max Power",
    "url":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
  },
];
