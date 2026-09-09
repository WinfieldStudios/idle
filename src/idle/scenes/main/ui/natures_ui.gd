class_name NaturesUI
extends Control


var twigs : int = 0
@export var twigs_count_label : Label
signal twigs_button_pressed


func _on_ready() -> void:
	pass


func _on_twigs_button_pressed() -> void:
	twigs_button_pressed.emit()
	print("twig")


func _on_resources_ui_twig_purchased() -> void:
	twigs += 1
	twigs_count_label.text = "%s" %twigs
