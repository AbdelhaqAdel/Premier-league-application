// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_result_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchesResultEntityAdapter extends TypeAdapter<MatchesResultEntity> {
  @override
  final int typeId = 0;

  @override
  MatchesResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchesResultEntity(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as num?,
      fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MatchesResultEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.homeNameE)
      ..writeByte(1)
      ..write(obj.homeLogoE)
      ..writeByte(2)
      ..write(obj.awayNameE)
      ..writeByte(3)
      ..write(obj.awayLogoE)
      ..writeByte(4)
      ..write(obj.scoreHomeE)
      ..writeByte(5)
      ..write(obj.scoreAwayE);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchesResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
