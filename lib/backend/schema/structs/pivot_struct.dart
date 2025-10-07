// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PivotStruct extends BaseStruct {
  PivotStruct({
    int? artArticleId,
    int? articleId,
  })  : _artArticleId = artArticleId,
        _articleId = articleId;

  // "art_article_id" field.
  int? _artArticleId;
  int get artArticleId => _artArticleId ?? 0;
  set artArticleId(int? val) => _artArticleId = val;

  void incrementArtArticleId(int amount) =>
      artArticleId = artArticleId + amount;

  bool hasArtArticleId() => _artArticleId != null;

  // "article_id" field.
  int? _articleId;
  int get articleId => _articleId ?? 0;
  set articleId(int? val) => _articleId = val;

  void incrementArticleId(int amount) => articleId = articleId + amount;

  bool hasArticleId() => _articleId != null;

  static PivotStruct fromMap(Map<String, dynamic> data) => PivotStruct(
        artArticleId: castToType<int>(data['art_article_id']),
        articleId: castToType<int>(data['article_id']),
      );

  static PivotStruct? maybeFromMap(dynamic data) =>
      data is Map ? PivotStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'art_article_id': _artArticleId,
        'article_id': _articleId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'art_article_id': serializeParam(
          _artArticleId,
          ParamType.int,
        ),
        'article_id': serializeParam(
          _articleId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PivotStruct fromSerializableMap(Map<String, dynamic> data) =>
      PivotStruct(
        artArticleId: deserializeParam(
          data['art_article_id'],
          ParamType.int,
          false,
        ),
        articleId: deserializeParam(
          data['article_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PivotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PivotStruct &&
        artArticleId == other.artArticleId &&
        articleId == other.articleId;
  }

  @override
  int get hashCode => const ListEquality().hash([artArticleId, articleId]);
}

PivotStruct createPivotStruct({
  int? artArticleId,
  int? articleId,
}) =>
    PivotStruct(
      artArticleId: artArticleId,
      articleId: articleId,
    );
