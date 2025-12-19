//
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'game.pbenum.dart';

export 'game.pbenum.dart';

/// Position represents a coordinate on the map.
class Position extends $pb.GeneratedMessage {
  factory Position({
    $core.int? x,
    $core.int? y,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    return $result;
  }
  Position._() : super();
  factory Position.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Position.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Position', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Position clone() => Position()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Position copyWith(void Function(Position) updates) => super.copyWith((message) => updates(message as Position)) as Position;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Position create() => Position._();
  Position createEmptyInstance() => create();
  static $pb.PbList<Position> createRepeated() => $pb.PbList<Position>();
  @$core.pragma('dart2js:noInline')
  static Position getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Position>(create);
  static Position? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

/// ConnectRequest is the request to connect to the game.
class ConnectRequest extends $pb.GeneratedMessage {
  factory ConnectRequest({
    $core.String? playerName,
  }) {
    final $result = create();
    if (playerName != null) {
      $result.playerName = playerName;
    }
    return $result;
  }
  ConnectRequest._() : super();
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);
}

/// ConnectResponse is the response after connecting.
class ConnectResponse extends $pb.GeneratedMessage {
  factory ConnectResponse({
    $core.String? playerId,
    PlayerStatus? status,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ConnectResponse._() : super();
  factory ConnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOM<PlayerStatus>(2, _omitFieldNames ? '' : 'status', subBuilder: PlayerStatus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectResponse clone() => ConnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectResponse copyWith(void Function(ConnectResponse) updates) => super.copyWith((message) => updates(message as ConnectResponse)) as ConnectResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectResponse create() => ConnectResponse._();
  ConnectResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectResponse> createRepeated() => $pb.PbList<ConnectResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectResponse>(create);
  static ConnectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  PlayerStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(PlayerStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
  @$pb.TagNumber(2)
  PlayerStatus ensureStatus() => $_ensure(1);
}

/// DisconnectRequest is the request to disconnect.
class DisconnectRequest extends $pb.GeneratedMessage {
  factory DisconnectRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  DisconnectRequest._() : super();
  factory DisconnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectRequest clone() => DisconnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectRequest copyWith(void Function(DisconnectRequest) updates) => super.copyWith((message) => updates(message as DisconnectRequest)) as DisconnectRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectRequest create() => DisconnectRequest._();
  DisconnectRequest createEmptyInstance() => create();
  static $pb.PbList<DisconnectRequest> createRepeated() => $pb.PbList<DisconnectRequest>();
  @$core.pragma('dart2js:noInline')
  static DisconnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectRequest>(create);
  static DisconnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// DisconnectResponse is the response after disconnecting.
class DisconnectResponse extends $pb.GeneratedMessage {
  factory DisconnectResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DisconnectResponse._() : super();
  factory DisconnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisconnectResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisconnectResponse clone() => DisconnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisconnectResponse copyWith(void Function(DisconnectResponse) updates) => super.copyWith((message) => updates(message as DisconnectResponse)) as DisconnectResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectResponse create() => DisconnectResponse._();
  DisconnectResponse createEmptyInstance() => create();
  static $pb.PbList<DisconnectResponse> createRepeated() => $pb.PbList<DisconnectResponse>();
  @$core.pragma('dart2js:noInline')
  static DisconnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectResponse>(create);
  static DisconnectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

/// MoveRequest is the request to move.
class MoveRequest extends $pb.GeneratedMessage {
  factory MoveRequest({
    $core.String? playerId,
    Direction? direction,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    return $result;
  }
  MoveRequest._() : super();
  factory MoveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..e<Direction>(2, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.DIRECTION_UNSPECIFIED, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveRequest clone() => MoveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveRequest copyWith(void Function(MoveRequest) updates) => super.copyWith((message) => updates(message as MoveRequest)) as MoveRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveRequest create() => MoveRequest._();
  MoveRequest createEmptyInstance() => create();
  static $pb.PbList<MoveRequest> createRepeated() => $pb.PbList<MoveRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveRequest>(create);
  static MoveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  Direction get direction => $_getN(1);
  @$pb.TagNumber(2)
  set direction(Direction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);
}

/// MoveResponse is the response after moving.
class MoveResponse extends $pb.GeneratedMessage {
  factory MoveResponse({
    $core.bool? success,
    Position? newPosition,
    $core.bool? combatStarted,
    $core.String? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (newPosition != null) {
      $result.newPosition = newPosition;
    }
    if (combatStarted != null) {
      $result.combatStarted = combatStarted;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  MoveResponse._() : super();
  factory MoveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<Position>(2, _omitFieldNames ? '' : 'newPosition', subBuilder: Position.create)
    ..aOB(3, _omitFieldNames ? '' : 'combatStarted')
    ..aOS(4, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveResponse clone() => MoveResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveResponse copyWith(void Function(MoveResponse) updates) => super.copyWith((message) => updates(message as MoveResponse)) as MoveResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveResponse create() => MoveResponse._();
  MoveResponse createEmptyInstance() => create();
  static $pb.PbList<MoveResponse> createRepeated() => $pb.PbList<MoveResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveResponse>(create);
  static MoveResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Position get newPosition => $_getN(1);
  @$pb.TagNumber(2)
  set newPosition(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPosition() => clearField(2);
  @$pb.TagNumber(2)
  Position ensureNewPosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get combatStarted => $_getBF(2);
  @$pb.TagNumber(3)
  set combatStarted($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCombatStarted() => $_has(2);
  @$pb.TagNumber(3)
  void clearCombatStarted() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get error => $_getSZ(3);
  @$pb.TagNumber(4)
  set error($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => clearField(4);
}

/// AttackRequest is the request to attack.
class AttackRequest extends $pb.GeneratedMessage {
  factory AttackRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  AttackRequest._() : super();
  factory AttackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttackRequest clone() => AttackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttackRequest copyWith(void Function(AttackRequest) updates) => super.copyWith((message) => updates(message as AttackRequest)) as AttackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttackRequest create() => AttackRequest._();
  AttackRequest createEmptyInstance() => create();
  static $pb.PbList<AttackRequest> createRepeated() => $pb.PbList<AttackRequest>();
  @$core.pragma('dart2js:noInline')
  static AttackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttackRequest>(create);
  static AttackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// AttackResponse is the response after attacking.
class AttackResponse extends $pb.GeneratedMessage {
  factory AttackResponse({
    $core.bool? success,
    CombatResult? result,
    $core.String? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (result != null) {
      $result.result = result;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  AttackResponse._() : super();
  factory AttackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttackResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<CombatResult>(2, _omitFieldNames ? '' : 'result', subBuilder: CombatResult.create)
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttackResponse clone() => AttackResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttackResponse copyWith(void Function(AttackResponse) updates) => super.copyWith((message) => updates(message as AttackResponse)) as AttackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttackResponse create() => AttackResponse._();
  AttackResponse createEmptyInstance() => create();
  static $pb.PbList<AttackResponse> createRepeated() => $pb.PbList<AttackResponse>();
  @$core.pragma('dart2js:noInline')
  static AttackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttackResponse>(create);
  static AttackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  CombatResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(CombatResult v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  CombatResult ensureResult() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

/// RetreatRequest is the request to retreat.
class RetreatRequest extends $pb.GeneratedMessage {
  factory RetreatRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  RetreatRequest._() : super();
  factory RetreatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RetreatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RetreatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RetreatRequest clone() => RetreatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RetreatRequest copyWith(void Function(RetreatRequest) updates) => super.copyWith((message) => updates(message as RetreatRequest)) as RetreatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetreatRequest create() => RetreatRequest._();
  RetreatRequest createEmptyInstance() => create();
  static $pb.PbList<RetreatRequest> createRepeated() => $pb.PbList<RetreatRequest>();
  @$core.pragma('dart2js:noInline')
  static RetreatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RetreatRequest>(create);
  static RetreatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// RetreatResponse is the response after retreating.
class RetreatResponse extends $pb.GeneratedMessage {
  factory RetreatResponse({
    $core.bool? success,
    Position? newPosition,
    $core.String? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (newPosition != null) {
      $result.newPosition = newPosition;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  RetreatResponse._() : super();
  factory RetreatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RetreatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RetreatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<Position>(2, _omitFieldNames ? '' : 'newPosition', subBuilder: Position.create)
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RetreatResponse clone() => RetreatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RetreatResponse copyWith(void Function(RetreatResponse) updates) => super.copyWith((message) => updates(message as RetreatResponse)) as RetreatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetreatResponse create() => RetreatResponse._();
  RetreatResponse createEmptyInstance() => create();
  static $pb.PbList<RetreatResponse> createRepeated() => $pb.PbList<RetreatResponse>();
  @$core.pragma('dart2js:noInline')
  static RetreatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RetreatResponse>(create);
  static RetreatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Position get newPosition => $_getN(1);
  @$pb.TagNumber(2)
  set newPosition(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPosition() => clearField(2);
  @$pb.TagNumber(2)
  Position ensureNewPosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

/// GetPlayerStatusRequest is the request to get player status.
class GetPlayerStatusRequest extends $pb.GeneratedMessage {
  factory GetPlayerStatusRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  GetPlayerStatusRequest._() : super();
  factory GetPlayerStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayerStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPlayerStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayerStatusRequest clone() => GetPlayerStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayerStatusRequest copyWith(void Function(GetPlayerStatusRequest) updates) => super.copyWith((message) => updates(message as GetPlayerStatusRequest)) as GetPlayerStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlayerStatusRequest create() => GetPlayerStatusRequest._();
  GetPlayerStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlayerStatusRequest> createRepeated() => $pb.PbList<GetPlayerStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayerStatusRequest>(create);
  static GetPlayerStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// GetPlayerStatusResponse is the response with player status.
class GetPlayerStatusResponse extends $pb.GeneratedMessage {
  factory GetPlayerStatusResponse({
    PlayerStatus? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  GetPlayerStatusResponse._() : super();
  factory GetPlayerStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlayerStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPlayerStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOM<PlayerStatus>(1, _omitFieldNames ? '' : 'status', subBuilder: PlayerStatus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlayerStatusResponse clone() => GetPlayerStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlayerStatusResponse copyWith(void Function(GetPlayerStatusResponse) updates) => super.copyWith((message) => updates(message as GetPlayerStatusResponse)) as GetPlayerStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlayerStatusResponse create() => GetPlayerStatusResponse._();
  GetPlayerStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetPlayerStatusResponse> createRepeated() => $pb.PbList<GetPlayerStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPlayerStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlayerStatusResponse>(create);
  static GetPlayerStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PlayerStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(PlayerStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  PlayerStatus ensureStatus() => $_ensure(0);
}

/// GetMapRequest is the request to get the map.
class GetMapRequest extends $pb.GeneratedMessage {
  factory GetMapRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  GetMapRequest._() : super();
  factory GetMapRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMapRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMapRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMapRequest clone() => GetMapRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMapRequest copyWith(void Function(GetMapRequest) updates) => super.copyWith((message) => updates(message as GetMapRequest)) as GetMapRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMapRequest create() => GetMapRequest._();
  GetMapRequest createEmptyInstance() => create();
  static $pb.PbList<GetMapRequest> createRepeated() => $pb.PbList<GetMapRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMapRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMapRequest>(create);
  static GetMapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// GetMapResponse is the response with the map state.
class GetMapResponse extends $pb.GeneratedMessage {
  factory GetMapResponse({
    MapState? map,
  }) {
    final $result = create();
    if (map != null) {
      $result.map = map;
    }
    return $result;
  }
  GetMapResponse._() : super();
  factory GetMapResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMapResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMapResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOM<MapState>(1, _omitFieldNames ? '' : 'map', subBuilder: MapState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMapResponse clone() => GetMapResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMapResponse copyWith(void Function(GetMapResponse) updates) => super.copyWith((message) => updates(message as GetMapResponse)) as GetMapResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMapResponse create() => GetMapResponse._();
  GetMapResponse createEmptyInstance() => create();
  static $pb.PbList<GetMapResponse> createRepeated() => $pb.PbList<GetMapResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMapResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMapResponse>(create);
  static GetMapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  MapState get map => $_getN(0);
  @$pb.TagNumber(1)
  set map(MapState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMap() => $_has(0);
  @$pb.TagNumber(1)
  void clearMap() => clearField(1);
  @$pb.TagNumber(1)
  MapState ensureMap() => $_ensure(0);
}

/// SubscribeRequest is the request to subscribe to events.
class SubscribeRequest extends $pb.GeneratedMessage {
  factory SubscribeRequest({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  SubscribeRequest._() : super();
  factory SubscribeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeRequest clone() => SubscribeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeRequest copyWith(void Function(SubscribeRequest) updates) => super.copyWith((message) => updates(message as SubscribeRequest)) as SubscribeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeRequest create() => SubscribeRequest._();
  SubscribeRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeRequest> createRepeated() => $pb.PbList<SubscribeRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeRequest>(create);
  static SubscribeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// PlayerStatus represents a player's current status.
class PlayerStatus extends $pb.GeneratedMessage {
  factory PlayerStatus({
    $core.String? id,
    $core.String? name,
    $core.int? hp,
    $core.int? maxHp,
    $core.int? attack,
    $core.int? defense,
    $core.int? exp,
    $core.int? level,
    Position? position,
    $core.bool? inCombat,
    CombatTarget? combatTarget,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (hp != null) {
      $result.hp = hp;
    }
    if (maxHp != null) {
      $result.maxHp = maxHp;
    }
    if (attack != null) {
      $result.attack = attack;
    }
    if (defense != null) {
      $result.defense = defense;
    }
    if (exp != null) {
      $result.exp = exp;
    }
    if (level != null) {
      $result.level = level;
    }
    if (position != null) {
      $result.position = position;
    }
    if (inCombat != null) {
      $result.inCombat = inCombat;
    }
    if (combatTarget != null) {
      $result.combatTarget = combatTarget;
    }
    return $result;
  }
  PlayerStatus._() : super();
  factory PlayerStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxHp', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'attack', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'defense', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'exp', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'level', $pb.PbFieldType.O3)
    ..aOM<Position>(9, _omitFieldNames ? '' : 'position', subBuilder: Position.create)
    ..aOB(10, _omitFieldNames ? '' : 'inCombat')
    ..aOM<CombatTarget>(11, _omitFieldNames ? '' : 'combatTarget', subBuilder: CombatTarget.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerStatus clone() => PlayerStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerStatus copyWith(void Function(PlayerStatus) updates) => super.copyWith((message) => updates(message as PlayerStatus)) as PlayerStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerStatus create() => PlayerStatus._();
  PlayerStatus createEmptyInstance() => create();
  static $pb.PbList<PlayerStatus> createRepeated() => $pb.PbList<PlayerStatus>();
  @$core.pragma('dart2js:noInline')
  static PlayerStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerStatus>(create);
  static PlayerStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hp => $_getIZ(2);
  @$pb.TagNumber(3)
  set hp($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHp() => $_has(2);
  @$pb.TagNumber(3)
  void clearHp() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxHp => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxHp($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxHp() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxHp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get attack => $_getIZ(4);
  @$pb.TagNumber(5)
  set attack($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAttack() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttack() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get defense => $_getIZ(5);
  @$pb.TagNumber(6)
  set defense($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefense() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefense() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get exp => $_getIZ(6);
  @$pb.TagNumber(7)
  set exp($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExp() => $_has(6);
  @$pb.TagNumber(7)
  void clearExp() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(8)
  set level($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevel() => clearField(8);

  @$pb.TagNumber(9)
  Position get position => $_getN(8);
  @$pb.TagNumber(9)
  set position(Position v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPosition() => $_has(8);
  @$pb.TagNumber(9)
  void clearPosition() => clearField(9);
  @$pb.TagNumber(9)
  Position ensurePosition() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.bool get inCombat => $_getBF(9);
  @$pb.TagNumber(10)
  set inCombat($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasInCombat() => $_has(9);
  @$pb.TagNumber(10)
  void clearInCombat() => clearField(10);

  @$pb.TagNumber(11)
  CombatTarget get combatTarget => $_getN(10);
  @$pb.TagNumber(11)
  set combatTarget(CombatTarget v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCombatTarget() => $_has(10);
  @$pb.TagNumber(11)
  void clearCombatTarget() => clearField(11);
  @$pb.TagNumber(11)
  CombatTarget ensureCombatTarget() => $_ensure(10);
}

/// CombatTarget represents the current combat target.
class CombatTarget extends $pb.GeneratedMessage {
  factory CombatTarget({
    $core.String? id,
    $core.String? name,
    $core.int? hp,
    $core.int? maxHp,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (hp != null) {
      $result.hp = hp;
    }
    if (maxHp != null) {
      $result.maxHp = maxHp;
    }
    return $result;
  }
  CombatTarget._() : super();
  factory CombatTarget.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CombatTarget.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CombatTarget', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxHp', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CombatTarget clone() => CombatTarget()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CombatTarget copyWith(void Function(CombatTarget) updates) => super.copyWith((message) => updates(message as CombatTarget)) as CombatTarget;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CombatTarget create() => CombatTarget._();
  CombatTarget createEmptyInstance() => create();
  static $pb.PbList<CombatTarget> createRepeated() => $pb.PbList<CombatTarget>();
  @$core.pragma('dart2js:noInline')
  static CombatTarget getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CombatTarget>(create);
  static CombatTarget? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hp => $_getIZ(2);
  @$pb.TagNumber(3)
  set hp($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHp() => $_has(2);
  @$pb.TagNumber(3)
  void clearHp() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxHp => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxHp($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxHp() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxHp() => clearField(4);
}

/// CombatResult represents the result of a combat action.
class CombatResult extends $pb.GeneratedMessage {
  factory CombatResult({
    $core.int? turn,
    $core.int? playerDamage,
    $core.int? monsterDamage,
    $core.int? playerHp,
    $core.int? playerMaxHp,
    $core.int? monsterHp,
    $core.int? monsterMaxHp,
    $core.bool? playerDied,
    $core.bool? monsterDied,
    $core.int? expGained,
  }) {
    final $result = create();
    if (turn != null) {
      $result.turn = turn;
    }
    if (playerDamage != null) {
      $result.playerDamage = playerDamage;
    }
    if (monsterDamage != null) {
      $result.monsterDamage = monsterDamage;
    }
    if (playerHp != null) {
      $result.playerHp = playerHp;
    }
    if (playerMaxHp != null) {
      $result.playerMaxHp = playerMaxHp;
    }
    if (monsterHp != null) {
      $result.monsterHp = monsterHp;
    }
    if (monsterMaxHp != null) {
      $result.monsterMaxHp = monsterMaxHp;
    }
    if (playerDied != null) {
      $result.playerDied = playerDied;
    }
    if (monsterDied != null) {
      $result.monsterDied = monsterDied;
    }
    if (expGained != null) {
      $result.expGained = expGained;
    }
    return $result;
  }
  CombatResult._() : super();
  factory CombatResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CombatResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CombatResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'turn', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'playerDamage', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'monsterDamage', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'playerHp', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'playerMaxHp', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'monsterHp', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'monsterMaxHp', $pb.PbFieldType.O3)
    ..aOB(8, _omitFieldNames ? '' : 'playerDied')
    ..aOB(9, _omitFieldNames ? '' : 'monsterDied')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'expGained', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CombatResult clone() => CombatResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CombatResult copyWith(void Function(CombatResult) updates) => super.copyWith((message) => updates(message as CombatResult)) as CombatResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CombatResult create() => CombatResult._();
  CombatResult createEmptyInstance() => create();
  static $pb.PbList<CombatResult> createRepeated() => $pb.PbList<CombatResult>();
  @$core.pragma('dart2js:noInline')
  static CombatResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CombatResult>(create);
  static CombatResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get turn => $_getIZ(0);
  @$pb.TagNumber(1)
  set turn($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTurn() => $_has(0);
  @$pb.TagNumber(1)
  void clearTurn() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get playerDamage => $_getIZ(1);
  @$pb.TagNumber(2)
  set playerDamage($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerDamage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerDamage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get monsterDamage => $_getIZ(2);
  @$pb.TagNumber(3)
  set monsterDamage($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMonsterDamage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMonsterDamage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get playerHp => $_getIZ(3);
  @$pb.TagNumber(4)
  set playerHp($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlayerHp() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayerHp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get playerMaxHp => $_getIZ(4);
  @$pb.TagNumber(5)
  set playerMaxHp($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlayerMaxHp() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerMaxHp() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get monsterHp => $_getIZ(5);
  @$pb.TagNumber(6)
  set monsterHp($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMonsterHp() => $_has(5);
  @$pb.TagNumber(6)
  void clearMonsterHp() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get monsterMaxHp => $_getIZ(6);
  @$pb.TagNumber(7)
  set monsterMaxHp($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMonsterMaxHp() => $_has(6);
  @$pb.TagNumber(7)
  void clearMonsterMaxHp() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get playerDied => $_getBF(7);
  @$pb.TagNumber(8)
  set playerDied($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPlayerDied() => $_has(7);
  @$pb.TagNumber(8)
  void clearPlayerDied() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get monsterDied => $_getBF(8);
  @$pb.TagNumber(9)
  set monsterDied($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMonsterDied() => $_has(8);
  @$pb.TagNumber(9)
  void clearMonsterDied() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get expGained => $_getIZ(9);
  @$pb.TagNumber(10)
  set expGained($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasExpGained() => $_has(9);
  @$pb.TagNumber(10)
  void clearExpGained() => clearField(10);
}

/// MapState represents the current state of the map.
class MapState extends $pb.GeneratedMessage {
  factory MapState({
    $core.Iterable<PlayerInfo>? players,
    MonsterInfo? monster,
  }) {
    final $result = create();
    if (players != null) {
      $result.players.addAll(players);
    }
    if (monster != null) {
      $result.monster = monster;
    }
    return $result;
  }
  MapState._() : super();
  factory MapState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MapState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MapState', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..pc<PlayerInfo>(1, _omitFieldNames ? '' : 'players', $pb.PbFieldType.PM, subBuilder: PlayerInfo.create)
    ..aOM<MonsterInfo>(2, _omitFieldNames ? '' : 'monster', subBuilder: MonsterInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MapState clone() => MapState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MapState copyWith(void Function(MapState) updates) => super.copyWith((message) => updates(message as MapState)) as MapState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MapState create() => MapState._();
  MapState createEmptyInstance() => create();
  static $pb.PbList<MapState> createRepeated() => $pb.PbList<MapState>();
  @$core.pragma('dart2js:noInline')
  static MapState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MapState>(create);
  static MapState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlayerInfo> get players => $_getList(0);

  @$pb.TagNumber(2)
  MonsterInfo get monster => $_getN(1);
  @$pb.TagNumber(2)
  set monster(MonsterInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonster() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonster() => clearField(2);
  @$pb.TagNumber(2)
  MonsterInfo ensureMonster() => $_ensure(1);
}

/// PlayerInfo represents a player on the map.
class PlayerInfo extends $pb.GeneratedMessage {
  factory PlayerInfo({
    $core.String? id,
    $core.String? name,
    Position? position,
    $core.bool? inCombat,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (position != null) {
      $result.position = position;
    }
    if (inCombat != null) {
      $result.inCombat = inCombat;
    }
    return $result;
  }
  PlayerInfo._() : super();
  factory PlayerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<Position>(3, _omitFieldNames ? '' : 'position', subBuilder: Position.create)
    ..aOB(4, _omitFieldNames ? '' : 'inCombat')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerInfo clone() => PlayerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerInfo copyWith(void Function(PlayerInfo) updates) => super.copyWith((message) => updates(message as PlayerInfo)) as PlayerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerInfo create() => PlayerInfo._();
  PlayerInfo createEmptyInstance() => create();
  static $pb.PbList<PlayerInfo> createRepeated() => $pb.PbList<PlayerInfo>();
  @$core.pragma('dart2js:noInline')
  static PlayerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerInfo>(create);
  static PlayerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Position get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(Position v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  Position ensurePosition() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get inCombat => $_getBF(3);
  @$pb.TagNumber(4)
  set inCombat($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInCombat() => $_has(3);
  @$pb.TagNumber(4)
  void clearInCombat() => clearField(4);
}

/// MonsterInfo represents the monster on the map.
class MonsterInfo extends $pb.GeneratedMessage {
  factory MonsterInfo({
    $core.String? id,
    $core.String? name,
    Position? position,
    $core.int? hp,
    $core.int? maxHp,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (position != null) {
      $result.position = position;
    }
    if (hp != null) {
      $result.hp = hp;
    }
    if (maxHp != null) {
      $result.maxHp = maxHp;
    }
    return $result;
  }
  MonsterInfo._() : super();
  factory MonsterInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonsterInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonsterInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<Position>(3, _omitFieldNames ? '' : 'position', subBuilder: Position.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxHp', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonsterInfo clone() => MonsterInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonsterInfo copyWith(void Function(MonsterInfo) updates) => super.copyWith((message) => updates(message as MonsterInfo)) as MonsterInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonsterInfo create() => MonsterInfo._();
  MonsterInfo createEmptyInstance() => create();
  static $pb.PbList<MonsterInfo> createRepeated() => $pb.PbList<MonsterInfo>();
  @$core.pragma('dart2js:noInline')
  static MonsterInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonsterInfo>(create);
  static MonsterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Position get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(Position v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  Position ensurePosition() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get hp => $_getIZ(3);
  @$pb.TagNumber(4)
  set hp($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHp() => $_has(3);
  @$pb.TagNumber(4)
  void clearHp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxHp => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxHp($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxHp() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxHp() => clearField(5);
}

enum GameEvent_Payload {
  playerJoined, 
  playerLeft, 
  playerMoved, 
  playerDied, 
  playerLevelUp, 
  combatStarted, 
  combatTurn, 
  combatEnded, 
  monsterMoved, 
  monsterDied, 
  monsterSpawned, 
  notSet
}

/// GameEvent represents a game event sent to clients.
class GameEvent extends $pb.GeneratedMessage {
  factory GameEvent({
    EventType? type,
    $fixnum.Int64? timestamp,
    PlayerJoinedEvent? playerJoined,
    PlayerLeftEvent? playerLeft,
    PlayerMovedEvent? playerMoved,
    PlayerDiedEvent? playerDied,
    PlayerLevelUpEvent? playerLevelUp,
    CombatStartedEvent? combatStarted,
    CombatTurnEvent? combatTurn,
    CombatEndedEvent? combatEnded,
    MonsterMovedEvent? monsterMoved,
    MonsterDiedEvent? monsterDied,
    MonsterSpawnedEvent? monsterSpawned,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (playerJoined != null) {
      $result.playerJoined = playerJoined;
    }
    if (playerLeft != null) {
      $result.playerLeft = playerLeft;
    }
    if (playerMoved != null) {
      $result.playerMoved = playerMoved;
    }
    if (playerDied != null) {
      $result.playerDied = playerDied;
    }
    if (playerLevelUp != null) {
      $result.playerLevelUp = playerLevelUp;
    }
    if (combatStarted != null) {
      $result.combatStarted = combatStarted;
    }
    if (combatTurn != null) {
      $result.combatTurn = combatTurn;
    }
    if (combatEnded != null) {
      $result.combatEnded = combatEnded;
    }
    if (monsterMoved != null) {
      $result.monsterMoved = monsterMoved;
    }
    if (monsterDied != null) {
      $result.monsterDied = monsterDied;
    }
    if (monsterSpawned != null) {
      $result.monsterSpawned = monsterSpawned;
    }
    return $result;
  }
  GameEvent._() : super();
  factory GameEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GameEvent_Payload> _GameEvent_PayloadByTag = {
    10 : GameEvent_Payload.playerJoined,
    11 : GameEvent_Payload.playerLeft,
    12 : GameEvent_Payload.playerMoved,
    13 : GameEvent_Payload.playerDied,
    14 : GameEvent_Payload.playerLevelUp,
    20 : GameEvent_Payload.combatStarted,
    21 : GameEvent_Payload.combatTurn,
    22 : GameEvent_Payload.combatEnded,
    30 : GameEvent_Payload.monsterMoved,
    31 : GameEvent_Payload.monsterDied,
    32 : GameEvent_Payload.monsterSpawned,
    0 : GameEvent_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GameEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 20, 21, 22, 30, 31, 32])
    ..e<EventType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: EventType.EVENT_TYPE_UNSPECIFIED, valueOf: EventType.valueOf, enumValues: EventType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..aOM<PlayerJoinedEvent>(10, _omitFieldNames ? '' : 'playerJoined', subBuilder: PlayerJoinedEvent.create)
    ..aOM<PlayerLeftEvent>(11, _omitFieldNames ? '' : 'playerLeft', subBuilder: PlayerLeftEvent.create)
    ..aOM<PlayerMovedEvent>(12, _omitFieldNames ? '' : 'playerMoved', subBuilder: PlayerMovedEvent.create)
    ..aOM<PlayerDiedEvent>(13, _omitFieldNames ? '' : 'playerDied', subBuilder: PlayerDiedEvent.create)
    ..aOM<PlayerLevelUpEvent>(14, _omitFieldNames ? '' : 'playerLevelUp', subBuilder: PlayerLevelUpEvent.create)
    ..aOM<CombatStartedEvent>(20, _omitFieldNames ? '' : 'combatStarted', subBuilder: CombatStartedEvent.create)
    ..aOM<CombatTurnEvent>(21, _omitFieldNames ? '' : 'combatTurn', subBuilder: CombatTurnEvent.create)
    ..aOM<CombatEndedEvent>(22, _omitFieldNames ? '' : 'combatEnded', subBuilder: CombatEndedEvent.create)
    ..aOM<MonsterMovedEvent>(30, _omitFieldNames ? '' : 'monsterMoved', subBuilder: MonsterMovedEvent.create)
    ..aOM<MonsterDiedEvent>(31, _omitFieldNames ? '' : 'monsterDied', subBuilder: MonsterDiedEvent.create)
    ..aOM<MonsterSpawnedEvent>(32, _omitFieldNames ? '' : 'monsterSpawned', subBuilder: MonsterSpawnedEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameEvent clone() => GameEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameEvent copyWith(void Function(GameEvent) updates) => super.copyWith((message) => updates(message as GameEvent)) as GameEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameEvent create() => GameEvent._();
  GameEvent createEmptyInstance() => create();
  static $pb.PbList<GameEvent> createRepeated() => $pb.PbList<GameEvent>();
  @$core.pragma('dart2js:noInline')
  static GameEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameEvent>(create);
  static GameEvent? _defaultInstance;

  GameEvent_Payload whichPayload() => _GameEvent_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  EventType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(EventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(10)
  PlayerJoinedEvent get playerJoined => $_getN(2);
  @$pb.TagNumber(10)
  set playerJoined(PlayerJoinedEvent v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasPlayerJoined() => $_has(2);
  @$pb.TagNumber(10)
  void clearPlayerJoined() => clearField(10);
  @$pb.TagNumber(10)
  PlayerJoinedEvent ensurePlayerJoined() => $_ensure(2);

  @$pb.TagNumber(11)
  PlayerLeftEvent get playerLeft => $_getN(3);
  @$pb.TagNumber(11)
  set playerLeft(PlayerLeftEvent v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPlayerLeft() => $_has(3);
  @$pb.TagNumber(11)
  void clearPlayerLeft() => clearField(11);
  @$pb.TagNumber(11)
  PlayerLeftEvent ensurePlayerLeft() => $_ensure(3);

  @$pb.TagNumber(12)
  PlayerMovedEvent get playerMoved => $_getN(4);
  @$pb.TagNumber(12)
  set playerMoved(PlayerMovedEvent v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasPlayerMoved() => $_has(4);
  @$pb.TagNumber(12)
  void clearPlayerMoved() => clearField(12);
  @$pb.TagNumber(12)
  PlayerMovedEvent ensurePlayerMoved() => $_ensure(4);

  @$pb.TagNumber(13)
  PlayerDiedEvent get playerDied => $_getN(5);
  @$pb.TagNumber(13)
  set playerDied(PlayerDiedEvent v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasPlayerDied() => $_has(5);
  @$pb.TagNumber(13)
  void clearPlayerDied() => clearField(13);
  @$pb.TagNumber(13)
  PlayerDiedEvent ensurePlayerDied() => $_ensure(5);

  @$pb.TagNumber(14)
  PlayerLevelUpEvent get playerLevelUp => $_getN(6);
  @$pb.TagNumber(14)
  set playerLevelUp(PlayerLevelUpEvent v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasPlayerLevelUp() => $_has(6);
  @$pb.TagNumber(14)
  void clearPlayerLevelUp() => clearField(14);
  @$pb.TagNumber(14)
  PlayerLevelUpEvent ensurePlayerLevelUp() => $_ensure(6);

  @$pb.TagNumber(20)
  CombatStartedEvent get combatStarted => $_getN(7);
  @$pb.TagNumber(20)
  set combatStarted(CombatStartedEvent v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasCombatStarted() => $_has(7);
  @$pb.TagNumber(20)
  void clearCombatStarted() => clearField(20);
  @$pb.TagNumber(20)
  CombatStartedEvent ensureCombatStarted() => $_ensure(7);

  @$pb.TagNumber(21)
  CombatTurnEvent get combatTurn => $_getN(8);
  @$pb.TagNumber(21)
  set combatTurn(CombatTurnEvent v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasCombatTurn() => $_has(8);
  @$pb.TagNumber(21)
  void clearCombatTurn() => clearField(21);
  @$pb.TagNumber(21)
  CombatTurnEvent ensureCombatTurn() => $_ensure(8);

  @$pb.TagNumber(22)
  CombatEndedEvent get combatEnded => $_getN(9);
  @$pb.TagNumber(22)
  set combatEnded(CombatEndedEvent v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasCombatEnded() => $_has(9);
  @$pb.TagNumber(22)
  void clearCombatEnded() => clearField(22);
  @$pb.TagNumber(22)
  CombatEndedEvent ensureCombatEnded() => $_ensure(9);

  @$pb.TagNumber(30)
  MonsterMovedEvent get monsterMoved => $_getN(10);
  @$pb.TagNumber(30)
  set monsterMoved(MonsterMovedEvent v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasMonsterMoved() => $_has(10);
  @$pb.TagNumber(30)
  void clearMonsterMoved() => clearField(30);
  @$pb.TagNumber(30)
  MonsterMovedEvent ensureMonsterMoved() => $_ensure(10);

  @$pb.TagNumber(31)
  MonsterDiedEvent get monsterDied => $_getN(11);
  @$pb.TagNumber(31)
  set monsterDied(MonsterDiedEvent v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasMonsterDied() => $_has(11);
  @$pb.TagNumber(31)
  void clearMonsterDied() => clearField(31);
  @$pb.TagNumber(31)
  MonsterDiedEvent ensureMonsterDied() => $_ensure(11);

  @$pb.TagNumber(32)
  MonsterSpawnedEvent get monsterSpawned => $_getN(12);
  @$pb.TagNumber(32)
  set monsterSpawned(MonsterSpawnedEvent v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasMonsterSpawned() => $_has(12);
  @$pb.TagNumber(32)
  void clearMonsterSpawned() => clearField(32);
  @$pb.TagNumber(32)
  MonsterSpawnedEvent ensureMonsterSpawned() => $_ensure(12);
}

/// PlayerJoinedEvent is emitted when a player joins.
class PlayerJoinedEvent extends $pb.GeneratedMessage {
  factory PlayerJoinedEvent({
    $core.String? playerId,
    $core.String? playerName,
    Position? position,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (playerName != null) {
      $result.playerName = playerName;
    }
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  PlayerJoinedEvent._() : super();
  factory PlayerJoinedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerJoinedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerJoinedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOS(2, _omitFieldNames ? '' : 'playerName')
    ..aOM<Position>(3, _omitFieldNames ? '' : 'position', subBuilder: Position.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerJoinedEvent clone() => PlayerJoinedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerJoinedEvent copyWith(void Function(PlayerJoinedEvent) updates) => super.copyWith((message) => updates(message as PlayerJoinedEvent)) as PlayerJoinedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerJoinedEvent create() => PlayerJoinedEvent._();
  PlayerJoinedEvent createEmptyInstance() => create();
  static $pb.PbList<PlayerJoinedEvent> createRepeated() => $pb.PbList<PlayerJoinedEvent>();
  @$core.pragma('dart2js:noInline')
  static PlayerJoinedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerJoinedEvent>(create);
  static PlayerJoinedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playerName => $_getSZ(1);
  @$pb.TagNumber(2)
  set playerName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerName() => clearField(2);

  @$pb.TagNumber(3)
  Position get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(Position v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  Position ensurePosition() => $_ensure(2);
}

/// PlayerLeftEvent is emitted when a player leaves.
class PlayerLeftEvent extends $pb.GeneratedMessage {
  factory PlayerLeftEvent({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  PlayerLeftEvent._() : super();
  factory PlayerLeftEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerLeftEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerLeftEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerLeftEvent clone() => PlayerLeftEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerLeftEvent copyWith(void Function(PlayerLeftEvent) updates) => super.copyWith((message) => updates(message as PlayerLeftEvent)) as PlayerLeftEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerLeftEvent create() => PlayerLeftEvent._();
  PlayerLeftEvent createEmptyInstance() => create();
  static $pb.PbList<PlayerLeftEvent> createRepeated() => $pb.PbList<PlayerLeftEvent>();
  @$core.pragma('dart2js:noInline')
  static PlayerLeftEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerLeftEvent>(create);
  static PlayerLeftEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// PlayerMovedEvent is emitted when a player moves.
class PlayerMovedEvent extends $pb.GeneratedMessage {
  factory PlayerMovedEvent({
    $core.String? playerId,
    Position? from,
    Position? to,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  PlayerMovedEvent._() : super();
  factory PlayerMovedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerMovedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerMovedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOM<Position>(2, _omitFieldNames ? '' : 'from', subBuilder: Position.create)
    ..aOM<Position>(3, _omitFieldNames ? '' : 'to', subBuilder: Position.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerMovedEvent clone() => PlayerMovedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerMovedEvent copyWith(void Function(PlayerMovedEvent) updates) => super.copyWith((message) => updates(message as PlayerMovedEvent)) as PlayerMovedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerMovedEvent create() => PlayerMovedEvent._();
  PlayerMovedEvent createEmptyInstance() => create();
  static $pb.PbList<PlayerMovedEvent> createRepeated() => $pb.PbList<PlayerMovedEvent>();
  @$core.pragma('dart2js:noInline')
  static PlayerMovedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerMovedEvent>(create);
  static PlayerMovedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  Position get from => $_getN(1);
  @$pb.TagNumber(2)
  set from(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  Position ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  Position get to => $_getN(2);
  @$pb.TagNumber(3)
  set to(Position v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  Position ensureTo() => $_ensure(2);
}

/// PlayerDiedEvent is emitted when a player dies.
class PlayerDiedEvent extends $pb.GeneratedMessage {
  factory PlayerDiedEvent({
    $core.String? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  PlayerDiedEvent._() : super();
  factory PlayerDiedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerDiedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerDiedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerDiedEvent clone() => PlayerDiedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerDiedEvent copyWith(void Function(PlayerDiedEvent) updates) => super.copyWith((message) => updates(message as PlayerDiedEvent)) as PlayerDiedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerDiedEvent create() => PlayerDiedEvent._();
  PlayerDiedEvent createEmptyInstance() => create();
  static $pb.PbList<PlayerDiedEvent> createRepeated() => $pb.PbList<PlayerDiedEvent>();
  @$core.pragma('dart2js:noInline')
  static PlayerDiedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerDiedEvent>(create);
  static PlayerDiedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

/// PlayerLevelUpEvent is emitted when a player levels up.
class PlayerLevelUpEvent extends $pb.GeneratedMessage {
  factory PlayerLevelUpEvent({
    $core.String? playerId,
    $core.int? newLevel,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (newLevel != null) {
      $result.newLevel = newLevel;
    }
    return $result;
  }
  PlayerLevelUpEvent._() : super();
  factory PlayerLevelUpEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerLevelUpEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerLevelUpEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'newLevel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerLevelUpEvent clone() => PlayerLevelUpEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerLevelUpEvent copyWith(void Function(PlayerLevelUpEvent) updates) => super.copyWith((message) => updates(message as PlayerLevelUpEvent)) as PlayerLevelUpEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerLevelUpEvent create() => PlayerLevelUpEvent._();
  PlayerLevelUpEvent createEmptyInstance() => create();
  static $pb.PbList<PlayerLevelUpEvent> createRepeated() => $pb.PbList<PlayerLevelUpEvent>();
  @$core.pragma('dart2js:noInline')
  static PlayerLevelUpEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerLevelUpEvent>(create);
  static PlayerLevelUpEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get newLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set newLevel($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewLevel() => clearField(2);
}

/// CombatStartedEvent is emitted when combat starts.
class CombatStartedEvent extends $pb.GeneratedMessage {
  factory CombatStartedEvent({
    $core.String? playerId,
    $core.String? monsterId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    return $result;
  }
  CombatStartedEvent._() : super();
  factory CombatStartedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CombatStartedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CombatStartedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOS(2, _omitFieldNames ? '' : 'monsterId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CombatStartedEvent clone() => CombatStartedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CombatStartedEvent copyWith(void Function(CombatStartedEvent) updates) => super.copyWith((message) => updates(message as CombatStartedEvent)) as CombatStartedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CombatStartedEvent create() => CombatStartedEvent._();
  CombatStartedEvent createEmptyInstance() => create();
  static $pb.PbList<CombatStartedEvent> createRepeated() => $pb.PbList<CombatStartedEvent>();
  @$core.pragma('dart2js:noInline')
  static CombatStartedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CombatStartedEvent>(create);
  static CombatStartedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get monsterId => $_getSZ(1);
  @$pb.TagNumber(2)
  set monsterId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonsterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonsterId() => clearField(2);
}

/// CombatTurnEvent is emitted after a combat turn.
class CombatTurnEvent extends $pb.GeneratedMessage {
  factory CombatTurnEvent({
    $core.String? playerId,
    $core.String? monsterId,
    $core.int? playerDamage,
    $core.int? monsterDamage,
    $core.int? playerHp,
    $core.int? playerMaxHp,
    $core.int? monsterHp,
    $core.int? monsterMaxHp,
    $core.int? turn,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    if (playerDamage != null) {
      $result.playerDamage = playerDamage;
    }
    if (monsterDamage != null) {
      $result.monsterDamage = monsterDamage;
    }
    if (playerHp != null) {
      $result.playerHp = playerHp;
    }
    if (playerMaxHp != null) {
      $result.playerMaxHp = playerMaxHp;
    }
    if (monsterHp != null) {
      $result.monsterHp = monsterHp;
    }
    if (monsterMaxHp != null) {
      $result.monsterMaxHp = monsterMaxHp;
    }
    if (turn != null) {
      $result.turn = turn;
    }
    return $result;
  }
  CombatTurnEvent._() : super();
  factory CombatTurnEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CombatTurnEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CombatTurnEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOS(2, _omitFieldNames ? '' : 'monsterId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'playerDamage', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'monsterDamage', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'playerHp', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'playerMaxHp', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'monsterHp', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'monsterMaxHp', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'turn', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CombatTurnEvent clone() => CombatTurnEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CombatTurnEvent copyWith(void Function(CombatTurnEvent) updates) => super.copyWith((message) => updates(message as CombatTurnEvent)) as CombatTurnEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CombatTurnEvent create() => CombatTurnEvent._();
  CombatTurnEvent createEmptyInstance() => create();
  static $pb.PbList<CombatTurnEvent> createRepeated() => $pb.PbList<CombatTurnEvent>();
  @$core.pragma('dart2js:noInline')
  static CombatTurnEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CombatTurnEvent>(create);
  static CombatTurnEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get monsterId => $_getSZ(1);
  @$pb.TagNumber(2)
  set monsterId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonsterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonsterId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get playerDamage => $_getIZ(2);
  @$pb.TagNumber(3)
  set playerDamage($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerDamage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerDamage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get monsterDamage => $_getIZ(3);
  @$pb.TagNumber(4)
  set monsterDamage($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMonsterDamage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMonsterDamage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get playerHp => $_getIZ(4);
  @$pb.TagNumber(5)
  set playerHp($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlayerHp() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerHp() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get playerMaxHp => $_getIZ(5);
  @$pb.TagNumber(6)
  set playerMaxHp($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlayerMaxHp() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayerMaxHp() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get monsterHp => $_getIZ(6);
  @$pb.TagNumber(7)
  set monsterHp($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMonsterHp() => $_has(6);
  @$pb.TagNumber(7)
  void clearMonsterHp() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get monsterMaxHp => $_getIZ(7);
  @$pb.TagNumber(8)
  set monsterMaxHp($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMonsterMaxHp() => $_has(7);
  @$pb.TagNumber(8)
  void clearMonsterMaxHp() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get turn => $_getIZ(8);
  @$pb.TagNumber(9)
  set turn($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTurn() => $_has(8);
  @$pb.TagNumber(9)
  void clearTurn() => clearField(9);
}

/// CombatEndedEvent is emitted when combat ends.
class CombatEndedEvent extends $pb.GeneratedMessage {
  factory CombatEndedEvent({
    $core.String? playerId,
    $core.String? monsterId,
    CombatEndReason? reason,
    $core.int? expGained,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (expGained != null) {
      $result.expGained = expGained;
    }
    return $result;
  }
  CombatEndedEvent._() : super();
  factory CombatEndedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CombatEndedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CombatEndedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerId')
    ..aOS(2, _omitFieldNames ? '' : 'monsterId')
    ..e<CombatEndReason>(3, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE, defaultOrMaker: CombatEndReason.COMBAT_END_REASON_UNSPECIFIED, valueOf: CombatEndReason.valueOf, enumValues: CombatEndReason.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expGained', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CombatEndedEvent clone() => CombatEndedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CombatEndedEvent copyWith(void Function(CombatEndedEvent) updates) => super.copyWith((message) => updates(message as CombatEndedEvent)) as CombatEndedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CombatEndedEvent create() => CombatEndedEvent._();
  CombatEndedEvent createEmptyInstance() => create();
  static $pb.PbList<CombatEndedEvent> createRepeated() => $pb.PbList<CombatEndedEvent>();
  @$core.pragma('dart2js:noInline')
  static CombatEndedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CombatEndedEvent>(create);
  static CombatEndedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get monsterId => $_getSZ(1);
  @$pb.TagNumber(2)
  set monsterId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonsterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonsterId() => clearField(2);

  @$pb.TagNumber(3)
  CombatEndReason get reason => $_getN(2);
  @$pb.TagNumber(3)
  set reason(CombatEndReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get expGained => $_getIZ(3);
  @$pb.TagNumber(4)
  set expGained($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpGained() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpGained() => clearField(4);
}

/// MonsterMovedEvent is emitted when the monster moves.
class MonsterMovedEvent extends $pb.GeneratedMessage {
  factory MonsterMovedEvent({
    $core.String? monsterId,
    Position? from,
    Position? to,
  }) {
    final $result = create();
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  MonsterMovedEvent._() : super();
  factory MonsterMovedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonsterMovedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonsterMovedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'monsterId')
    ..aOM<Position>(2, _omitFieldNames ? '' : 'from', subBuilder: Position.create)
    ..aOM<Position>(3, _omitFieldNames ? '' : 'to', subBuilder: Position.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonsterMovedEvent clone() => MonsterMovedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonsterMovedEvent copyWith(void Function(MonsterMovedEvent) updates) => super.copyWith((message) => updates(message as MonsterMovedEvent)) as MonsterMovedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonsterMovedEvent create() => MonsterMovedEvent._();
  MonsterMovedEvent createEmptyInstance() => create();
  static $pb.PbList<MonsterMovedEvent> createRepeated() => $pb.PbList<MonsterMovedEvent>();
  @$core.pragma('dart2js:noInline')
  static MonsterMovedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonsterMovedEvent>(create);
  static MonsterMovedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get monsterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set monsterId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonsterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonsterId() => clearField(1);

  @$pb.TagNumber(2)
  Position get from => $_getN(1);
  @$pb.TagNumber(2)
  set from(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  Position ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  Position get to => $_getN(2);
  @$pb.TagNumber(3)
  set to(Position v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  Position ensureTo() => $_ensure(2);
}

/// MonsterDiedEvent is emitted when the monster dies.
class MonsterDiedEvent extends $pb.GeneratedMessage {
  factory MonsterDiedEvent({
    $core.String? monsterId,
    $core.String? killerId,
    $core.Iterable<$core.String>? contributors,
  }) {
    final $result = create();
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    if (killerId != null) {
      $result.killerId = killerId;
    }
    if (contributors != null) {
      $result.contributors.addAll(contributors);
    }
    return $result;
  }
  MonsterDiedEvent._() : super();
  factory MonsterDiedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonsterDiedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonsterDiedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'monsterId')
    ..aOS(2, _omitFieldNames ? '' : 'killerId')
    ..pPS(3, _omitFieldNames ? '' : 'contributors')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonsterDiedEvent clone() => MonsterDiedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonsterDiedEvent copyWith(void Function(MonsterDiedEvent) updates) => super.copyWith((message) => updates(message as MonsterDiedEvent)) as MonsterDiedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonsterDiedEvent create() => MonsterDiedEvent._();
  MonsterDiedEvent createEmptyInstance() => create();
  static $pb.PbList<MonsterDiedEvent> createRepeated() => $pb.PbList<MonsterDiedEvent>();
  @$core.pragma('dart2js:noInline')
  static MonsterDiedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonsterDiedEvent>(create);
  static MonsterDiedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get monsterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set monsterId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonsterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonsterId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get killerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set killerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKillerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKillerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get contributors => $_getList(2);
}

/// MonsterSpawnedEvent is emitted when the monster spawns.
class MonsterSpawnedEvent extends $pb.GeneratedMessage {
  factory MonsterSpawnedEvent({
    $core.String? monsterId,
    Position? position,
  }) {
    final $result = create();
    if (monsterId != null) {
      $result.monsterId = monsterId;
    }
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  MonsterSpawnedEvent._() : super();
  factory MonsterSpawnedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonsterSpawnedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonsterSpawnedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'game.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'monsterId')
    ..aOM<Position>(2, _omitFieldNames ? '' : 'position', subBuilder: Position.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonsterSpawnedEvent clone() => MonsterSpawnedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonsterSpawnedEvent copyWith(void Function(MonsterSpawnedEvent) updates) => super.copyWith((message) => updates(message as MonsterSpawnedEvent)) as MonsterSpawnedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonsterSpawnedEvent create() => MonsterSpawnedEvent._();
  MonsterSpawnedEvent createEmptyInstance() => create();
  static $pb.PbList<MonsterSpawnedEvent> createRepeated() => $pb.PbList<MonsterSpawnedEvent>();
  @$core.pragma('dart2js:noInline')
  static MonsterSpawnedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonsterSpawnedEvent>(create);
  static MonsterSpawnedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get monsterId => $_getSZ(0);
  @$pb.TagNumber(1)
  set monsterId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonsterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonsterId() => clearField(1);

  @$pb.TagNumber(2)
  Position get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  Position ensurePosition() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
