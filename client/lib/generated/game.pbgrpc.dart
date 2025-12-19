//
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'game.pb.dart' as $0;

export 'game.pb.dart';

@$pb.GrpcServiceName('game.v1.GameService')
class GameServiceClient extends $grpc.Client {
  static final _$connect = $grpc.ClientMethod<$0.ConnectRequest, $0.ConnectResponse>(
      '/game.v1.GameService/Connect',
      ($0.ConnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConnectResponse.fromBuffer(value));
  static final _$disconnect = $grpc.ClientMethod<$0.DisconnectRequest, $0.DisconnectResponse>(
      '/game.v1.GameService/Disconnect',
      ($0.DisconnectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DisconnectResponse.fromBuffer(value));
  static final _$move = $grpc.ClientMethod<$0.MoveRequest, $0.MoveResponse>(
      '/game.v1.GameService/Move',
      ($0.MoveRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MoveResponse.fromBuffer(value));
  static final _$attack = $grpc.ClientMethod<$0.AttackRequest, $0.AttackResponse>(
      '/game.v1.GameService/Attack',
      ($0.AttackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AttackResponse.fromBuffer(value));
  static final _$retreat = $grpc.ClientMethod<$0.RetreatRequest, $0.RetreatResponse>(
      '/game.v1.GameService/Retreat',
      ($0.RetreatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RetreatResponse.fromBuffer(value));
  static final _$getPlayerStatus = $grpc.ClientMethod<$0.GetPlayerStatusRequest, $0.GetPlayerStatusResponse>(
      '/game.v1.GameService/GetPlayerStatus',
      ($0.GetPlayerStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPlayerStatusResponse.fromBuffer(value));
  static final _$getMap = $grpc.ClientMethod<$0.GetMapRequest, $0.GetMapResponse>(
      '/game.v1.GameService/GetMap',
      ($0.GetMapRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMapResponse.fromBuffer(value));
  static final _$subscribe = $grpc.ClientMethod<$0.SubscribeRequest, $0.GameEvent>(
      '/game.v1.GameService/Subscribe',
      ($0.SubscribeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GameEvent.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ConnectResponse> connect($0.ConnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connect, request, options: options);
  }

  $grpc.ResponseFuture<$0.DisconnectResponse> disconnect($0.DisconnectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disconnect, request, options: options);
  }

  $grpc.ResponseFuture<$0.MoveResponse> move($0.MoveRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$move, request, options: options);
  }

  $grpc.ResponseFuture<$0.AttackResponse> attack($0.AttackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$attack, request, options: options);
  }

  $grpc.ResponseFuture<$0.RetreatResponse> retreat($0.RetreatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$retreat, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPlayerStatusResponse> getPlayerStatus($0.GetPlayerStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlayerStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMapResponse> getMap($0.GetMapRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMap, request, options: options);
  }

  $grpc.ResponseStream<$0.GameEvent> subscribe($0.SubscribeRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribe, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('game.v1.GameService')
abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'game.v1.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ConnectRequest, $0.ConnectResponse>(
        'Connect',
        connect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConnectRequest.fromBuffer(value),
        ($0.ConnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DisconnectRequest, $0.DisconnectResponse>(
        'Disconnect',
        disconnect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DisconnectRequest.fromBuffer(value),
        ($0.DisconnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveRequest, $0.MoveResponse>(
        'Move',
        move_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveRequest.fromBuffer(value),
        ($0.MoveResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AttackRequest, $0.AttackResponse>(
        'Attack',
        attack_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AttackRequest.fromBuffer(value),
        ($0.AttackResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetreatRequest, $0.RetreatResponse>(
        'Retreat',
        retreat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RetreatRequest.fromBuffer(value),
        ($0.RetreatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayerStatusRequest, $0.GetPlayerStatusResponse>(
        'GetPlayerStatus',
        getPlayerStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPlayerStatusRequest.fromBuffer(value),
        ($0.GetPlayerStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMapRequest, $0.GetMapResponse>(
        'GetMap',
        getMap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMapRequest.fromBuffer(value),
        ($0.GetMapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubscribeRequest, $0.GameEvent>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeRequest.fromBuffer(value),
        ($0.GameEvent value) => value.writeToBuffer()));
  }

  $async.Future<$0.ConnectResponse> connect_Pre($grpc.ServiceCall call, $async.Future<$0.ConnectRequest> request) async {
    return connect(call, await request);
  }

  $async.Future<$0.DisconnectResponse> disconnect_Pre($grpc.ServiceCall call, $async.Future<$0.DisconnectRequest> request) async {
    return disconnect(call, await request);
  }

  $async.Future<$0.MoveResponse> move_Pre($grpc.ServiceCall call, $async.Future<$0.MoveRequest> request) async {
    return move(call, await request);
  }

  $async.Future<$0.AttackResponse> attack_Pre($grpc.ServiceCall call, $async.Future<$0.AttackRequest> request) async {
    return attack(call, await request);
  }

  $async.Future<$0.RetreatResponse> retreat_Pre($grpc.ServiceCall call, $async.Future<$0.RetreatRequest> request) async {
    return retreat(call, await request);
  }

  $async.Future<$0.GetPlayerStatusResponse> getPlayerStatus_Pre($grpc.ServiceCall call, $async.Future<$0.GetPlayerStatusRequest> request) async {
    return getPlayerStatus(call, await request);
  }

  $async.Future<$0.GetMapResponse> getMap_Pre($grpc.ServiceCall call, $async.Future<$0.GetMapRequest> request) async {
    return getMap(call, await request);
  }

  $async.Stream<$0.GameEvent> subscribe_Pre($grpc.ServiceCall call, $async.Future<$0.SubscribeRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.ConnectResponse> connect($grpc.ServiceCall call, $0.ConnectRequest request);
  $async.Future<$0.DisconnectResponse> disconnect($grpc.ServiceCall call, $0.DisconnectRequest request);
  $async.Future<$0.MoveResponse> move($grpc.ServiceCall call, $0.MoveRequest request);
  $async.Future<$0.AttackResponse> attack($grpc.ServiceCall call, $0.AttackRequest request);
  $async.Future<$0.RetreatResponse> retreat($grpc.ServiceCall call, $0.RetreatRequest request);
  $async.Future<$0.GetPlayerStatusResponse> getPlayerStatus($grpc.ServiceCall call, $0.GetPlayerStatusRequest request);
  $async.Future<$0.GetMapResponse> getMap($grpc.ServiceCall call, $0.GetMapRequest request);
  $async.Stream<$0.GameEvent> subscribe($grpc.ServiceCall call, $0.SubscribeRequest request);
}
