#!/bin/bash

# Generate Dart code from proto files
# Requires: protoc, protoc_plugin (fvm dart pub global activate protoc_plugin)

PROTO_DIR="../api/proto"
OUT_DIR="lib/generated"

# Detect plugin path
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
  # Windows (Git Bash / MSYS2)
  DART_PLUGIN="$USERPROFILE/AppData/Local/Pub/Cache/bin/protoc-gen-dart.bat"
else
  # macOS / Linux
  DART_PLUGIN="$HOME/.pub-cache/bin/protoc-gen-dart"
fi

mkdir -p $OUT_DIR

protoc \
  --plugin=protoc-gen-dart="$DART_PLUGIN" \
  --proto_path=$PROTO_DIR \
  --dart_out=grpc:$OUT_DIR \
  $PROTO_DIR/game.proto

echo "Generated Dart proto files in $OUT_DIR"
