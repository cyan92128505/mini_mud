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

import 'package:protobuf/protobuf.dart' as $pb;

/// Direction represents movement direction.
class Direction extends $pb.ProtobufEnum {
  static const Direction DIRECTION_UNSPECIFIED = Direction._(0, _omitEnumNames ? '' : 'DIRECTION_UNSPECIFIED');
  static const Direction DIRECTION_UP = Direction._(1, _omitEnumNames ? '' : 'DIRECTION_UP');
  static const Direction DIRECTION_DOWN = Direction._(2, _omitEnumNames ? '' : 'DIRECTION_DOWN');
  static const Direction DIRECTION_LEFT = Direction._(3, _omitEnumNames ? '' : 'DIRECTION_LEFT');
  static const Direction DIRECTION_RIGHT = Direction._(4, _omitEnumNames ? '' : 'DIRECTION_RIGHT');

  static const $core.List<Direction> values = <Direction> [
    DIRECTION_UNSPECIFIED,
    DIRECTION_UP,
    DIRECTION_DOWN,
    DIRECTION_LEFT,
    DIRECTION_RIGHT,
  ];

  static final $core.Map<$core.int, Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Direction? valueOf($core.int value) => _byValue[value];

  const Direction._($core.int v, $core.String n) : super(v, n);
}

/// EventType represents the type of game event.
class EventType extends $pb.ProtobufEnum {
  static const EventType EVENT_TYPE_UNSPECIFIED = EventType._(0, _omitEnumNames ? '' : 'EVENT_TYPE_UNSPECIFIED');
  static const EventType EVENT_TYPE_PLAYER_JOINED = EventType._(1, _omitEnumNames ? '' : 'EVENT_TYPE_PLAYER_JOINED');
  static const EventType EVENT_TYPE_PLAYER_LEFT = EventType._(2, _omitEnumNames ? '' : 'EVENT_TYPE_PLAYER_LEFT');
  static const EventType EVENT_TYPE_PLAYER_MOVED = EventType._(3, _omitEnumNames ? '' : 'EVENT_TYPE_PLAYER_MOVED');
  static const EventType EVENT_TYPE_PLAYER_DIED = EventType._(4, _omitEnumNames ? '' : 'EVENT_TYPE_PLAYER_DIED');
  static const EventType EVENT_TYPE_PLAYER_LEVEL_UP = EventType._(5, _omitEnumNames ? '' : 'EVENT_TYPE_PLAYER_LEVEL_UP');
  static const EventType EVENT_TYPE_COMBAT_STARTED = EventType._(10, _omitEnumNames ? '' : 'EVENT_TYPE_COMBAT_STARTED');
  static const EventType EVENT_TYPE_COMBAT_TURN = EventType._(11, _omitEnumNames ? '' : 'EVENT_TYPE_COMBAT_TURN');
  static const EventType EVENT_TYPE_COMBAT_ENDED = EventType._(12, _omitEnumNames ? '' : 'EVENT_TYPE_COMBAT_ENDED');
  static const EventType EVENT_TYPE_MONSTER_MOVED = EventType._(20, _omitEnumNames ? '' : 'EVENT_TYPE_MONSTER_MOVED');
  static const EventType EVENT_TYPE_MONSTER_DIED = EventType._(21, _omitEnumNames ? '' : 'EVENT_TYPE_MONSTER_DIED');
  static const EventType EVENT_TYPE_MONSTER_SPAWNED = EventType._(22, _omitEnumNames ? '' : 'EVENT_TYPE_MONSTER_SPAWNED');

  static const $core.List<EventType> values = <EventType> [
    EVENT_TYPE_UNSPECIFIED,
    EVENT_TYPE_PLAYER_JOINED,
    EVENT_TYPE_PLAYER_LEFT,
    EVENT_TYPE_PLAYER_MOVED,
    EVENT_TYPE_PLAYER_DIED,
    EVENT_TYPE_PLAYER_LEVEL_UP,
    EVENT_TYPE_COMBAT_STARTED,
    EVENT_TYPE_COMBAT_TURN,
    EVENT_TYPE_COMBAT_ENDED,
    EVENT_TYPE_MONSTER_MOVED,
    EVENT_TYPE_MONSTER_DIED,
    EVENT_TYPE_MONSTER_SPAWNED,
  ];

  static final $core.Map<$core.int, EventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EventType? valueOf($core.int value) => _byValue[value];

  const EventType._($core.int v, $core.String n) : super(v, n);
}

/// CombatEndReason represents why combat ended.
class CombatEndReason extends $pb.ProtobufEnum {
  static const CombatEndReason COMBAT_END_REASON_UNSPECIFIED = CombatEndReason._(0, _omitEnumNames ? '' : 'COMBAT_END_REASON_UNSPECIFIED');
  static const CombatEndReason COMBAT_END_REASON_RETREAT = CombatEndReason._(1, _omitEnumNames ? '' : 'COMBAT_END_REASON_RETREAT');
  static const CombatEndReason COMBAT_END_REASON_DEATH = CombatEndReason._(2, _omitEnumNames ? '' : 'COMBAT_END_REASON_DEATH');
  static const CombatEndReason COMBAT_END_REASON_VICTORY = CombatEndReason._(3, _omitEnumNames ? '' : 'COMBAT_END_REASON_VICTORY');

  static const $core.List<CombatEndReason> values = <CombatEndReason> [
    COMBAT_END_REASON_UNSPECIFIED,
    COMBAT_END_REASON_RETREAT,
    COMBAT_END_REASON_DEATH,
    COMBAT_END_REASON_VICTORY,
  ];

  static final $core.Map<$core.int, CombatEndReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CombatEndReason? valueOf($core.int value) => _byValue[value];

  const CombatEndReason._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
