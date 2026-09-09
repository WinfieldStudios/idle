class_name SpellsUI
extends Control

@export var biotics_ui : Control
@export var natures_ui : Control


func _on_biotics_button_pressed() -> void:
	natures_ui.visible = false
	biotics_ui.visible = true


func _on_natures_button_pressed() -> void:
	biotics_ui.visible = false
	natures_ui.visible = true
