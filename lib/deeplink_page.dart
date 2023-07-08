import 'package:flutter/material.dart';
import 'package:flutter_ga4_getting_started/second_page.dart';

/*
Future dynamicLinks() async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://www.example.com/"),
    uriPrefix: "https://ga4-getting-started.page.link",
    //androidParameters: const AndroidParameters(
    //  packageName: "com.example.app.android",
    //  minimumVersion: 30,
    //),
    iosParameters: const IOSParameters(
      bundleId: "com.example.flutterGa4GettingStarted",
      appStoreId: "123456789",
      minimumVersion: "1.0.1",
    ),
    googleAnalyticsParameters: const GoogleAnalyticsParameters(
      source: "twitter",
      medium: "social",
      campaign: "example-promo",
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: "Example of a Dynamic Link",
      imageUrl: Uri.parse("https://example.com/image.png"),
    ),
  );
  final dynamicLink =
    await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
  return dynamicLink;
}
*/

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contents2(), // Contentsクラスの呼び出し
    );
  }
}

class Contents2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("アカウント登録画面")),
      body: Center(
        child: ElevatedButton(  // 遷移するためのボタンを設置
          child: Text("アカウント登録ボタン"), // ボタンに表示されるテキスト
          onPressed: () { // ボタン押したときに実行される
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(), // SecondPageは遷移先のクラス
              ),
            );
          },
        ),
      ),
    );
  }
}
