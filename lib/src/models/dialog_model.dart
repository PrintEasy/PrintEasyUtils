import 'dart:convert';

class DialogModel {
  factory DialogModel.error(String error) => DialogModel(
        title: 'Error',
        data: error,
        hasError: true,
      );

  factory DialogModel.success(String message) => DialogModel(
        title: 'Success',
        data: message,
        hasError: false,
      );

  factory DialogModel.fromMap(Map<String, dynamic> map) => DialogModel(
        title: map['title'] as String?,
        data: map['data'] as String,
        hasError: map['hasError'] as bool,
      );

  factory DialogModel.fromJson(String source) => DialogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  const DialogModel({
    this.title,
    required this.data,
    required this.hasError,
  });

  Map<String, dynamic> decode() => jsonDecode(data) as Map<String, dynamic>;

  final String? title;
  final String data;
  final bool hasError;

  DialogModel copyWith({
    String? title,
    String? data,
    bool? hasError,
  }) =>
      DialogModel(
        title: title ?? this.title,
        data: data ?? this.data,
        hasError: hasError ?? this.hasError,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'data': data,
        'hasError': hasError,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'IsmCallResponseModel(title: $title, data: $data, hasError: $hasError)';

  @override
  bool operator ==(covariant DialogModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.data == data && other.hasError == hasError;
  }

  @override
  int get hashCode => title.hashCode ^ data.hashCode ^ hasError.hashCode;
}
