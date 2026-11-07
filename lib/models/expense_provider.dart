import 'package:flutter/material.dart';

import 'package:expense_manager/models/expense.dart';

class ExpenseProvider with ChangeNotifier{

  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense)
  {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(int id)
  {
    _expenses.removeWhere((expense) => expense.id == id);
  }

  void addOrUpdateExpense(Expense updatedExpense)
  {
    int index = _expenses.indexWhere((expense) => expense.id == updatedExpense.id);

    if (index != -1)
    {
      _expenses[index] = updatedExpense;
      notifyListeners();
    }
    //else adding
    {
      addExpense(updatedExpense);
    }
  }

}