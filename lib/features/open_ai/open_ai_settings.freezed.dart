// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenAiSettings _$OpenAiSettingsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'none':
      return _None.fromJson(json);
    case 'openAi':
      return _OpenAiSettings.fromJson(json);
    case 'azure':
      return _AzureSettings.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OpenAiSettings',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OpenAiSettings {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String apiKey, String? organization) openAi,
    required TResult Function(String apiKey, String endpoint, String deployment)
        azure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String apiKey, String? organization)? openAi,
    TResult? Function(String apiKey, String endpoint, String deployment)? azure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String apiKey, String? organization)? openAi,
    TResult Function(String apiKey, String endpoint, String deployment)? azure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_OpenAiSettings value) openAi,
    required TResult Function(_AzureSettings value) azure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_OpenAiSettings value)? openAi,
    TResult? Function(_AzureSettings value)? azure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_OpenAiSettings value)? openAi,
    TResult Function(_AzureSettings value)? azure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this OpenAiSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiSettingsCopyWith<$Res> {
  factory $OpenAiSettingsCopyWith(
          OpenAiSettings value, $Res Function(OpenAiSettings) then) =
      _$OpenAiSettingsCopyWithImpl<$Res, OpenAiSettings>;
}

/// @nodoc
class _$OpenAiSettingsCopyWithImpl<$Res, $Val extends OpenAiSettings>
    implements $OpenAiSettingsCopyWith<$Res> {
  _$OpenAiSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NoneImplCopyWith<$Res> {
  factory _$$NoneImplCopyWith(
          _$NoneImpl value, $Res Function(_$NoneImpl) then) =
      __$$NoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneImplCopyWithImpl<$Res>
    extends _$OpenAiSettingsCopyWithImpl<$Res, _$NoneImpl>
    implements _$$NoneImplCopyWith<$Res> {
  __$$NoneImplCopyWithImpl(_$NoneImpl _value, $Res Function(_$NoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NoneImpl extends _None {
  const _$NoneImpl({final String? $type})
      : $type = $type ?? 'none',
        super._();

  factory _$NoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoneImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpenAiSettings.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoneImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String apiKey, String? organization) openAi,
    required TResult Function(String apiKey, String endpoint, String deployment)
        azure,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String apiKey, String? organization)? openAi,
    TResult? Function(String apiKey, String endpoint, String deployment)? azure,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String apiKey, String? organization)? openAi,
    TResult Function(String apiKey, String endpoint, String deployment)? azure,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_OpenAiSettings value) openAi,
    required TResult Function(_AzureSettings value) azure,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_OpenAiSettings value)? openAi,
    TResult? Function(_AzureSettings value)? azure,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_OpenAiSettings value)? openAi,
    TResult Function(_AzureSettings value)? azure,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoneImplToJson(
      this,
    );
  }
}

abstract class _None extends OpenAiSettings {
  const factory _None() = _$NoneImpl;
  const _None._() : super._();

  factory _None.fromJson(Map<String, dynamic> json) = _$NoneImpl.fromJson;
}

/// @nodoc
abstract class _$$OpenAiSettingsImplCopyWith<$Res> {
  factory _$$OpenAiSettingsImplCopyWith(_$OpenAiSettingsImpl value,
          $Res Function(_$OpenAiSettingsImpl) then) =
      __$$OpenAiSettingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String apiKey, String? organization});
}

/// @nodoc
class __$$OpenAiSettingsImplCopyWithImpl<$Res>
    extends _$OpenAiSettingsCopyWithImpl<$Res, _$OpenAiSettingsImpl>
    implements _$$OpenAiSettingsImplCopyWith<$Res> {
  __$$OpenAiSettingsImplCopyWithImpl(
      _$OpenAiSettingsImpl _value, $Res Function(_$OpenAiSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? organization = freezed,
  }) {
    return _then(_$OpenAiSettingsImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAiSettingsImpl extends _OpenAiSettings {
  const _$OpenAiSettingsImpl(
      {required this.apiKey, this.organization, final String? $type})
      : $type = $type ?? 'openAi',
        super._();

  factory _$OpenAiSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAiSettingsImplFromJson(json);

  @override
  final String apiKey;
  @override
  final String? organization;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpenAiSettings.openAi(apiKey: $apiKey, organization: $organization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiSettingsImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, organization);

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiSettingsImplCopyWith<_$OpenAiSettingsImpl> get copyWith =>
      __$$OpenAiSettingsImplCopyWithImpl<_$OpenAiSettingsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String apiKey, String? organization) openAi,
    required TResult Function(String apiKey, String endpoint, String deployment)
        azure,
  }) {
    return openAi(apiKey, organization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String apiKey, String? organization)? openAi,
    TResult? Function(String apiKey, String endpoint, String deployment)? azure,
  }) {
    return openAi?.call(apiKey, organization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String apiKey, String? organization)? openAi,
    TResult Function(String apiKey, String endpoint, String deployment)? azure,
    required TResult orElse(),
  }) {
    if (openAi != null) {
      return openAi(apiKey, organization);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_OpenAiSettings value) openAi,
    required TResult Function(_AzureSettings value) azure,
  }) {
    return openAi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_OpenAiSettings value)? openAi,
    TResult? Function(_AzureSettings value)? azure,
  }) {
    return openAi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_OpenAiSettings value)? openAi,
    TResult Function(_AzureSettings value)? azure,
    required TResult orElse(),
  }) {
    if (openAi != null) {
      return openAi(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAiSettingsImplToJson(
      this,
    );
  }
}

abstract class _OpenAiSettings extends OpenAiSettings {
  const factory _OpenAiSettings(
      {required final String apiKey,
      final String? organization}) = _$OpenAiSettingsImpl;
  const _OpenAiSettings._() : super._();

  factory _OpenAiSettings.fromJson(Map<String, dynamic> json) =
      _$OpenAiSettingsImpl.fromJson;

  String get apiKey;
  String? get organization;

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAiSettingsImplCopyWith<_$OpenAiSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AzureSettingsImplCopyWith<$Res> {
  factory _$$AzureSettingsImplCopyWith(
          _$AzureSettingsImpl value, $Res Function(_$AzureSettingsImpl) then) =
      __$$AzureSettingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String apiKey, String endpoint, String deployment});
}

/// @nodoc
class __$$AzureSettingsImplCopyWithImpl<$Res>
    extends _$OpenAiSettingsCopyWithImpl<$Res, _$AzureSettingsImpl>
    implements _$$AzureSettingsImplCopyWith<$Res> {
  __$$AzureSettingsImplCopyWithImpl(
      _$AzureSettingsImpl _value, $Res Function(_$AzureSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? endpoint = null,
    Object? deployment = null,
  }) {
    return _then(_$AzureSettingsImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      deployment: null == deployment
          ? _value.deployment
          : deployment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AzureSettingsImpl extends _AzureSettings {
  const _$AzureSettingsImpl(
      {required this.apiKey,
      required this.endpoint,
      required this.deployment,
      final String? $type})
      : $type = $type ?? 'azure',
        super._();

  factory _$AzureSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AzureSettingsImplFromJson(json);

  @override
  final String apiKey;
  @override
  final String endpoint;
  @override
  final String deployment;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpenAiSettings.azure(apiKey: $apiKey, endpoint: $endpoint, deployment: $deployment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AzureSettingsImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.deployment, deployment) ||
                other.deployment == deployment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, endpoint, deployment);

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AzureSettingsImplCopyWith<_$AzureSettingsImpl> get copyWith =>
      __$$AzureSettingsImplCopyWithImpl<_$AzureSettingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String apiKey, String? organization) openAi,
    required TResult Function(String apiKey, String endpoint, String deployment)
        azure,
  }) {
    return azure(apiKey, endpoint, deployment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String apiKey, String? organization)? openAi,
    TResult? Function(String apiKey, String endpoint, String deployment)? azure,
  }) {
    return azure?.call(apiKey, endpoint, deployment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String apiKey, String? organization)? openAi,
    TResult Function(String apiKey, String endpoint, String deployment)? azure,
    required TResult orElse(),
  }) {
    if (azure != null) {
      return azure(apiKey, endpoint, deployment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_OpenAiSettings value) openAi,
    required TResult Function(_AzureSettings value) azure,
  }) {
    return azure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_OpenAiSettings value)? openAi,
    TResult? Function(_AzureSettings value)? azure,
  }) {
    return azure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_OpenAiSettings value)? openAi,
    TResult Function(_AzureSettings value)? azure,
    required TResult orElse(),
  }) {
    if (azure != null) {
      return azure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AzureSettingsImplToJson(
      this,
    );
  }
}

abstract class _AzureSettings extends OpenAiSettings {
  const factory _AzureSettings(
      {required final String apiKey,
      required final String endpoint,
      required final String deployment}) = _$AzureSettingsImpl;
  const _AzureSettings._() : super._();

  factory _AzureSettings.fromJson(Map<String, dynamic> json) =
      _$AzureSettingsImpl.fromJson;

  String get apiKey;
  String get endpoint;
  String get deployment;

  /// Create a copy of OpenAiSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AzureSettingsImplCopyWith<_$AzureSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
