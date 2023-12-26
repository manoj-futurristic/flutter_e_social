import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../widgets/user_card.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  
  List<Widget> cards = List.generate(
    10,
    (index) => UserCardWidget(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: StackedCardCarousel(
        type: StackedCardCarouselType.fadeOutStack,
        spaceBetweenItems: 300,
        items: cards,
      ),
    );
  }
}
