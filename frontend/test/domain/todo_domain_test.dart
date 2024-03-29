

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../lib/src/feature/data/todo_repository.dart';
import '../../lib/src/feature/domain/todo_entity.dart';
import '../../lib/src/feature/domain/completion_status_converter.dart';
import '../helpers/test_helper.mocks.dart';
import 'package:flutter_grpc_common/grpc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

void main() {
  
  late TodoModel todoModel;
  late MockTodoServiceClient mockTodoServiceClient ;

  setUp((){
    mockTodoServiceClient = MockTodoServiceClient();
    todoModel = TodoModel(
      id: "sample1",
      content: 'Test',
      status: CompletionStatus.Incomplete,
    );
  });

}
