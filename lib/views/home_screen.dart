import 'package:expense_manager/models/expense_provider.dart';
import 'package:expense_manager/views/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        centerTitle: true,
        title: Text("Expenses list"),
      ),
      body: 
        Consumer<ExpenseProvider>
        ( 
          builder: (context, provider, child)
          {
            return ListView.builder
            (
              itemCount: provider.expenses.length,
              itemBuilder: 
              (context, index)
              {
                final expense = provider.expenses[index];
                return ListTile
                (
                  title: Row
                  (
                    children: 
                    [
                      Text(expense.date),
                      Text(expense.category),
                      Text(expense.tag),
                      Text(expense.notes),
                      Text(expense.payee),
                      Text(expense.amount.toString()),

                    ]
                  ),
                  // Edition per tile
                  onTap: 
                    () 
                    =>
                      Navigator.push
                      (
                        context, 
                        MaterialPageRoute
                        (
                          builder: (context) => AddExpenseScreen(expense:expense)
                        )
                      )                
                );
              }
            );
          },          
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpenseScreen(),
            ),
          );
        },
        tooltip: 'Add Expense',
        child: Icon(Icons.add),
      ),
    );    
  }
}