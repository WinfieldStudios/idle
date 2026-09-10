class_name OrganismsUI
extends Control


var total_organisms : int = 0

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


signal update_counts


func _on_ready() -> void:
	calculate_total_organisms()
	
	
func calculate_total_organisms() -> void:
	total_organisms = 0
	total_organisms += algae
	total_organisms += mold
	total_organisms += critters
	

func send_counts_update() -> void:
	update_counts.emit(total_organisms, algae, mold, critters)


func _on_algae_button_pressed() -> void:
	algae_button_pressed.emit(algae_cost)

func _on_resources_ui_spawned_organisms_algae() -> void:
	algae += 1
	algae_count_label.text = "%s" %algae
	calculate_total_organisms()
	send_counts_update()


func _on_mold_button_pressed() -> void:
	mold_button_pressed.emit(mold_cost)

func _on_resources_ui_spawned_organisms_mold() -> void:
	mold += 1
	mold_count_label.text = "%s" %mold
	calculate_total_organisms()
	send_counts_update()


func _on_critters_button_pressed() -> void:
	critters_button_pressed.emit(critters_cost)

func _on_resources_ui_spawned_organisms_critters() -> void:
	critters += 1
	critters_count_label.text = "%s" %critters
	calculate_total_organisms()
	send_counts_update()


func _on_resources_ui_depleted_sunlight(subtrahend) -> void:
	print("debug")


func _on_resources_ui_depleted_oxygen(subtrahend) -> void:
	print("debug")


func _on_resources_ui_depleted_nitrogen(subtrahend) -> void:
	print("debug")


func _on_resources_ui_depleted_food(subtrahend) -> void:
	print("debug")


func _on_resources_ui_depleted_detritus(subtrahend) -> void:
	print("debug")


func _on_resources_ui_depleted_co_2() -> void:
	print("debug")
