// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      t1000: fields[0] as String,
      t500: fields[1] as String,
      t200: fields[2] as String,
      t100: fields[3] as String,
      t50: fields[4] as String,
      t20: fields[5] as String,
      t10: fields[6] as String,
      t5: fields[7] as String,
      t2: fields[8] as String,
      t1: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.t1000)
      ..writeByte(1)
      ..write(obj.t500)
      ..writeByte(2)
      ..write(obj.t200)
      ..writeByte(3)
      ..write(obj.t100)
      ..writeByte(4)
      ..write(obj.t50)
      ..writeByte(5)
      ..write(obj.t20)
      ..writeByte(6)
      ..write(obj.t10)
      ..writeByte(7)
      ..write(obj.t5)
      ..writeByte(8)
      ..write(obj.t2)
      ..writeByte(9)
      ..write(obj.t1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
