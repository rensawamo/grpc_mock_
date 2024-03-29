import 'package:flutter_grpc_common/grpc.dart';
import 'package:mockito/annotations.dart';
import '../../lib/src/feature/data/todo_repository.dart';
import '../../lib/src/feature/domain/completion_status_converter.dart';
import 'package:grpc/grpc.dart';


@GenerateMocks(
  [
   TodoRepository,
   CompletionStatusConverter,
  ],
  customMocks: [MockSpec<TodoServiceClient>(as: #MockTodoServiceClient)],
)

void main() {}
