// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_view_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageViewItem _$PageViewItemFromJson(Map<String, dynamic> json) {
  return _PageViewItem.fromJson(json);
}

/// @nodoc
mixin _$PageViewItem {
  int get id => throw _privateConstructorUsedError;
  String get imgPath => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageViewItemCopyWith<PageViewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageViewItemCopyWith<$Res> {
  factory $PageViewItemCopyWith(
          PageViewItem value, $Res Function(PageViewItem) then) =
      _$PageViewItemCopyWithImpl<$Res>;
  $Res call({int id, String imgPath, String url});
}

/// @nodoc
class _$PageViewItemCopyWithImpl<$Res> implements $PageViewItemCopyWith<$Res> {
  _$PageViewItemCopyWithImpl(this._value, this._then);

  final PageViewItem _value;
  // ignore: unused_field
  final $Res Function(PageViewItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imgPath = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imgPath: imgPath == freezed
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PageViewItemCopyWith<$Res>
    implements $PageViewItemCopyWith<$Res> {
  factory _$$_PageViewItemCopyWith(
          _$_PageViewItem value, $Res Function(_$_PageViewItem) then) =
      __$$_PageViewItemCopyWithImpl<$Res>;
  @override
  $Res call({int id, String imgPath, String url});
}

/// @nodoc
class __$$_PageViewItemCopyWithImpl<$Res>
    extends _$PageViewItemCopyWithImpl<$Res>
    implements _$$_PageViewItemCopyWith<$Res> {
  __$$_PageViewItemCopyWithImpl(
      _$_PageViewItem _value, $Res Function(_$_PageViewItem) _then)
      : super(_value, (v) => _then(v as _$_PageViewItem));

  @override
  _$_PageViewItem get _value => super._value as _$_PageViewItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? imgPath = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_PageViewItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imgPath: imgPath == freezed
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageViewItem implements _PageViewItem {
  _$_PageViewItem({required this.id, required this.imgPath, required this.url});

  factory _$_PageViewItem.fromJson(Map<String, dynamic> json) =>
      _$$_PageViewItemFromJson(json);

  @override
  final int id;
  @override
  final String imgPath;
  @override
  final String url;

  @override
  String toString() {
    return 'PageViewItem(id: $id, imgPath: $imgPath, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageViewItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imgPath, imgPath) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imgPath),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_PageViewItemCopyWith<_$_PageViewItem> get copyWith =>
      __$$_PageViewItemCopyWithImpl<_$_PageViewItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageViewItemToJson(
      this,
    );
  }
}

abstract class _PageViewItem implements PageViewItem {
  factory _PageViewItem(
      {required final int id,
      required final String imgPath,
      required final String url}) = _$_PageViewItem;

  factory _PageViewItem.fromJson(Map<String, dynamic> json) =
      _$_PageViewItem.fromJson;

  @override
  int get id;
  @override
  String get imgPath;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PageViewItemCopyWith<_$_PageViewItem> get copyWith =>
      throw _privateConstructorUsedError;
}
