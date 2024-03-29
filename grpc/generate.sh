protoc --dart_out=grpc:client/lib/src/grpc -I protos \
    protos/*/*.proto \
    --dart_out=grpc:gRPC google/protobuf/timestamp.proto