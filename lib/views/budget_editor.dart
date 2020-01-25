import 'package:budgeting_app/services/budget_manager.dart';
import 'package:flutter/material.dart';

class BudgetEditor extends StatefulWidget {
  final MonthlyBudget budget;

  const BudgetEditor({this.budget, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BudgetEditorState();
  }
}

class _BudgetEditorState extends State<BudgetEditor> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Editor"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "henlo!",
                  labelText: 'Input text.',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ],
        ), // Build this out in the next steps.
      ),
    );
  }
}
