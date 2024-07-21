import 'dart:convert';

class RazorpayPaymentModel {
  RazorpayPaymentModel({
    this.paymentId,
    this.orderId,
    this.signature,
  });

  factory RazorpayPaymentModel.fromMap(Map<String, dynamic> map) => RazorpayPaymentModel(
        paymentId: map['paymentId'] as String?,
        orderId: map['orderId'] as String?,
        signature: map['signature'] as String?,
      );

  factory RazorpayPaymentModel.fromJson(
    String source,
  ) =>
      RazorpayPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? paymentId;
  final String? orderId;
  final String? signature;

  RazorpayPaymentModel copyWith({
    String? paymentId,
    String? orderId,
    String? signature,
  }) =>
      RazorpayPaymentModel(
        paymentId: paymentId ?? this.paymentId,
        orderId: orderId ?? this.orderId,
        signature: signature ?? this.signature,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'paymentId': paymentId,
        'orderId': orderId,
        'signature': signature,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'RazorpayPaymentModel(paymentId: $paymentId, orderId: $orderId, signature: $signature)';

  @override
  bool operator ==(covariant RazorpayPaymentModel other) {
    if (identical(this, other)) return true;

    return other.paymentId == paymentId && other.orderId == orderId && other.signature == signature;
  }

  @override
  int get hashCode => paymentId.hashCode ^ orderId.hashCode ^ signature.hashCode;
}
