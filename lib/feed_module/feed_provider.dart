import 'package:flutter/material.dart';
import 'feed_model.dart';

class FeedProvider extends ChangeNotifier {
  FeedProvider() {
    initLoading();
  }

  PageController pageController = PageController();
  List<FeedModel> feedData = [];
  bool _loading = true;
  bool get loading => _loading;
  int prevVideo = 0;

  void setLoadig(loading) {
    _loading = loading;
    notifyListeners();
  }

  initLoading() async {
    setLoadig(true);
    await Future.delayed(const Duration(seconds: 1));
    feedData = data.map((e) => FeedModel.fromJson(e)).toList();
    setLoadig(false);
    loadVideo(0);
  }

  void loadVideo(int index) async {
    if (feedData.length > index) {
      await feedData[index].loadController();
      feedData[index].controller?.play();
      notifyListeners();
    }
  }

  void onChanged(int index) async {
    if (feedData[prevVideo].controller != null) {
      await feedData[prevVideo].controller!.pause();
    }
    if (feedData[index].controller == null) {
      await feedData[index].loadController();
    }
    await feedData[index].controller!.play();
    prevVideo = index;
    notifyListeners();
  }
}
