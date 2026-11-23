import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/expense_category.dart';
import 'package:localstorage/localstorage.dart';

class ExpenseCategoryProvider with ChangeNotifier {
  final LocalStorage storage;
  
  // List of categories
  List<ExpenseCategory> _categories = [];
  // List<ExpenseCategory> _categories = [
  //   ExpenseCategory(id: '1', name: 'Food', isDefault: true),
  //   ExpenseCategory(id: '2', name: 'Transport', isDefault: true),
  //   ExpenseCategory(id: '3', name: 'Entertainment', isDefault: true),
  //   ExpenseCategory(id: '4', name: 'Office', isDefault: true),
  //   ExpenseCategory(id: '5', name: 'Gym', isDefault: true),
  // ];
    
  // Getter
  List<ExpenseCategory> get categories => _categories;

  ExpenseCategoryProvider(this.storage){
    _loadCategoryExpensesFromStorage();
  } 

  void addCategory(ExpenseCategory category) {
      if (!_categories.any((cat) => cat.name == category.name)) {
        _categories.add(category);
        _saveCategoryExpensesToStorage();
        notifyListeners();
      }
    }

  void deleteCategory(String id) {
    _categories.removeWhere((category) => category.id == id);
    _saveCategoryExpensesToStorage();
    notifyListeners();
  }

  void _loadCategoryExpensesFromStorage() {
    var storedExpenses = storage.getItem('categories');
    if (storedExpenses != null) {
      final List<dynamic> decoded = jsonDecode(storedExpenses);
      _categories = decoded
          .map((item) => ExpenseCategory.fromJson(Map<String, dynamic>.from(item)))
          .toList();
      notifyListeners();
    }
  }

  void _saveCategoryExpensesToStorage() {
    storage.setItem(
      'categories',
      jsonEncode(_categories.map((e) => e.toJson()).toList()),
    );
  }

}
