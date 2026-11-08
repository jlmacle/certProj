import 'package:expense_manager/models/expense.dart';
import 'package:expense_manager/models/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddExpenseScreen extends StatefulWidget {
  final Expense? expense;

  const AddExpenseScreen({super.key, this.expense});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _payeeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();


  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _categoryController.text = widget.expense!.category;
      _tagController.text = widget.expense!.tag;
      _notesController.text = widget.expense!.notes;
      _payeeController.text = widget.expense!.payee;
      _amountController.text = widget.expense!.amount.toString();
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _payeeController,
              decoration: InputDecoration(labelText: 'Payee'),
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveexpense(context),
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveexpense(BuildContext context) {
    final expense = Expense(
      id: widget.expense?.id ?? DateTime.now().millisecondsSinceEpoch,
      date: "",
      category: _categoryController.text,
      tag: "",
      payee: _payeeController.text,
      notes: _notesController.text,
      amount: double.parse(_amountController.text),
      
    );
    if (widget.expense == null) {
      Provider.of<ExpenseProvider>(context, listen: false).addExpense(expense);
    } else {
      Provider.of<ExpenseProvider>(context, listen: false).addOrUpdateExpense(expense);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _payeeController.dispose();
    _notesController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
