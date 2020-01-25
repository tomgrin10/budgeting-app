import 'package:budgeting_app/services/budget_manager.dart';
import 'package:budgeting_app/views/expense_editor.dart';
import 'package:flutter/material.dart';

class BudgetDisplay extends StatelessWidget {
  final MonthlyBudget budget;

  const BudgetDisplay(this.budget, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("\$${budget.moneyAmount}"),
      title: Text(budget.name),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExpenseEditor(),
            ),
          );
        },
      ),
    );
  }
}
