

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
import 'package:flutter/foundation.dart';
import 'package:flutter_grpc_common/grpc.dart';
import 'package:grpc/grpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../lib/src/core/client/grpc_channel.dart';
import 'package:flutter_grpc_common/grpc.dart';
import 'package:grpc/grpc.dart';

class todpGreeterClient extends Mock implements TodoServiceClient {}

class MockTodoServiceClient extends Mock implements TodoServiceClient {}

void main() {
  late TodoModel todoModel;
  late TodoRepository todoRepository;
  late MockTodoServiceClient mockTodoServiceClient;

  setUp(() {
     final channel = ClientChannel(
    '10.0.2.2',  //android emulatorのlocalhost
    port: 8081, 
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
    mockTodoServiceClient = MockTodoServiceClient();
    // Assuming TodoRepository is adjusted to accept a gRPC client as dependency for easier testing
    todoRepository = TodoRepository(channel);
    todoModel = TodoModel(
      id: "sample1",
      content: 'Test',
      status: CompletionStatus.Incomplete,
    );
  });

  test('Greeter service returns expected message', () async {
    // Setup your mock to return a specific response
    final request = Empty(); // Assuming this is the correct request type
    final todos = [todoModel]; // Mock response contains a list of TodoModel
    final response = GetTodosResponse();

    // when(mockTodoServiceClient.getTodos(request)).thenAnswer((_) async => todos);

    // Assuming TodoRepository has a method that eventually calls `getTodos` on the gRPC client
    final result = await todoRepository.getTodos();

    // Adjust the expectation according to how your response is structured
    // For example, if `result` is a list of `TodoModel`, you can check if it contains `todoModel`
    expect(result, contains(todoModel));
  });
}
