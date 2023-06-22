import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:expense_tracker/Enums/expense_category.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();
const categoryIcon = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  Expense({
    required this.tile,
    required this.amount,
    required this.date,
    required this.expenseCategory,
  }) : id = uuid.v4();

  final String id;
  final String tile;
  final double amount;
  final DateTime date;
  final ExpenseCategory expenseCategory;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expense,
  });
  ExpenseBucket.forCatergory(List<Expense> allExpenses, this.category)
      : expense = allExpenses
            .where((exp) => exp.expenseCategory == category)
            .toList();
  final ExpenseCategory category;
  final List<Expense> expense;

  double get totalExpenses {
    double sum = 0;
    for (final expenses in expense) {
      sum += expenses.amount;
    }
    return sum;
  }
}
