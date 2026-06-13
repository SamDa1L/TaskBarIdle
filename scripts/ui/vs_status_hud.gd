class_name VSStatusHud
extends Control

signal collapse_requested
signal expand_requested

@onready var _status_label: Label = $StatusPanel/StatusLabel
@onready var _toggle_button: Button = $StatusPanel/ToggleCollapseButton
var _is_collapsed: bool = false


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_PASS
	_toggle_button.pressed.connect(_on_toggle_button_pressed)
	set_collapsed(false)


func set_status_text(status_text: String) -> void:
	if is_instance_valid(_status_label):
		_status_label.text = status_text


func set_collapsed(is_collapsed: bool) -> void:
	_is_collapsed = is_collapsed
	if is_instance_valid(_toggle_button):
		_toggle_button.text = "展开" if _is_collapsed else "收起"
func _on_toggle_button_pressed() -> void:
	if _is_collapsed:
		expand_requested.emit()
	else:
		collapse_requested.emit()
