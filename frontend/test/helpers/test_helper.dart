import 'package:mockito/annotations.dart';
import '../../lib/src/feature/data/todo_repository.dart';
import '../../lib/src/feature/domain/completion_status_converter.dart';
import '../../../grpc/client/lib/src/grpc/todo/todo.pbgrpc.dart';


@GenerateMocks(
  [
   TodoRepository,
   CompletionStatusConverter,
  ],
  customMocks: [MockSpec<TodoServiceClient>(as: #MockTodoServiceClient)],
)

void main() {}
