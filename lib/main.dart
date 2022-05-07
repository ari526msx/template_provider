import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 変更通知提供者で包括し、変更監視対象はMainModelとする
      home: ChangeNotifierProvider<MainModel>(  // from Widget
        // 変更監視対象のインスタンスを作成する
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo Provider'),
          ),
          // 変更通知先である顧客を用意し、変更監視対象はMainModelとする
          body: Consumer<MainModel>(  // from StreamBuilder
            builder: (context, model, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      // 変更監視対象のmodelのカウンタを表示する
                      model.pushCounter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          // 押下時、変更監視対象のmodelのメソッドを実行する
                          onPressed: model.decrementCounter,
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                          backgroundColor: Colors.red,
                        ),
                        FloatingActionButton(
                          // 押下時、変更監視対象のmodelのメソッドを実行する
                          onPressed: model.incrementCounter,
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
