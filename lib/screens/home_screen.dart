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
  HomeProvider? _homeProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeProvider!.initLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider ??= context.read<HomeProvider>();

if(_homeProvider==null){
  
}

    return Scaffold(
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
      floatingActionButton: changeThemeButton,
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
