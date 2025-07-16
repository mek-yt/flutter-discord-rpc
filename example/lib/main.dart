import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_discord_rpc_fork/flutter_discord_rpc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDiscordRPC.initialize(
    "1395040506677039157",
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  late Future<int> sumAsyncResult;

  @override
  void initState() {
    super.initState();
    FlutterDiscordRPC.instance
        .connect(autoRetry: true, retryDelay: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    FlutterDiscordRPC.instance.disconnect();
    FlutterDiscordRPC.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mangayomi'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextButton(
                  child: const Text("Set Activity"),
                  onPressed: () {
                    FlutterDiscordRPC.instance.setActivity(
                      activity: RPCActivity(
                        assets: const RPCAssets(
                          largeImage: "https://cdn.myanimelist.net/images/anime/1444/148976.jpg",
                          largeText: "Watching Food Wars!",
                          smallImage: "app-icon",
                          smallText: "Mangayomi"
                        ),
                        buttons: [
                          const RPCButton(
                              label: "Get Mangayomi", url: "https://github.com/kodjodevf/mangayomi"),
                          const RPCButton(
                              label: "Join us", url: "https://discord.com/invite/EjfBuYahsP"),
                        ],
                        details: "Watching Food Wars!",
                        state: "Episode 1 / 24",
                        timestamps: RPCTimestamps(
                          start: DateTime.now().millisecondsSinceEpoch,
                          end: DateTime.now().millisecondsSinceEpoch + 1440000,
                        ),
                        activityType: ActivityType.watching,
                      ),
                    );
                  },
                ),
                TextButton(
                  child: const Text("Clear Activity"),
                  onPressed: () {
                    FlutterDiscordRPC.instance.clearActivity();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
