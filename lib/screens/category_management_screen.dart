import 'package:expense_manager/providers/expense_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/add_category_dialog.dart';

// Example for CategoryManagementScreen
class CategoryManagementScreen extends StatelessWidget {
  const CategoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Categories"),
        backgroundColor: Colors.deepPurple, // Themed color similar to your inspirations
        foregroundColor: Colors.white,
      ),
      body: Consumer<ExpenseCategoryProvider>(
        builder: (context, provider2, child) {
          return ListView.builder(
            itemCount: provider2.categories.length,
            itemBuilder: (context, index) {
              final category = provider2.categories[index];
              return ListTile(
                title: Text(category.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    provider2.deleteCategory(category.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddCategoryDialog(
              onAdd: (newCategory) {
                Provider.of<ExpenseCategoryProvider>(context, listen: false)
                    .addCategory(newCategory);
                Navigator.pop(context); // Close the dialog
              },
            ),
          );
        },
        tooltip: 'Add New Category',
        child: Icon(Icons.add),
      ),
    );
  }
}
