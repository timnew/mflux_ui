// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) {
  return _ImageSize.fromJson(json);
}

/// @nodoc
mixin _$ImageSize {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this ImageSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageSizeCopyWith<ImageSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSizeCopyWith<$Res> {
  factory $ImageSizeCopyWith(ImageSize value, $Res Function(ImageSize) then) =
      _$ImageSizeCopyWithImpl<$Res, ImageSize>;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$ImageSizeCopyWithImpl<$Res, $Val extends ImageSize>
    implements $ImageSizeCopyWith<$Res> {
  _$ImageSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageSizeImplCopyWith<$Res>
    implements $ImageSizeCopyWith<$Res> {
  factory _$$ImageSizeImplCopyWith(
          _$ImageSizeImpl value, $Res Function(_$ImageSizeImpl) then) =
      __$$ImageSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$$ImageSizeImplCopyWithImpl<$Res>
    extends _$ImageSizeCopyWithImpl<$Res, _$ImageSizeImpl>
    implements _$$ImageSizeImplCopyWith<$Res> {
  __$$ImageSizeImplCopyWithImpl(
      _$ImageSizeImpl _value, $Res Function(_$ImageSizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$ImageSizeImpl(
      null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageSizeImpl extends _ImageSize {
  const _$ImageSizeImpl(this.width, this.height) : super._();

  factory _$ImageSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageSizeImplFromJson(json);

  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'ImageSize(width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSizeImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  /// Create a copy of ImageSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSizeImplCopyWith<_$ImageSizeImpl> get copyWith =>
      __$$ImageSizeImplCopyWithImpl<_$ImageSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageSizeImplToJson(
      this,
    );
  }
}

abstract class _ImageSize extends ImageSize {
  const factory _ImageSize(final int width, final int height) = _$ImageSizeImpl;
  const _ImageSize._() : super._();

  factory _ImageSize.fromJson(Map<String, dynamic> json) =
      _$ImageSizeImpl.fromJson;

  @override
  int get width;
  @override
  int get height;

  /// Create a copy of ImageSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageSizeImplCopyWith<_$ImageSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerationOptions _$GenerationOptionsFromJson(Map<String, dynamic> json) {
  return _GenerationOptions.fromJson(json);
}

/// @nodoc
mixin _$GenerationOptions {
  FluxModel get model => throw _privateConstructorUsedError;
  int? get seed => throw _privateConstructorUsedError;
  ImageSize get size => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  double? get guidance => throw _privateConstructorUsedError;
  int? get quantize => throw _privateConstructorUsedError;

  /// Serializes this GenerationOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationOptionsCopyWith<GenerationOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationOptionsCopyWith<$Res> {
  factory $GenerationOptionsCopyWith(
          GenerationOptions value, $Res Function(GenerationOptions) then) =
      _$GenerationOptionsCopyWithImpl<$Res, GenerationOptions>;
  @useResult
  $Res call(
      {FluxModel model,
      int? seed,
      ImageSize size,
      int steps,
      double? guidance,
      int? quantize});

  $ImageSizeCopyWith<$Res> get size;
}

/// @nodoc
class _$GenerationOptionsCopyWithImpl<$Res, $Val extends GenerationOptions>
    implements $GenerationOptionsCopyWith<$Res> {
  _$GenerationOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? seed = freezed,
    Object? size = null,
    Object? steps = null,
    Object? guidance = freezed,
    Object? quantize = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as FluxModel,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as ImageSize,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      guidance: freezed == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as double?,
      quantize: freezed == quantize
          ? _value.quantize
          : quantize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSizeCopyWith<$Res> get size {
    return $ImageSizeCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerationOptionsImplCopyWith<$Res>
    implements $GenerationOptionsCopyWith<$Res> {
  factory _$$GenerationOptionsImplCopyWith(_$GenerationOptionsImpl value,
          $Res Function(_$GenerationOptionsImpl) then) =
      __$$GenerationOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FluxModel model,
      int? seed,
      ImageSize size,
      int steps,
      double? guidance,
      int? quantize});

  @override
  $ImageSizeCopyWith<$Res> get size;
}

/// @nodoc
class __$$GenerationOptionsImplCopyWithImpl<$Res>
    extends _$GenerationOptionsCopyWithImpl<$Res, _$GenerationOptionsImpl>
    implements _$$GenerationOptionsImplCopyWith<$Res> {
  __$$GenerationOptionsImplCopyWithImpl(_$GenerationOptionsImpl _value,
      $Res Function(_$GenerationOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? seed = freezed,
    Object? size = null,
    Object? steps = null,
    Object? guidance = freezed,
    Object? quantize = freezed,
  }) {
    return _then(_$GenerationOptionsImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as FluxModel,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as ImageSize,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      guidance: freezed == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as double?,
      quantize: freezed == quantize
          ? _value.quantize
          : quantize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationOptionsImpl extends _GenerationOptions {
  const _$GenerationOptionsImpl(
      {required this.model,
      required this.seed,
      required this.size,
      required this.steps,
      required this.guidance,
      required this.quantize})
      : assert(quantize == null || quantize == 4 || quantize == 8,
            'quantize must be null, 4, or 8'),
        assert(guidance == null || guidance >= 0.1 && guidance <= 100,
            'guidance must be null, or between 0.1 and 100'),
        super._();

  factory _$GenerationOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationOptionsImplFromJson(json);

  @override
  final FluxModel model;
  @override
  final int? seed;
  @override
  final ImageSize size;
  @override
  final int steps;
  @override
  final double? guidance;
  @override
  final int? quantize;

  @override
  String toString() {
    return 'GenerationOptions(model: $model, seed: $seed, size: $size, steps: $steps, guidance: $guidance, quantize: $quantize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationOptionsImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            (identical(other.quantize, quantize) ||
                other.quantize == quantize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, model, seed, size, steps, guidance, quantize);

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationOptionsImplCopyWith<_$GenerationOptionsImpl> get copyWith =>
      __$$GenerationOptionsImplCopyWithImpl<_$GenerationOptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationOptionsImplToJson(
      this,
    );
  }
}

abstract class _GenerationOptions extends GenerationOptions {
  const factory _GenerationOptions(
      {required final FluxModel model,
      required final int? seed,
      required final ImageSize size,
      required final int steps,
      required final double? guidance,
      required final int? quantize}) = _$GenerationOptionsImpl;
  const _GenerationOptions._() : super._();

  factory _GenerationOptions.fromJson(Map<String, dynamic> json) =
      _$GenerationOptionsImpl.fromJson;

  @override
  FluxModel get model;
  @override
  int? get seed;
  @override
  ImageSize get size;
  @override
  int get steps;
  @override
  double? get guidance;
  @override
  int? get quantize;

  /// Create a copy of GenerationOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationOptionsImplCopyWith<_$GenerationOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GenerationRequest {
  GenerationOptions get options => throw _privateConstructorUsedError;
  String get binaryPath => throw _privateConstructorUsedError;
  String get output => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationRequestCopyWith<GenerationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationRequestCopyWith<$Res> {
  factory $GenerationRequestCopyWith(
          GenerationRequest value, $Res Function(GenerationRequest) then) =
      _$GenerationRequestCopyWithImpl<$Res, GenerationRequest>;
  @useResult
  $Res call(
      {GenerationOptions options,
      String binaryPath,
      String output,
      String prompt});

  $GenerationOptionsCopyWith<$Res> get options;
}

/// @nodoc
class _$GenerationRequestCopyWithImpl<$Res, $Val extends GenerationRequest>
    implements $GenerationRequestCopyWith<$Res> {
  _$GenerationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
    Object? binaryPath = null,
    Object? output = null,
    Object? prompt = null,
  }) {
    return _then(_value.copyWith(
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as GenerationOptions,
      binaryPath: null == binaryPath
          ? _value.binaryPath
          : binaryPath // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerationOptionsCopyWith<$Res> get options {
    return $GenerationOptionsCopyWith<$Res>(_value.options, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerationRequestImplCopyWith<$Res>
    implements $GenerationRequestCopyWith<$Res> {
  factory _$$GenerationRequestImplCopyWith(_$GenerationRequestImpl value,
          $Res Function(_$GenerationRequestImpl) then) =
      __$$GenerationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenerationOptions options,
      String binaryPath,
      String output,
      String prompt});

  @override
  $GenerationOptionsCopyWith<$Res> get options;
}

/// @nodoc
class __$$GenerationRequestImplCopyWithImpl<$Res>
    extends _$GenerationRequestCopyWithImpl<$Res, _$GenerationRequestImpl>
    implements _$$GenerationRequestImplCopyWith<$Res> {
  __$$GenerationRequestImplCopyWithImpl(_$GenerationRequestImpl _value,
      $Res Function(_$GenerationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
    Object? binaryPath = null,
    Object? output = null,
    Object? prompt = null,
  }) {
    return _then(_$GenerationRequestImpl(
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as GenerationOptions,
      binaryPath: null == binaryPath
          ? _value.binaryPath
          : binaryPath // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GenerationRequestImpl extends _GenerationRequest {
  const _$GenerationRequestImpl(
      {required this.options,
      required this.binaryPath,
      required this.output,
      required this.prompt})
      : super._();

  @override
  final GenerationOptions options;
  @override
  final String binaryPath;
  @override
  final String output;
  @override
  final String prompt;

  @override
  String toString() {
    return 'GenerationRequest(options: $options, binaryPath: $binaryPath, output: $output, prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationRequestImpl &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.binaryPath, binaryPath) ||
                other.binaryPath == binaryPath) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, options, binaryPath, output, prompt);

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationRequestImplCopyWith<_$GenerationRequestImpl> get copyWith =>
      __$$GenerationRequestImplCopyWithImpl<_$GenerationRequestImpl>(
          this, _$identity);
}

abstract class _GenerationRequest extends GenerationRequest {
  const factory _GenerationRequest(
      {required final GenerationOptions options,
      required final String binaryPath,
      required final String output,
      required final String prompt}) = _$GenerationRequestImpl;
  const _GenerationRequest._() : super._();

  @override
  GenerationOptions get options;
  @override
  String get binaryPath;
  @override
  String get output;
  @override
  String get prompt;

  /// Create a copy of GenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationRequestImplCopyWith<_$GenerationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
