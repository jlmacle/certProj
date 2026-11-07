class Expense 
{
  final int? id;
  final String date;
  final String category;
  final String tag;
  final String notes;
  final String payee;
  final double amount;

  Expense ({this.id, required this.date, required this.category, required this.tag, required this.notes, required this.payee, required this.amount});

  factory Expense.fromJson(Map<String, dynamic> json)
  {
    return Expense
    (
      id: json["id"],
      date: json["date"],
      category: json["category"],
      tag: json["tag"],
      notes: json["notes"],
      payee: json["payee"],
      amount: json["amount"],  
    );
  }
 
  Map<String, dynamic> toJson()
  {
    return
    {
      "id": id,
      "date": date,
      "category": category,
      "tag": tag,
      "notes": notes,
      "payee": payee,
      "amount": amount
    };
  }

}