class_name ResourceGenerator
extends Control


var STARTING_AMOUNT : int = 10

@export var timerStandard : Timer
@export var timerFast : Timer
@export var timerSlow : Timer

## SLOW TIMER
var arcana : int = STARTING_AMOUNT
var arcanaDelta : int = 1
@export var arcanaCountLabel : Label

## FAST TIMER
var sunlight : int = STARTING_AMOUNT
var sunlightDelta : int = 1
@export var sunlightCountLabel : Label

## STANDARD TIMER
var nitrogen : int = STARTING_AMOUNT
var nitrogenDelta : int = 0
@export var nitrogenCountLabel : Label

## STANDARD TIMER
var co2 : int = STARTING_AMOUNT
var co2Delta : int = 0
@export var co2CountLabel : Label

## STANDARD TIMER
var oxygen : int = STARTING_AMOUNT
var oxygenDelta : int = 0
@export var oxygenCountLabel : Label

## STANDARD TIMER
var detritus : int = STARTING_AMOUNT
var detritusDelta : int = 0
@export var detritusCountLabel : Label

## STANDARD TIMER
var food : int = STARTING_AMOUNT
var foodDelta : int = 0
@export var foodCountLabel : Label


signal twig_purchased


func _ready() -> void:
	start_timers()
	update_resource_count_labels()
	update_sunlight_count_label()
	update_arcana_count_label()
	

func start_timers() -> void:
	timerStandard.start()
	timerFast.start()
	timerSlow.start()
	

## Generates Arcana
func generate_arcana() -> void:
	arcana += arcanaDelta
	update_arcana_count_label()
	

## Updates the UI to display the user's arcana count
func update_arcana_count_label() -> void:
	arcanaCountLabel.text = "%s" %arcana
	
	
## Generates Sunlight
func generate_sunlight() -> void:
	sunlight += sunlightDelta
	update_sunlight_count_label()


## Updates the UI to display the user's sunlight count
func update_sunlight_count_label() -> void:
	sunlightCountLabel.text = "%s" %sunlight
	

## Generates all other resources
func generate_resources() -> void:
	nitrogen += nitrogenDelta
	co2 += co2Delta
	oxygen += oxygenDelta
	detritus += detritusDelta
	food += foodDelta
	update_resource_count_labels()
	

## Updates the UI
func update_resource_count_labels() -> void:
	nitrogenCountLabel.text = "%s" %nitrogen
	co2CountLabel.text = "%s" %co2
	oxygenCountLabel.text = "%s" %oxygen
	detritusCountLabel.text = "%s" %detritus
	foodCountLabel.text = "%s" %food


func _on_timer_standard_timeout() -> void:
	generate_resources()


func _on_timer_fast_timeout() -> void:
	generate_sunlight()


func _on_timer_slow_timeout() -> void:
	generate_arcana()


func _on_natures_ui_twigs_button_pressed() -> void:
	if arcana >= 1:
		arcana -= 1
		detritusDelta += 1
		update_arcana_count_label()
		twig_purchased.emit()
	else:
		pass
	
