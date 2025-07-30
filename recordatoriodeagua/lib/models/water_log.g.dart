// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterLogAdapter extends TypeAdapter<WaterLog> {
  @override
  final int typeId = 0;

  @override
  WaterLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterLog(
      time: fields[0] as DateTime,
      amount: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WaterLog obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
