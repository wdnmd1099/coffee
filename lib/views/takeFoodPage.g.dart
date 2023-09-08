// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'takeFoodPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaveData _$HaveDataFromJson(Map<String, dynamic> json) => HaveData(
      Type: json['Type'] as int,
      Code: json['Code'] as int,
      Desc: json['Desc'] as String,
      Data: json['Data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$HaveDataToJson(HaveData instance) => <String, dynamic>{
      'Type': instance.Type,
      'Code': instance.Code,
      'Desc': instance.Desc,
      'Data': instance.Data,
    };

IsData _$IsDataFromJson(Map<String, dynamic> json) => IsData(
      Count: json['Count'] as int,
      Data: json['Data'] as List<dynamic>,
    );

Map<String, dynamic> _$IsDataToJson(IsData instance) => <String, dynamic>{
      'Count': instance.Count,
      'Data': instance.Data,
    };
