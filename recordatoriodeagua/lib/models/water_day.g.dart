// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterDayAdapter extends TypeAdapter<WaterDay> {
  @override
  final int typeId = 1;

  @override
  WaterDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterDay(
      date: fields[0] as DateTime,
      totalConsumed: fields[1] as double,
      logs: (fields[2] as List).cast<WaterLog>(),
    );
  }

  @override
  void write(BinaryWriter writer, WaterDay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.totalConsumed)
      ..writeByte(2)
      ..write(obj.logs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
