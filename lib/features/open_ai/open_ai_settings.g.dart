// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoneImpl _$$NoneImplFromJson(Map<String, dynamic> json) => _$NoneImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoneImplToJson(_$NoneImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$OpenAiSettingsImpl _$$OpenAiSettingsImplFromJson(Map<String, dynamic> json) =>
    _$OpenAiSettingsImpl(
      apiKey: json['apiKey'] as String,
      organization: json['organization'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OpenAiSettingsImplToJson(
        _$OpenAiSettingsImpl instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'organization': instance.organization,
      'runtimeType': instance.$type,
    };

_$AzureSettingsImpl _$$AzureSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AzureSettingsImpl(
      apiKey: json['apiKey'] as String,
      endpoint: json['endpoint'] as String,
      deployment: json['deployment'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AzureSettingsImplToJson(_$AzureSettingsImpl instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'endpoint': instance.endpoint,
      'deployment': instance.deployment,
      'runtimeType': instance.$type,
    };
