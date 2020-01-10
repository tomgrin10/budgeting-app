class BudgetManager {
  var _budgets = <MonthlyBudget>[
    MonthlyBudget(name: "Games", moneyAmount: 30),
    MonthlyBudget(name: "Food", moneyAmount: 200),
    MonthlyBudget(name: "Clothes", moneyAmount: 50)];
  var _expenses = <Expense>[];

  Future<List<MonthlyBudget>> getBudgets() async {
    await Future.delayed(Duration(seconds: 1));
    return _budgets.toList();
  }

  Future<MonthlyBudget> addBudget(MonthlyBudget budget) async {
    var newId = _budgets.last.id + 1;
    budget.id = newId;
    _budgets.add(budget);

    return budget;
  }

  Future<void> deleteBudget(int id) async {
    _budgets.removeWhere((budget) => budget.id == id);
  }

  Future<List<Expense>> getExpenses() async {
    return _expenses.toList();
  }

  Future<Expense> addExpense(Expense expense) async {
    var newId = _expenses.last.id + 1;
    expense.id = newId;
    _expenses.add(expense);

    return expense;
  }

  Future<void> deleteExpense(int id) async {
    _expenses.removeWhere((expense) => expense.id == id);
  }
}

class MonthlyBudget {
  MonthlyBudget({this.id, this.name, this.moneyAmount});

  int id;
  String name;
  int moneyAmount;
}

class Expense {
  int id;
  String description;
  int moneyAmount;
  MonthlyBudget budget;
}