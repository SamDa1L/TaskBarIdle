class_name VSDungeonStrip
extends Control

@export var orc_left_x: float = 120.0
@export var orc_right_x: float = 620.0
@export var orc_walk_speed: float = 70.0

@onready var _orc: Node2D = $EntityLayer/Orc
@onready var _orc_sprite: AnimatedSprite2D = $EntityLayer/Orc/AnimatedSprite2D

var _orc_direction: float = 1.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_play_animation(_orc_sprite, &"walk")
	_update_orc_facing()


func _process(delta: float) -> void:
	_update_orc_patrol(delta)


func _update_orc_patrol(delta: float) -> void:
	_orc.position.x += _orc_direction * orc_walk_speed * delta

	if _orc.position.x >= orc_right_x:
		_orc.position.x = orc_right_x
		_orc_direction = -1.0
		_update_orc_facing()
	elif _orc.position.x <= orc_left_x:
		_orc.position.x = orc_left_x
		_orc_direction = 1.0
		_update_orc_facing()


func _update_orc_facing() -> void:
	_orc.scale.x = abs(_orc.scale.x) * _orc_direction


func _play_animation(sprite: AnimatedSprite2D, animation_name: StringName) -> void:
	if sprite.sprite_frames and sprite.sprite_frames.has_animation(animation_name):
		sprite.play(animation_name)
