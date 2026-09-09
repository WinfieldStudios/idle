class_name NaturesUI
extends Control


var twigs : int = 0
var twigs_cost : int = 1
@export var twigs_count_label : Label
signal twigs_button_pressed

var pebbles : int = 0
var pebbles_cost : int = 1
@export var pebbles_count_label : Label
signal pebbles_button_pressed

var lights : int = 0
var lights_cost : int = 1
@export var lights_count_label : Label
signal lights_button_pressed


func _on_ready() -> void:
	pass


func _on_twigs_button_pressed() -> void:
	twigs_button_pressed.emit(twigs_cost)

func _on_resources_ui_twigs_purchased() -> void:
	twigs += 1
	twigs_count_label.text = "%s" %twigs


func _on_pebbles_button_pressed() -> void:
	pebbles_button_pressed.emit(pebbles_cost)

func _on_resources_ui_pebbles_purchased() -> void:
	pebbles += 1
	pebbles_count_label.text = "%s" %pebbles


func _on_lights_button_pressed() -> void:
	lights_button_pressed.emit(lights_cost)

func _on_resources_ui_lights_purchased() -> void:
	lights += 1
	lights_count_label.text = "%s" %lights
