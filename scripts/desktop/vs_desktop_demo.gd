class_name VSDesktopDemo
extends Control

@onready var _rift_window: RiftWindowMock = $RiftWindowMock
@onready var _status_hud: VSStatusHud = $VSStatusHud


func _ready() -> void:
	_rift_window.status_changed.connect(_on_rift_status_changed)
	_rift_window.collapsed_changed.connect(_on_rift_collapsed_changed)
	_status_hud.collapse_requested.connect(_on_hud_collapse_requested)
	_status_hud.expand_requested.connect(_on_hud_expand_requested)
	_set_status_text("VS 概念样机已启动")


func _on_hud_collapse_requested() -> void:
	_rift_window.set_collapsed(true)


func _on_hud_expand_requested() -> void:
	_rift_window.set_collapsed(false)


func _on_rift_status_changed(status_text: String) -> void:
	_set_status_text(status_text)


func _on_rift_collapsed_changed(is_collapsed: bool) -> void:
	_status_hud.set_collapsed(is_collapsed)


func _set_status_text(status_text: String) -> void:
	if is_instance_valid(_status_hud):
		_status_hud.set_status_text(status_text)
