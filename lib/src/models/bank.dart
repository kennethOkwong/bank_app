// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BankModel {
  final String bankName;
  final String bankCode;
  BankModel({
    required this.bankName,
    required this.bankCode,
  });

  BankModel copyWith({
    String? bankName,
    String? bankCode,
  }) {
    return BankModel(
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankName': bankName,
      'bankCode': bankCode,
    };
  }

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      bankName: map['bankName'] as String,
      bankCode: map['bankCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankModel.fromJson(String source) =>
      BankModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Bank(bankName: $bankName, bankCode: $bankCode)';

  @override
  bool operator ==(covariant BankModel other) {
    if (identical(this, other)) return true;

    return other.bankCode == bankName && other.bankCode == bankCode;
  }

  @override
  int get hashCode => bankName.hashCode ^ bankCode.hashCode;
}
