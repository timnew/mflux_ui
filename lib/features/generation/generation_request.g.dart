// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageSizeImpl _$$ImageSizeImplFromJson(Map<String, dynamic> json) =>
    _$ImageSizeImpl(
      (json['width'] as num).toInt(),
      (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageSizeImplToJson(_$ImageSizeImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_$GenerationOptionsImpl _$$GenerationOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerationOptionsImpl(
      model: $enumDecode(_$FluxModelEnumMap, json['model']),
      seed: (json['seed'] as num?)?.toInt(),
      size: ImageSize.fromJson(json['size'] as Map<String, dynamic>),
      steps: (json['steps'] as num).toInt(),
      guidance: (json['guidance'] as num?)?.toDouble(),
      quantize: (json['quantize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GenerationOptionsImplToJson(
        _$GenerationOptionsImpl instance) =>
    <String, dynamic>{
      'model': _$FluxModelEnumMap[instance.model]!,
      'seed': instance.seed,
      'size': instance.size,
      'steps': instance.steps,
      'guidance': instance.guidance,
      'quantize': instance.quantize,
    };

const _$FluxModelEnumMap = {
  FluxModel.schnell: 'schnell',
  FluxModel.dev: 'dev',
};
