import 'package:flutter/material.dart';
import 'package:flutter_ga4_getting_started/mixin_deeplink.dart';
import 'package:flutter_ga4_getting_started/second_page.dart';

void main() async {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contents(), // Contentsクラスの呼び出し
    );
  }
}

class Contents extends StatefulWidget {
  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents>
    with DeepLinkNotificationMixin {

  String? catchLink;
  String? parameter;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void onDeepLinkNotify(Uri? uri) {
    print(uri);
    final link = uri.toString();
    catchLink = link;
    parameter = getQueryParameter(link);
    setState(() {});
  }

  String? getQueryParameter(String? link) {
    if (link == null) return null;
    final uri = Uri.parse(link);
    String? name = uri.queryParameters['name'];
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("アカウント登録画面")),
      body: Column(

        children: [
          ElevatedButton(  // 遷移するためのボタンを設置
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'リンク：$catchLink',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'パラメーター：$parameter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}