import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:expense_manager/models/expense.dart';
import 'package:localstorage/localstorage.dart';

class ExpenseProvider with ChangeNotifier{

  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense)
  {
    expenses.add(expense);
    _saveExpensesToStorage();
    notifyListeners();
  }

  void removeExpense(int id)
  {
    expenses.removeWhere((expense) => expense.id == id);
    _saveExpensesToStorage();
  }

  void addOrUpdateExpense(Expense updatedExpense)
  {
    int index = expenses.indexWhere((expense) => expense.id == updatedExpense.id);

    if (index != -1)
    {
      expenses[index] = updatedExpense;
      _saveExpensesToStorage();
      notifyListeners();
    }
    //else adding
    {
      addExpense(updatedExpense);
      _saveExpensesToStorage();
    }
  }

  void _saveExpensesToStorage()
  {
    String expensesAsString = jsonEncode(_expenses);
    localStorage.setItem('expenses', expensesAsString);
  }

  void _loadExpensesFromStorage()
  {
    String? jsonString = localStorage.getItem('expenses');
    _expenses = json.decode(jsonString ?? "[]");
  }

}