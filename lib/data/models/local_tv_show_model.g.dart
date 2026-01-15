// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_tv_show_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalTVShowModelCollection on Isar {
  IsarCollection<LocalTVShowModel> get localTVShowModels => this.collection();
}

const LocalTVShowModelSchema = CollectionSchema(
  name: r'LocalTVShowModel',
  id: 5702988207025128641,
  properties: {
    r'backdropPath': PropertySchema(
      id: 0,
      name: r'backdropPath',
      type: IsarType.string,
    ),
    r'cachedAt': PropertySchema(
      id: 1,
      name: r'cachedAt',
      type: IsarType.dateTime,
    ),
    r'firstAirDate': PropertySchema(
      id: 2,
      name: r'firstAirDate',
      type: IsarType.string,
    ),
    r'genreIds': PropertySchema(
      id: 3,
      name: r'genreIds',
      type: IsarType.longList,
    ),
    r'language': PropertySchema(
      id: 4,
      name: r'language',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'originCountry': PropertySchema(
      id: 6,
      name: r'originCountry',
      type: IsarType.stringList,
    ),
    r'originalLanguage': PropertySchema(
      id: 7,
      name: r'originalLanguage',
      type: IsarType.string,
    ),
    r'originalName': PropertySchema(
      id: 8,
      name: r'originalName',
      type: IsarType.string,
    ),
    r'overview': PropertySchema(
      id: 9,
      name: r'overview',
      type: IsarType.string,
    ),
    r'pageNumber': PropertySchema(
      id: 10,
      name: r'pageNumber',
      type: IsarType.long,
    ),
    r'popularity': PropertySchema(
      id: 11,
      name: r'popularity',
      type: IsarType.double,
    ),
    r'posterPath': PropertySchema(
      id: 12,
      name: r'posterPath',
      type: IsarType.string,
    ),
    r'tmdbId': PropertySchema(
      id: 13,
      name: r'tmdbId',
      type: IsarType.long,
    ),
    r'tmdbIdLanguage': PropertySchema(
      id: 14,
      name: r'tmdbIdLanguage',
      type: IsarType.string,
    ),
    r'voteAverage': PropertySchema(
      id: 15,
      name: r'voteAverage',
      type: IsarType.double,
    ),
    r'voteCount': PropertySchema(
      id: 16,
      name: r'voteCount',
      type: IsarType.long,
    )
  },
  estimateSize: _localTVShowModelEstimateSize,
  serialize: _localTVShowModelSerialize,
  deserialize: _localTVShowModelDeserialize,
  deserializeProp: _localTVShowModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'tmdbIdLanguage': IndexSchema(
      id: -1492490674568550704,
      name: r'tmdbIdLanguage',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tmdbIdLanguage',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _localTVShowModelGetId,
  getLinks: _localTVShowModelGetLinks,
  attach: _localTVShowModelAttach,
  version: '3.1.0+1',
);

int _localTVShowModelEstimateSize(
  LocalTVShowModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.backdropPath.length * 3;
  bytesCount += 3 + object.firstAirDate.length * 3;
  bytesCount += 3 + object.genreIds.length * 8;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.originCountry.length * 3;
  {
    for (var i = 0; i < object.originCountry.length; i++) {
      final value = object.originCountry[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.originalLanguage.length * 3;
  bytesCount += 3 + object.originalName.length * 3;
  bytesCount += 3 + object.overview.length * 3;
  bytesCount += 3 + object.posterPath.length * 3;
  bytesCount += 3 + object.tmdbIdLanguage.length * 3;
  return bytesCount;
}

void _localTVShowModelSerialize(
  LocalTVShowModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backdropPath);
  writer.writeDateTime(offsets[1], object.cachedAt);
  writer.writeString(offsets[2], object.firstAirDate);
  writer.writeLongList(offsets[3], object.genreIds);
  writer.writeString(offsets[4], object.language);
  writer.writeString(offsets[5], object.name);
  writer.writeStringList(offsets[6], object.originCountry);
  writer.writeString(offsets[7], object.originalLanguage);
  writer.writeString(offsets[8], object.originalName);
  writer.writeString(offsets[9], object.overview);
  writer.writeLong(offsets[10], object.pageNumber);
  writer.writeDouble(offsets[11], object.popularity);
  writer.writeString(offsets[12], object.posterPath);
  writer.writeLong(offsets[13], object.tmdbId);
  writer.writeString(offsets[14], object.tmdbIdLanguage);
  writer.writeDouble(offsets[15], object.voteAverage);
  writer.writeLong(offsets[16], object.voteCount);
}

LocalTVShowModel _localTVShowModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalTVShowModel(
    backdropPath: reader.readString(offsets[0]),
    cachedAt: reader.readDateTime(offsets[1]),
    firstAirDate: reader.readString(offsets[2]),
    genreIds: reader.readLongList(offsets[3]) ?? [],
    id: id,
    language: reader.readString(offsets[4]),
    name: reader.readString(offsets[5]),
    originCountry: reader.readStringList(offsets[6]) ?? [],
    originalLanguage: reader.readString(offsets[7]),
    originalName: reader.readString(offsets[8]),
    overview: reader.readString(offsets[9]),
    pageNumber: reader.readLong(offsets[10]),
    popularity: reader.readDouble(offsets[11]),
    posterPath: reader.readString(offsets[12]),
    tmdbId: reader.readLong(offsets[13]),
    tmdbIdLanguage: reader.readString(offsets[14]),
    voteAverage: reader.readDouble(offsets[15]),
    voteCount: reader.readLong(offsets[16]),
  );
  return object;
}

P _localTVShowModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localTVShowModelGetId(LocalTVShowModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localTVShowModelGetLinks(LocalTVShowModel object) {
  return [];
}

void _localTVShowModelAttach(
    IsarCollection<dynamic> col, Id id, LocalTVShowModel object) {
  object.id = id;
}

extension LocalTVShowModelQueryWhereSort
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QWhere> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalTVShowModelQueryWhere
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QWhereClause> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause>
      tmdbIdLanguageEqualTo(String tmdbIdLanguage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tmdbIdLanguage',
        value: [tmdbIdLanguage],
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterWhereClause>
      tmdbIdLanguageNotEqualTo(String tmdbIdLanguage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tmdbIdLanguage',
              lower: [],
              upper: [tmdbIdLanguage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tmdbIdLanguage',
              lower: [tmdbIdLanguage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tmdbIdLanguage',
              lower: [tmdbIdLanguage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tmdbIdLanguage',
              lower: [],
              upper: [tmdbIdLanguage],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LocalTVShowModelQueryFilter
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QFilterCondition> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backdropPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backdropPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      backdropPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backdropPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      cachedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      cachedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      cachedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      cachedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cachedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstAirDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstAirDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstAirDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstAirDate',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      firstAirDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstAirDate',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genreIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genreIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genreIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genreIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      genreIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genreIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originCountry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originCountry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originCountry',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originCountry',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originCountry',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originCountryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originCountry',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      originalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'overview',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overview',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      overviewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'overview',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      pageNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      pageNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      pageNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      pageNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      popularityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'popularity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      popularityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'popularity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      popularityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'popularity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      popularityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'popularity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posterPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posterPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posterPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      posterPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posterPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tmdbId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tmdbIdLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tmdbIdLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tmdbIdLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tmdbIdLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      tmdbIdLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tmdbIdLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteAverageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteAverageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteAverageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteAverageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voteAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterFilterCondition>
      voteCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voteCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalTVShowModelQueryObject
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QFilterCondition> {}

extension LocalTVShowModelQueryLinks
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QFilterCondition> {}

extension LocalTVShowModelQuerySortBy
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QSortBy> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByBackdropPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropPath', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByBackdropPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropPath', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByFirstAirDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAirDate', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByFirstAirDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAirDate', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOriginalLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOriginalLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOriginalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalName', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOriginalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalName', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOverview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByOverviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPopularityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPosterPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPath', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByPosterPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPath', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByTmdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByTmdbIdLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbIdLanguage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByTmdbIdLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbIdLanguage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      sortByVoteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.desc);
    });
  }
}

extension LocalTVShowModelQuerySortThenBy
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QSortThenBy> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByBackdropPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropPath', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByBackdropPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropPath', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByFirstAirDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAirDate', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByFirstAirDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAirDate', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOriginalLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOriginalLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOriginalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalName', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOriginalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalName', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOverview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByOverviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPopularityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPosterPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPath', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByPosterPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterPath', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByTmdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByTmdbIdLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbIdLanguage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByTmdbIdLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbIdLanguage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.asc);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QAfterSortBy>
      thenByVoteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.desc);
    });
  }
}

extension LocalTVShowModelQueryWhereDistinct
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct> {
  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByBackdropPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backdropPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedAt');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByFirstAirDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstAirDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByGenreIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genreIds');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByOriginCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originCountry');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByOriginalLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByOriginalName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByOverview({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overview', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pageNumber');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'popularity');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByPosterPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tmdbId');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByTmdbIdLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tmdbIdLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voteAverage');
    });
  }

  QueryBuilder<LocalTVShowModel, LocalTVShowModel, QDistinct>
      distinctByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voteCount');
    });
  }
}

extension LocalTVShowModelQueryProperty
    on QueryBuilder<LocalTVShowModel, LocalTVShowModel, QQueryProperty> {
  QueryBuilder<LocalTVShowModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      backdropPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backdropPath');
    });
  }

  QueryBuilder<LocalTVShowModel, DateTime, QQueryOperations>
      cachedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedAt');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      firstAirDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstAirDate');
    });
  }

  QueryBuilder<LocalTVShowModel, List<int>, QQueryOperations>
      genreIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genreIds');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalTVShowModel, List<String>, QQueryOperations>
      originCountryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originCountry');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      originalLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalLanguage');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      originalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalName');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations> overviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overview');
    });
  }

  QueryBuilder<LocalTVShowModel, int, QQueryOperations> pageNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pageNumber');
    });
  }

  QueryBuilder<LocalTVShowModel, double, QQueryOperations>
      popularityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'popularity');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      posterPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterPath');
    });
  }

  QueryBuilder<LocalTVShowModel, int, QQueryOperations> tmdbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tmdbId');
    });
  }

  QueryBuilder<LocalTVShowModel, String, QQueryOperations>
      tmdbIdLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tmdbIdLanguage');
    });
  }

  QueryBuilder<LocalTVShowModel, double, QQueryOperations>
      voteAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voteAverage');
    });
  }

  QueryBuilder<LocalTVShowModel, int, QQueryOperations> voteCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voteCount');
    });
  }
}
