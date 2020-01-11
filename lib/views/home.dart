import 'package:budgeting_app/services/budget_manager.dart';
import 'package:budgeting_app/widgets/budget_display.dart';
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

  final BudgetManager _budgetManager;
  var _budgets = <MonthlyBudget>[];

  Future<void> reloadBudgets() async {
    _budgets = await _budgetManager.getBudgets();
  }

  @override
  void initState() {
//    _budgetManager.getBudgets().then()
    super.initState();
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
              children: [for (var budget in budgets) BudgetDisplay(budget)],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
