class_name BioticsUI
extends Control


var algae : int = 0
var algae_cost : int = 1
@export var algae_count_label : Label
signal algae_button_pressed

var mold : int = 0
var mold_cost : int = 1
@export var mold_count_label : Label
signal mold_button_pressed

var critters : int = 0
var critters_cost : int = 1
@export var critters_count_label : Label
signal critters_button_pressed


func _on_ready() -> void:
	pass


func _on_algae_button_pressed() -> void:
	algae_button_pressed.emit(algae_cost)

func _on_resources_ui_algae_purchased() -> void:
	algae += 1
	algae_count_label.text = "%s" %algae


func _on_mold_button_pressed() -> void:
	mold_button_pressed.emit(mold_cost)

func _on_resources_ui_mold_purchased() -> void:
	mold += 1
	mold_count_label.text = "%s" %mold


func _on_critters_button_pressed() -> void:
	critters_button_pressed.emit(critters_cost)

func _on_resources_ui_critters_purchased() -> void:
	critters += 1
	critters_count_label.text = "%s" %critters
