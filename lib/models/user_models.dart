import 'dart:convert';

List<User> welcomeFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String welcomeToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    required this.amount,
    required this.transactions,
    required this.id,
    required this.card,
  });

  final String amount;
  final Transactions transactions;
  final String id;
  final Card card;

  factory User.fromMap(Map<String, dynamic> json) => User(
        amount: json["amount"],
        transactions: Transactions.fromMap(json["transactions"]),
        id: json["id"],
        card: Card.fromMap(json["card"]),
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "transactions": transactions.toMap(),
        "id": id,
        "card": card.toMap(),
      };
}

class Card {
  Card({
    required this.cardNumber,
    required this.cardCvv,
  });

  final String cardNumber;
  final String cardCvv;

  factory Card.fromMap(Map<String, dynamic> json) => Card(
        cardNumber: json["cardNumber"],
        cardCvv: json["cardCVV"],
      );

  Map<String, dynamic> toMap() => {
        "cardNumber": cardNumber,
        "cardCVV": cardCvv,
      };
}

class Transactions {
  Transactions({
    required this.transactionType,
    required this.transactionDescription,
    required this.transactionAmount,
    required this.date,
  });

  final String transactionType;
  final String transactionDescription;
  final String transactionAmount;
  final DateTime date;

  factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
        transactionType: json["transactionType"],
        transactionDescription: json["transactionDescription"],
        transactionAmount: json["transactionAmount"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "transactionType": transactionType,
        "transactionDescription": transactionDescription,
        "transactionAmount": transactionAmount,
        "date": date.toIso8601String(),
      };
}
