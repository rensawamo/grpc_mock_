import 'package:flutter_grpc_common/grpc.dart';
import 'completion_status_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String id,
    required String content,
    @CompletionStatusConverter() required CompletionStatus status,
  }) = _TodoModel;

  const TodoModel._();

  factory TodoModel.fromJson(Map<String, Object?> json) =>
      _$TodoModelFromJson(json);
}