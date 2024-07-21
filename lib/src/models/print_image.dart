import 'dart:convert';

class PrintImage {
  const PrintImage({
    this.id,
    this.type,
    this.url,
    this.alternateText,
    this.thumbnailUrl,
  });

  factory PrintImage.fromMap(
    Map<String, dynamic> map,
  ) =>
      PrintImage(
        id: map['id'] as String?,
        type: map['type'] as String?,
        url: map['url'] as String?,
        alternateText: map['alternateText'] as String?,
        thumbnailUrl: map['thumbnailUrl'] as String?,
      );

  factory PrintImage.fromJson(
    String source,
  ) =>
      PrintImage.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String? id;
  final String? type;
  final String? url;
  final String? alternateText;
  final String? thumbnailUrl;

  PrintImage copyWith({
    String? id,
    String? type,
    String? url,
    String? alternateText,
    String? thumbnailUrl,
  }) =>
      PrintImage(
        id: id ?? this.id,
        type: type ?? this.type,
        url: url ?? this.url,
        alternateText: alternateText ?? this.alternateText,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'type': type,
        'url': url,
        'alternateText': alternateText,
        'thumbnailUrl': thumbnailUrl,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PrintImage(id: $id, type: $type, url: $url, alternateText: $alternateText, thumbnailUrl: $thumbnailUrl)';

  @override
  bool operator ==(covariant PrintImage other) {
    if (identical(this, other)) return true;

    return other.id == id && other.type == type && other.url == url && other.alternateText == alternateText && other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ url.hashCode ^ alternateText.hashCode ^ thumbnailUrl.hashCode;
}
