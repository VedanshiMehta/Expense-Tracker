import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.onRemovedExpense,
  });

  final List<Expense> expensesList;
  final void Function(Expense expense) onRemovedExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, indx) => Dismissible(
        key: ValueKey(expensesList[indx]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.6),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemovedExpense(expensesList[indx]);
        },
        child: ExpenseItem(expensesList[indx]),
      ),
    );
  }
}
