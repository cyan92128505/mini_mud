//
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use directionDescriptor instead')
const Direction$json = {
  '1': 'Direction',
  '2': [
    {'1': 'DIRECTION_UNSPECIFIED', '2': 0},
    {'1': 'DIRECTION_UP', '2': 1},
    {'1': 'DIRECTION_DOWN', '2': 2},
    {'1': 'DIRECTION_LEFT', '2': 3},
    {'1': 'DIRECTION_RIGHT', '2': 4},
  ],
};

/// Descriptor for `Direction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List directionDescriptor = $convert.base64Decode(
    'CglEaXJlY3Rpb24SGQoVRElSRUNUSU9OX1VOU1BFQ0lGSUVEEAASEAoMRElSRUNUSU9OX1VQEA'
    'ESEgoORElSRUNUSU9OX0RPV04QAhISCg5ESVJFQ1RJT05fTEVGVBADEhMKD0RJUkVDVElPTl9S'
    'SUdIVBAE');

@$core.Deprecated('Use eventTypeDescriptor instead')
const EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'EVENT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'EVENT_TYPE_PLAYER_JOINED', '2': 1},
    {'1': 'EVENT_TYPE_PLAYER_LEFT', '2': 2},
    {'1': 'EVENT_TYPE_PLAYER_MOVED', '2': 3},
    {'1': 'EVENT_TYPE_PLAYER_DIED', '2': 4},
    {'1': 'EVENT_TYPE_PLAYER_LEVEL_UP', '2': 5},
    {'1': 'EVENT_TYPE_COMBAT_STARTED', '2': 10},
    {'1': 'EVENT_TYPE_COMBAT_TURN', '2': 11},
    {'1': 'EVENT_TYPE_COMBAT_ENDED', '2': 12},
    {'1': 'EVENT_TYPE_MONSTER_MOVED', '2': 20},
    {'1': 'EVENT_TYPE_MONSTER_DIED', '2': 21},
    {'1': 'EVENT_TYPE_MONSTER_SPAWNED', '2': 22},
  ],
};

/// Descriptor for `EventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventTypeDescriptor = $convert.base64Decode(
    'CglFdmVudFR5cGUSGgoWRVZFTlRfVFlQRV9VTlNQRUNJRklFRBAAEhwKGEVWRU5UX1RZUEVfUE'
    'xBWUVSX0pPSU5FRBABEhoKFkVWRU5UX1RZUEVfUExBWUVSX0xFRlQQAhIbChdFVkVOVF9UWVBF'
    'X1BMQVlFUl9NT1ZFRBADEhoKFkVWRU5UX1RZUEVfUExBWUVSX0RJRUQQBBIeChpFVkVOVF9UWV'
    'BFX1BMQVlFUl9MRVZFTF9VUBAFEh0KGUVWRU5UX1RZUEVfQ09NQkFUX1NUQVJURUQQChIaChZF'
    'VkVOVF9UWVBFX0NPTUJBVF9UVVJOEAsSGwoXRVZFTlRfVFlQRV9DT01CQVRfRU5ERUQQDBIcCh'
    'hFVkVOVF9UWVBFX01PTlNURVJfTU9WRUQQFBIbChdFVkVOVF9UWVBFX01PTlNURVJfRElFRBAV'
    'Eh4KGkVWRU5UX1RZUEVfTU9OU1RFUl9TUEFXTkVEEBY=');

@$core.Deprecated('Use combatEndReasonDescriptor instead')
const CombatEndReason$json = {
  '1': 'CombatEndReason',
  '2': [
    {'1': 'COMBAT_END_REASON_UNSPECIFIED', '2': 0},
    {'1': 'COMBAT_END_REASON_RETREAT', '2': 1},
    {'1': 'COMBAT_END_REASON_DEATH', '2': 2},
    {'1': 'COMBAT_END_REASON_VICTORY', '2': 3},
  ],
};

/// Descriptor for `CombatEndReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List combatEndReasonDescriptor = $convert.base64Decode(
    'Cg9Db21iYXRFbmRSZWFzb24SIQodQ09NQkFUX0VORF9SRUFTT05fVU5TUEVDSUZJRUQQABIdCh'
    'lDT01CQVRfRU5EX1JFQVNPTl9SRVRSRUFUEAESGwoXQ09NQkFUX0VORF9SRUFTT05fREVBVEgQ'
    'AhIdChlDT01CQVRfRU5EX1JFQVNPTl9WSUNUT1JZEAM=');

@$core.Deprecated('Use positionDescriptor instead')
const Position$json = {
  '1': 'Position',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

/// Descriptor for `Position`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionDescriptor = $convert.base64Decode(
    'CghQb3NpdGlvbhIMCgF4GAEgASgFUgF4EgwKAXkYAiABKAVSAXk=');

@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = {
  '1': 'ConnectRequest',
  '2': [
    {'1': 'player_name', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
  ],
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode(
    'Cg5Db25uZWN0UmVxdWVzdBIfCgtwbGF5ZXJfbmFtZRgBIAEoCVIKcGxheWVyTmFtZQ==');

@$core.Deprecated('Use connectResponseDescriptor instead')
const ConnectResponse$json = {
  '1': 'ConnectResponse',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'status', '3': 2, '4': 1, '5': 11, '6': '.game.v1.PlayerStatus', '10': 'status'},
  ],
};

/// Descriptor for `ConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectResponseDescriptor = $convert.base64Decode(
    'Cg9Db25uZWN0UmVzcG9uc2USGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBItCgZzdGF0dX'
    'MYAiABKAsyFS5nYW1lLnYxLlBsYXllclN0YXR1c1IGc3RhdHVz');

@$core.Deprecated('Use disconnectRequestDescriptor instead')
const DisconnectRequest$json = {
  '1': 'DisconnectRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `DisconnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectRequestDescriptor = $convert.base64Decode(
    'ChFEaXNjb25uZWN0UmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklk');

@$core.Deprecated('Use disconnectResponseDescriptor instead')
const DisconnectResponse$json = {
  '1': 'DisconnectResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DisconnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectResponseDescriptor = $convert.base64Decode(
    'ChJEaXNjb25uZWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use moveRequestDescriptor instead')
const MoveRequest$json = {
  '1': 'MoveRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'direction', '3': 2, '4': 1, '5': 14, '6': '.game.v1.Direction', '10': 'direction'},
  ],
};

/// Descriptor for `MoveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveRequestDescriptor = $convert.base64Decode(
    'CgtNb3ZlUmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklkEjAKCWRpcmVjdGlvbh'
    'gCIAEoDjISLmdhbWUudjEuRGlyZWN0aW9uUglkaXJlY3Rpb24=');

@$core.Deprecated('Use moveResponseDescriptor instead')
const MoveResponse$json = {
  '1': 'MoveResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'new_position', '3': 2, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'newPosition'},
    {'1': 'combat_started', '3': 3, '4': 1, '5': 8, '10': 'combatStarted'},
    {'1': 'error', '3': 4, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `MoveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveResponseDescriptor = $convert.base64Decode(
    'CgxNb3ZlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxI0CgxuZXdfcG9zaXRpb2'
    '4YAiABKAsyES5nYW1lLnYxLlBvc2l0aW9uUgtuZXdQb3NpdGlvbhIlCg5jb21iYXRfc3RhcnRl'
    'ZBgDIAEoCFINY29tYmF0U3RhcnRlZBIUCgVlcnJvchgEIAEoCVIFZXJyb3I=');

@$core.Deprecated('Use attackRequestDescriptor instead')
const AttackRequest$json = {
  '1': 'AttackRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `AttackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attackRequestDescriptor = $convert.base64Decode(
    'Cg1BdHRhY2tSZXF1ZXN0EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQ=');

@$core.Deprecated('Use attackResponseDescriptor instead')
const AttackResponse$json = {
  '1': 'AttackResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.game.v1.CombatResult', '10': 'result'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `AttackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attackResponseDescriptor = $convert.base64Decode(
    'Cg5BdHRhY2tSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEi0KBnJlc3VsdBgCIA'
    'EoCzIVLmdhbWUudjEuQ29tYmF0UmVzdWx0UgZyZXN1bHQSFAoFZXJyb3IYAyABKAlSBWVycm9y');

@$core.Deprecated('Use retreatRequestDescriptor instead')
const RetreatRequest$json = {
  '1': 'RetreatRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `RetreatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retreatRequestDescriptor = $convert.base64Decode(
    'Cg5SZXRyZWF0UmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklk');

@$core.Deprecated('Use retreatResponseDescriptor instead')
const RetreatResponse$json = {
  '1': 'RetreatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'new_position', '3': 2, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'newPosition'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `RetreatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retreatResponseDescriptor = $convert.base64Decode(
    'Cg9SZXRyZWF0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxI0CgxuZXdfcG9zaX'
    'Rpb24YAiABKAsyES5nYW1lLnYxLlBvc2l0aW9uUgtuZXdQb3NpdGlvbhIUCgVlcnJvchgDIAEo'
    'CVIFZXJyb3I=');

@$core.Deprecated('Use getPlayerStatusRequestDescriptor instead')
const GetPlayerStatusRequest$json = {
  '1': 'GetPlayerStatusRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `GetPlayerStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerStatusRequestDescriptor = $convert.base64Decode(
    'ChZHZXRQbGF5ZXJTdGF0dXNSZXF1ZXN0EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQ=');

@$core.Deprecated('Use getPlayerStatusResponseDescriptor instead')
const GetPlayerStatusResponse$json = {
  '1': 'GetPlayerStatusResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.game.v1.PlayerStatus', '10': 'status'},
  ],
};

/// Descriptor for `GetPlayerStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayerStatusResponseDescriptor = $convert.base64Decode(
    'ChdHZXRQbGF5ZXJTdGF0dXNSZXNwb25zZRItCgZzdGF0dXMYASABKAsyFS5nYW1lLnYxLlBsYX'
    'llclN0YXR1c1IGc3RhdHVz');

@$core.Deprecated('Use getMapRequestDescriptor instead')
const GetMapRequest$json = {
  '1': 'GetMapRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `GetMapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMapRequestDescriptor = $convert.base64Decode(
    'Cg1HZXRNYXBSZXF1ZXN0EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQ=');

@$core.Deprecated('Use getMapResponseDescriptor instead')
const GetMapResponse$json = {
  '1': 'GetMapResponse',
  '2': [
    {'1': 'map', '3': 1, '4': 1, '5': 11, '6': '.game.v1.MapState', '10': 'map'},
  ],
};

/// Descriptor for `GetMapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMapResponseDescriptor = $convert.base64Decode(
    'Cg5HZXRNYXBSZXNwb25zZRIjCgNtYXAYASABKAsyES5nYW1lLnYxLk1hcFN0YXRlUgNtYXA=');

@$core.Deprecated('Use subscribeRequestDescriptor instead')
const SubscribeRequest$json = {
  '1': 'SubscribeRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `SubscribeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeRequestDescriptor = $convert.base64Decode(
    'ChBTdWJzY3JpYmVSZXF1ZXN0EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQ=');

@$core.Deprecated('Use playerStatusDescriptor instead')
const PlayerStatus$json = {
  '1': 'PlayerStatus',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'hp', '3': 3, '4': 1, '5': 5, '10': 'hp'},
    {'1': 'max_hp', '3': 4, '4': 1, '5': 5, '10': 'maxHp'},
    {'1': 'attack', '3': 5, '4': 1, '5': 5, '10': 'attack'},
    {'1': 'defense', '3': 6, '4': 1, '5': 5, '10': 'defense'},
    {'1': 'exp', '3': 7, '4': 1, '5': 5, '10': 'exp'},
    {'1': 'level', '3': 8, '4': 1, '5': 5, '10': 'level'},
    {'1': 'position', '3': 9, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'position'},
    {'1': 'in_combat', '3': 10, '4': 1, '5': 8, '10': 'inCombat'},
    {'1': 'combat_target', '3': 11, '4': 1, '5': 11, '6': '.game.v1.CombatTarget', '10': 'combatTarget'},
  ],
};

/// Descriptor for `PlayerStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerStatusDescriptor = $convert.base64Decode(
    'CgxQbGF5ZXJTdGF0dXMSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSDgoCaH'
    'AYAyABKAVSAmhwEhUKBm1heF9ocBgEIAEoBVIFbWF4SHASFgoGYXR0YWNrGAUgASgFUgZhdHRh'
    'Y2sSGAoHZGVmZW5zZRgGIAEoBVIHZGVmZW5zZRIQCgNleHAYByABKAVSA2V4cBIUCgVsZXZlbB'
    'gIIAEoBVIFbGV2ZWwSLQoIcG9zaXRpb24YCSABKAsyES5nYW1lLnYxLlBvc2l0aW9uUghwb3Np'
    'dGlvbhIbCglpbl9jb21iYXQYCiABKAhSCGluQ29tYmF0EjoKDWNvbWJhdF90YXJnZXQYCyABKA'
    'syFS5nYW1lLnYxLkNvbWJhdFRhcmdldFIMY29tYmF0VGFyZ2V0');

@$core.Deprecated('Use combatTargetDescriptor instead')
const CombatTarget$json = {
  '1': 'CombatTarget',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'hp', '3': 3, '4': 1, '5': 5, '10': 'hp'},
    {'1': 'max_hp', '3': 4, '4': 1, '5': 5, '10': 'maxHp'},
  ],
};

/// Descriptor for `CombatTarget`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List combatTargetDescriptor = $convert.base64Decode(
    'CgxDb21iYXRUYXJnZXQSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSDgoCaH'
    'AYAyABKAVSAmhwEhUKBm1heF9ocBgEIAEoBVIFbWF4SHA=');

@$core.Deprecated('Use combatResultDescriptor instead')
const CombatResult$json = {
  '1': 'CombatResult',
  '2': [
    {'1': 'turn', '3': 1, '4': 1, '5': 5, '10': 'turn'},
    {'1': 'player_damage', '3': 2, '4': 1, '5': 5, '10': 'playerDamage'},
    {'1': 'monster_damage', '3': 3, '4': 1, '5': 5, '10': 'monsterDamage'},
    {'1': 'player_hp', '3': 4, '4': 1, '5': 5, '10': 'playerHp'},
    {'1': 'player_max_hp', '3': 5, '4': 1, '5': 5, '10': 'playerMaxHp'},
    {'1': 'monster_hp', '3': 6, '4': 1, '5': 5, '10': 'monsterHp'},
    {'1': 'monster_max_hp', '3': 7, '4': 1, '5': 5, '10': 'monsterMaxHp'},
    {'1': 'player_died', '3': 8, '4': 1, '5': 8, '10': 'playerDied'},
    {'1': 'monster_died', '3': 9, '4': 1, '5': 8, '10': 'monsterDied'},
    {'1': 'exp_gained', '3': 10, '4': 1, '5': 5, '10': 'expGained'},
  ],
};

/// Descriptor for `CombatResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List combatResultDescriptor = $convert.base64Decode(
    'CgxDb21iYXRSZXN1bHQSEgoEdHVybhgBIAEoBVIEdHVybhIjCg1wbGF5ZXJfZGFtYWdlGAIgAS'
    'gFUgxwbGF5ZXJEYW1hZ2USJQoObW9uc3Rlcl9kYW1hZ2UYAyABKAVSDW1vbnN0ZXJEYW1hZ2US'
    'GwoJcGxheWVyX2hwGAQgASgFUghwbGF5ZXJIcBIiCg1wbGF5ZXJfbWF4X2hwGAUgASgFUgtwbG'
    'F5ZXJNYXhIcBIdCgptb25zdGVyX2hwGAYgASgFUgltb25zdGVySHASJAoObW9uc3Rlcl9tYXhf'
    'aHAYByABKAVSDG1vbnN0ZXJNYXhIcBIfCgtwbGF5ZXJfZGllZBgIIAEoCFIKcGxheWVyRGllZB'
    'IhCgxtb25zdGVyX2RpZWQYCSABKAhSC21vbnN0ZXJEaWVkEh0KCmV4cF9nYWluZWQYCiABKAVS'
    'CWV4cEdhaW5lZA==');

@$core.Deprecated('Use mapStateDescriptor instead')
const MapState$json = {
  '1': 'MapState',
  '2': [
    {'1': 'players', '3': 1, '4': 3, '5': 11, '6': '.game.v1.PlayerInfo', '10': 'players'},
    {'1': 'monster', '3': 2, '4': 1, '5': 11, '6': '.game.v1.MonsterInfo', '10': 'monster'},
  ],
};

/// Descriptor for `MapState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapStateDescriptor = $convert.base64Decode(
    'CghNYXBTdGF0ZRItCgdwbGF5ZXJzGAEgAygLMhMuZ2FtZS52MS5QbGF5ZXJJbmZvUgdwbGF5ZX'
    'JzEi4KB21vbnN0ZXIYAiABKAsyFC5nYW1lLnYxLk1vbnN0ZXJJbmZvUgdtb25zdGVy');

@$core.Deprecated('Use playerInfoDescriptor instead')
const PlayerInfo$json = {
  '1': 'PlayerInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'position', '3': 3, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'position'},
    {'1': 'in_combat', '3': 4, '4': 1, '5': 8, '10': 'inCombat'},
  ],
};

/// Descriptor for `PlayerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerInfoDescriptor = $convert.base64Decode(
    'CgpQbGF5ZXJJbmZvEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEi0KCHBvc2'
    'l0aW9uGAMgASgLMhEuZ2FtZS52MS5Qb3NpdGlvblIIcG9zaXRpb24SGwoJaW5fY29tYmF0GAQg'
    'ASgIUghpbkNvbWJhdA==');

@$core.Deprecated('Use monsterInfoDescriptor instead')
const MonsterInfo$json = {
  '1': 'MonsterInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'position', '3': 3, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'position'},
    {'1': 'hp', '3': 4, '4': 1, '5': 5, '10': 'hp'},
    {'1': 'max_hp', '3': 5, '4': 1, '5': 5, '10': 'maxHp'},
  ],
};

/// Descriptor for `MonsterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monsterInfoDescriptor = $convert.base64Decode(
    'CgtNb25zdGVySW5mbxIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRItCghwb3'
    'NpdGlvbhgDIAEoCzIRLmdhbWUudjEuUG9zaXRpb25SCHBvc2l0aW9uEg4KAmhwGAQgASgFUgJo'
    'cBIVCgZtYXhfaHAYBSABKAVSBW1heEhw');

@$core.Deprecated('Use gameEventDescriptor instead')
const GameEvent$json = {
  '1': 'GameEvent',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.game.v1.EventType', '10': 'type'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'player_joined', '3': 10, '4': 1, '5': 11, '6': '.game.v1.PlayerJoinedEvent', '9': 0, '10': 'playerJoined'},
    {'1': 'player_left', '3': 11, '4': 1, '5': 11, '6': '.game.v1.PlayerLeftEvent', '9': 0, '10': 'playerLeft'},
    {'1': 'player_moved', '3': 12, '4': 1, '5': 11, '6': '.game.v1.PlayerMovedEvent', '9': 0, '10': 'playerMoved'},
    {'1': 'player_died', '3': 13, '4': 1, '5': 11, '6': '.game.v1.PlayerDiedEvent', '9': 0, '10': 'playerDied'},
    {'1': 'player_level_up', '3': 14, '4': 1, '5': 11, '6': '.game.v1.PlayerLevelUpEvent', '9': 0, '10': 'playerLevelUp'},
    {'1': 'combat_started', '3': 20, '4': 1, '5': 11, '6': '.game.v1.CombatStartedEvent', '9': 0, '10': 'combatStarted'},
    {'1': 'combat_turn', '3': 21, '4': 1, '5': 11, '6': '.game.v1.CombatTurnEvent', '9': 0, '10': 'combatTurn'},
    {'1': 'combat_ended', '3': 22, '4': 1, '5': 11, '6': '.game.v1.CombatEndedEvent', '9': 0, '10': 'combatEnded'},
    {'1': 'monster_moved', '3': 30, '4': 1, '5': 11, '6': '.game.v1.MonsterMovedEvent', '9': 0, '10': 'monsterMoved'},
    {'1': 'monster_died', '3': 31, '4': 1, '5': 11, '6': '.game.v1.MonsterDiedEvent', '9': 0, '10': 'monsterDied'},
    {'1': 'monster_spawned', '3': 32, '4': 1, '5': 11, '6': '.game.v1.MonsterSpawnedEvent', '9': 0, '10': 'monsterSpawned'},
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `GameEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameEventDescriptor = $convert.base64Decode(
    'CglHYW1lRXZlbnQSJgoEdHlwZRgBIAEoDjISLmdhbWUudjEuRXZlbnRUeXBlUgR0eXBlEhwKCX'
    'RpbWVzdGFtcBgCIAEoA1IJdGltZXN0YW1wEkEKDXBsYXllcl9qb2luZWQYCiABKAsyGi5nYW1l'
    'LnYxLlBsYXllckpvaW5lZEV2ZW50SABSDHBsYXllckpvaW5lZBI7CgtwbGF5ZXJfbGVmdBgLIA'
    'EoCzIYLmdhbWUudjEuUGxheWVyTGVmdEV2ZW50SABSCnBsYXllckxlZnQSPgoMcGxheWVyX21v'
    'dmVkGAwgASgLMhkuZ2FtZS52MS5QbGF5ZXJNb3ZlZEV2ZW50SABSC3BsYXllck1vdmVkEjsKC3'
    'BsYXllcl9kaWVkGA0gASgLMhguZ2FtZS52MS5QbGF5ZXJEaWVkRXZlbnRIAFIKcGxheWVyRGll'
    'ZBJFCg9wbGF5ZXJfbGV2ZWxfdXAYDiABKAsyGy5nYW1lLnYxLlBsYXllckxldmVsVXBFdmVudE'
    'gAUg1wbGF5ZXJMZXZlbFVwEkQKDmNvbWJhdF9zdGFydGVkGBQgASgLMhsuZ2FtZS52MS5Db21i'
    'YXRTdGFydGVkRXZlbnRIAFINY29tYmF0U3RhcnRlZBI7Cgtjb21iYXRfdHVybhgVIAEoCzIYLm'
    'dhbWUudjEuQ29tYmF0VHVybkV2ZW50SABSCmNvbWJhdFR1cm4SPgoMY29tYmF0X2VuZGVkGBYg'
    'ASgLMhkuZ2FtZS52MS5Db21iYXRFbmRlZEV2ZW50SABSC2NvbWJhdEVuZGVkEkEKDW1vbnN0ZX'
    'JfbW92ZWQYHiABKAsyGi5nYW1lLnYxLk1vbnN0ZXJNb3ZlZEV2ZW50SABSDG1vbnN0ZXJNb3Zl'
    'ZBI+Cgxtb25zdGVyX2RpZWQYHyABKAsyGS5nYW1lLnYxLk1vbnN0ZXJEaWVkRXZlbnRIAFILbW'
    '9uc3RlckRpZWQSRwoPbW9uc3Rlcl9zcGF3bmVkGCAgASgLMhwuZ2FtZS52MS5Nb25zdGVyU3Bh'
    'd25lZEV2ZW50SABSDm1vbnN0ZXJTcGF3bmVkQgkKB3BheWxvYWQ=');

@$core.Deprecated('Use playerJoinedEventDescriptor instead')
const PlayerJoinedEvent$json = {
  '1': 'PlayerJoinedEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'player_name', '3': 2, '4': 1, '5': 9, '10': 'playerName'},
    {'1': 'position', '3': 3, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'position'},
  ],
};

/// Descriptor for `PlayerJoinedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerJoinedEventDescriptor = $convert.base64Decode(
    'ChFQbGF5ZXJKb2luZWRFdmVudBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklkEh8KC3BsYX'
    'llcl9uYW1lGAIgASgJUgpwbGF5ZXJOYW1lEi0KCHBvc2l0aW9uGAMgASgLMhEuZ2FtZS52MS5Q'
    'b3NpdGlvblIIcG9zaXRpb24=');

@$core.Deprecated('Use playerLeftEventDescriptor instead')
const PlayerLeftEvent$json = {
  '1': 'PlayerLeftEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `PlayerLeftEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLeftEventDescriptor = $convert.base64Decode(
    'Cg9QbGF5ZXJMZWZ0RXZlbnQSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZA==');

@$core.Deprecated('Use playerMovedEventDescriptor instead')
const PlayerMovedEvent$json = {
  '1': 'PlayerMovedEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'from', '3': 2, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'to'},
  ],
};

/// Descriptor for `PlayerMovedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerMovedEventDescriptor = $convert.base64Decode(
    'ChBQbGF5ZXJNb3ZlZEV2ZW50EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQSJQoEZnJvbR'
    'gCIAEoCzIRLmdhbWUudjEuUG9zaXRpb25SBGZyb20SIQoCdG8YAyABKAsyES5nYW1lLnYxLlBv'
    'c2l0aW9uUgJ0bw==');

@$core.Deprecated('Use playerDiedEventDescriptor instead')
const PlayerDiedEvent$json = {
  '1': 'PlayerDiedEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `PlayerDiedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDiedEventDescriptor = $convert.base64Decode(
    'Cg9QbGF5ZXJEaWVkRXZlbnQSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZA==');

@$core.Deprecated('Use playerLevelUpEventDescriptor instead')
const PlayerLevelUpEvent$json = {
  '1': 'PlayerLevelUpEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'new_level', '3': 2, '4': 1, '5': 5, '10': 'newLevel'},
  ],
};

/// Descriptor for `PlayerLevelUpEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLevelUpEventDescriptor = $convert.base64Decode(
    'ChJQbGF5ZXJMZXZlbFVwRXZlbnQSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBIbCgluZX'
    'dfbGV2ZWwYAiABKAVSCG5ld0xldmVs');

@$core.Deprecated('Use combatStartedEventDescriptor instead')
const CombatStartedEvent$json = {
  '1': 'CombatStartedEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'monster_id', '3': 2, '4': 1, '5': 9, '10': 'monsterId'},
  ],
};

/// Descriptor for `CombatStartedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List combatStartedEventDescriptor = $convert.base64Decode(
    'ChJDb21iYXRTdGFydGVkRXZlbnQSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBIdCgptb2'
    '5zdGVyX2lkGAIgASgJUgltb25zdGVySWQ=');

@$core.Deprecated('Use combatTurnEventDescriptor instead')
const CombatTurnEvent$json = {
  '1': 'CombatTurnEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'monster_id', '3': 2, '4': 1, '5': 9, '10': 'monsterId'},
    {'1': 'player_damage', '3': 3, '4': 1, '5': 5, '10': 'playerDamage'},
    {'1': 'monster_damage', '3': 4, '4': 1, '5': 5, '10': 'monsterDamage'},
    {'1': 'player_hp', '3': 5, '4': 1, '5': 5, '10': 'playerHp'},
    {'1': 'player_max_hp', '3': 6, '4': 1, '5': 5, '10': 'playerMaxHp'},
    {'1': 'monster_hp', '3': 7, '4': 1, '5': 5, '10': 'monsterHp'},
    {'1': 'monster_max_hp', '3': 8, '4': 1, '5': 5, '10': 'monsterMaxHp'},
    {'1': 'turn', '3': 9, '4': 1, '5': 5, '10': 'turn'},
  ],
};

/// Descriptor for `CombatTurnEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List combatTurnEventDescriptor = $convert.base64Decode(
    'Cg9Db21iYXRUdXJuRXZlbnQSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBIdCgptb25zdG'
    'VyX2lkGAIgASgJUgltb25zdGVySWQSIwoNcGxheWVyX2RhbWFnZRgDIAEoBVIMcGxheWVyRGFt'
    'YWdlEiUKDm1vbnN0ZXJfZGFtYWdlGAQgASgFUg1tb25zdGVyRGFtYWdlEhsKCXBsYXllcl9ocB'
    'gFIAEoBVIIcGxheWVySHASIgoNcGxheWVyX21heF9ocBgGIAEoBVILcGxheWVyTWF4SHASHQoK'
    'bW9uc3Rlcl9ocBgHIAEoBVIJbW9uc3RlckhwEiQKDm1vbnN0ZXJfbWF4X2hwGAggASgFUgxtb2'
    '5zdGVyTWF4SHASEgoEdHVybhgJIAEoBVIEdHVybg==');

@$core.Deprecated('Use combatEndedEventDescriptor instead')
const CombatEndedEvent$json = {
  '1': 'CombatEndedEvent',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'monster_id', '3': 2, '4': 1, '5': 9, '10': 'monsterId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 14, '6': '.game.v1.CombatEndReason', '10': 'reason'},
    {'1': 'exp_gained', '3': 4, '4': 1, '5': 5, '10': 'expGained'},
  ],
};

/// Descriptor for `CombatEndedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List combatEndedEventDescriptor = $convert.base64Decode(
    'ChBDb21iYXRFbmRlZEV2ZW50EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQSHQoKbW9uc3'
    'Rlcl9pZBgCIAEoCVIJbW9uc3RlcklkEjAKBnJlYXNvbhgDIAEoDjIYLmdhbWUudjEuQ29tYmF0'
    'RW5kUmVhc29uUgZyZWFzb24SHQoKZXhwX2dhaW5lZBgEIAEoBVIJZXhwR2FpbmVk');

@$core.Deprecated('Use monsterMovedEventDescriptor instead')
const MonsterMovedEvent$json = {
  '1': 'MonsterMovedEvent',
  '2': [
    {'1': 'monster_id', '3': 1, '4': 1, '5': 9, '10': 'monsterId'},
    {'1': 'from', '3': 2, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'to'},
  ],
};

/// Descriptor for `MonsterMovedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monsterMovedEventDescriptor = $convert.base64Decode(
    'ChFNb25zdGVyTW92ZWRFdmVudBIdCgptb25zdGVyX2lkGAEgASgJUgltb25zdGVySWQSJQoEZn'
    'JvbRgCIAEoCzIRLmdhbWUudjEuUG9zaXRpb25SBGZyb20SIQoCdG8YAyABKAsyES5nYW1lLnYx'
    'LlBvc2l0aW9uUgJ0bw==');

@$core.Deprecated('Use monsterDiedEventDescriptor instead')
const MonsterDiedEvent$json = {
  '1': 'MonsterDiedEvent',
  '2': [
    {'1': 'monster_id', '3': 1, '4': 1, '5': 9, '10': 'monsterId'},
    {'1': 'killer_id', '3': 2, '4': 1, '5': 9, '10': 'killerId'},
    {'1': 'contributors', '3': 3, '4': 3, '5': 9, '10': 'contributors'},
  ],
};

/// Descriptor for `MonsterDiedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monsterDiedEventDescriptor = $convert.base64Decode(
    'ChBNb25zdGVyRGllZEV2ZW50Eh0KCm1vbnN0ZXJfaWQYASABKAlSCW1vbnN0ZXJJZBIbCglraW'
    'xsZXJfaWQYAiABKAlSCGtpbGxlcklkEiIKDGNvbnRyaWJ1dG9ycxgDIAMoCVIMY29udHJpYnV0'
    'b3Jz');

@$core.Deprecated('Use monsterSpawnedEventDescriptor instead')
const MonsterSpawnedEvent$json = {
  '1': 'MonsterSpawnedEvent',
  '2': [
    {'1': 'monster_id', '3': 1, '4': 1, '5': 9, '10': 'monsterId'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.game.v1.Position', '10': 'position'},
  ],
};

/// Descriptor for `MonsterSpawnedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monsterSpawnedEventDescriptor = $convert.base64Decode(
    'ChNNb25zdGVyU3Bhd25lZEV2ZW50Eh0KCm1vbnN0ZXJfaWQYASABKAlSCW1vbnN0ZXJJZBItCg'
    'hwb3NpdGlvbhgCIAEoCzIRLmdhbWUudjEuUG9zaXRpb25SCHBvc2l0aW9u');

