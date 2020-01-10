import 'package:budgeting_app/budget_manager.dart';
import 'package:budgeting_app/widgets/budget.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

@provide
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final BudgetManager _budgetManager = BudgetManager();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(_budgetManager);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this._budgetManager);

  int _counter = 0;
  final BudgetManager _budgetManager;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<MonthlyBudget>>(
        future: _budgetManager.getBudgets(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MonthlyBudget>> snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(child: CircularProgressIndicator());
          } else {
            // data loaded:
            final budgets = snapshot.data;
            return ListView(
              children: [for (var budget in budgets) Budget(budget)],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
