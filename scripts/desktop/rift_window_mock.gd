class_name RiftWindowMock
extends Control

signal status_changed(status_text: String)
signal collapsed_changed(is_collapsed: bool)

@export var expanded_size: Vector2 = Vector2(980.0, 180.0)
@export var collapsed_size: Vector2 = Vector2(360.0, 38.0)
@export var bottom_margin: float = 28.0

var _is_collapsed: bool = false
@onready var _rift_edge: ColorRect = get_node_or_null("RiftEdgeLayer") as ColorRect
@onready var _inner_panel: CanvasItem = _find_expanded_content()
@onready var _collapsed_bar: Panel = get_node_or_null("CollapsedBar") as Panel
var _pulse_time: float = 0.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_PASS
	_apply_layout()
	_show_expanded()
	status_changed.emit("裂隙稳定：地下城正在桌面边缘呼吸")


func _process(delta: float) -> void:
	_pulse_time += delta
	var pulse := (sin(_pulse_time * 2.2) + 1.0) * 0.5
	if is_instance_valid(_rift_edge):
		_rift_edge.color = Color(0.25 + pulse * 0.08, 0.06, 0.42 + pulse * 0.18, 0.92)


func set_collapsed(collapsed: bool) -> void:
	if _is_collapsed == collapsed:
		return

	_is_collapsed = collapsed
	_apply_layout()

	if _is_collapsed:
		_show_collapsed()
		status_changed.emit("裂隙已收起：低打扰常驻中")
	else:
		_show_expanded()
		status_changed.emit("裂隙已展开：地下城可观察")

	collapsed_changed.emit(_is_collapsed)


func is_collapsed() -> bool:
	return _is_collapsed


func _apply_layout() -> void:
	var target_size := collapsed_size if _is_collapsed else expanded_size
	custom_minimum_size = target_size
	size = target_size
	anchor_left = 0.5
	anchor_right = 0.5
	anchor_top = 1.0
	anchor_bottom = 1.0
	offset_left = -target_size.x * 0.5
	offset_right = target_size.x * 0.5
	offset_top = -target_size.y - bottom_margin
	offset_bottom = -bottom_margin


func _show_expanded() -> void:
	if is_instance_valid(_rift_edge):
		_rift_edge.visible = true
	if is_instance_valid(_inner_panel):
		_inner_panel.visible = true
	if is_instance_valid(_collapsed_bar):
		_collapsed_bar.visible = false


func _show_collapsed() -> void:
	if is_instance_valid(_rift_edge):
		_rift_edge.visible = false
	if is_instance_valid(_inner_panel):
		_inner_panel.visible = false
	if is_instance_valid(_collapsed_bar):
		_collapsed_bar.visible = true


func _find_expanded_content() -> CanvasItem:
	var dungeon_viewport := get_node_or_null("DungeonViewport") as CanvasItem
	if dungeon_viewport:
		return dungeon_viewport

	return get_node_or_null("VSDungeonStrip") as CanvasItem
