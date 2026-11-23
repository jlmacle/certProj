import 'package:flutter/material.dart';
import '../models/expense_category.dart';
import 'package:localstorage/localstorage.dart';

class ExpenseCategoryProvider with ChangeNotifier {
  final LocalStorage storage;
  
  // List of categories
  final List<ExpenseCategory> _categories = [
    ExpenseCategory(id: '1', name: 'Food', isDefault: true),
    ExpenseCategory(id: '2', name: 'Transport', isDefault: true),
    ExpenseCategory(id: '3', name: 'Entertainment', isDefault: true),
    ExpenseCategory(id: '4', name: 'Office', isDefault: true),
    ExpenseCategory(id: '5', name: 'Gym', isDefault: true),
  ];
    
  // Getter
  List<ExpenseCategory> get categories => _categories;

  ExpenseCategoryProvider(this.storage);  

  void addCategory(ExpenseCategory category) {
      if (!_categories.any((cat) => cat.name == category.name)) {
        _categories.add(category);
        notifyListeners();
      }
    }

  void deleteCategory(String id) {
    _categories.removeWhere((category) => category.id == id);
    notifyListeners();
  }

}
