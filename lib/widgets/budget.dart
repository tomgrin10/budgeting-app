import 'package:budgeting_app/budget_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  final MonthlyBudget budget;

  const Budget(this.budget, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("\$${budget.moneyAmount}"),
      title: Text(budget.name),
    );
  }
}