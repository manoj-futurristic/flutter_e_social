import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../widgets/user_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> cards = List.generate(
    10,
    (index) => UserCardWidget(),
  );

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: "Search users...",
                suffixIcon: Icon(Icons.search),
              ),
              autocorrect: true,
            ),
          ),
          Expanded(
            child: StackedCardCarousel(
              type: StackedCardCarouselType.fadeOutStack,
              spaceBetweenItems: 300,
              items: cards,
            ),
          ),
        ],
      ),
    );
  }
}
