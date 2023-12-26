import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_practice/providers/home_provider.dart';
import 'package:provider_practice/providers/theme_provider.dart';
import 'feed_module/feed_provider.dart';
import 'routes/routes.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        // enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => FeedProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: _providers,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => MaterialApp.router(
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'E-Dating',
            theme: themeProvider.themeData,
            routerConfig: Routes().router,
          ),
        ));
  }
}
