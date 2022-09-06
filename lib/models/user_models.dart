import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
    required this.amount,
    required this.transactions,
    required this.card,
  });

  final DateTime createdAt;
  final String name;
  final String avatar;
  final String id;
  final String amount;
  final List<Transaction> transactions;
  final Card card;

  factory User.fromMap(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
        amount: json["amount"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromMap(x))),
        card: Card.fromMap(json["card"]),
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "id": id,
        "amount": amount,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toMap())),
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

class Transaction {
  Transaction({
    required this.transactionType,
    required this.transactionDescription,
    required this.transactionAmount,
  });

  final String transactionType;
  final String transactionDescription;
  final String transactionAmount;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        transactionType: json["transactionType"],
        transactionDescription: json["transactionDescription"],
        transactionAmount: json["transactionAmount"],
      );

  Map<String, dynamic> toMap() => {
        "transactionType": transactionType,
        "transactionDescription": transactionDescription,
        "transactionAmount": transactionAmount,
      };
}
