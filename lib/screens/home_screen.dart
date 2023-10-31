import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/home_provider.dart';
import 'package:provider_practice/providers/theme_provider.dart';

import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final home = context.read<HomeProvider>();
      home.initLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Social'),
        actions: [changeThemeButton],
      ),
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Center(
            child: homeProvider.loading
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) => PostCard(
                      index: index,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: 10,
                  ));
      }),
    );
  }

  Widget get changeThemeButton => Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return IconButton(
            icon: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          );
        },
      );
}
