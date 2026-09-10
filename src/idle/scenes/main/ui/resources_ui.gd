class_name ResourceGenerator
extends Control


var STARTING_AMOUNT : int = 10

@export var timerStandard : Timer
@export var timerFast : Timer
@export var timerSlow : Timer

## ARCANA
var arcana : int = STARTING_AMOUNT
var arcanaDeltaSlow : int = 1
var arcanaDeltaStandard : int = 0
var arcanaDeltaFast : int = 0
@export var arcanaCountLabel : Label

## SUNLIGHT
var sunlight : int = STARTING_AMOUNT
var sunlightDeltaSlow : int = 0
var sunlightDeltaStandard : int = 0
var sunlightDeltaFast : int = 1
@export var sunlightCountLabel : Label

## NITROGEN
var nitrogen : int = STARTING_AMOUNT
var nitrogenDeltaSlow : int = 0
var nitrogenDeltaStandard : int = 0
var nitrogenDeltaFast : int = 0
@export var nitrogenCountLabel : Label

## CARBON DIOXIDE
var carbon : int = STARTING_AMOUNT
var carbonDeltaSlow : int = 0
var carbonDeltaStandard : int = 0
var carbonDeltaFast : int = 0
@export var carbonCountLabel : Label

## OXYGEN
var oxygen : int = STARTING_AMOUNT
var oxygenDeltaSlow : int = 0
var oxygenDeltaStandard : int = 0
var oxygenDeltaFast : int = 0
@export var oxygenCountLabel : Label

## DETRITUS
var detritus : int = STARTING_AMOUNT
var detritusDeltaSlow : int = 0
var detritusDeltaStandard : int = 0
var detritusDeltaFast : int = 0
@export var detritusCountLabel : Label

## FOOD
var food : int = STARTING_AMOUNT
var foodDeltaSlow : int = 0
var foodDeltaStandard : int = 0
var foodDeltaFast : int = 0
@export var foodCountLabel : Label

# NATURES
var natures_twigs : int = 0
var natures_pebbles : int = 0
var natures_lights : int = 0

# ORGANISMS
var organisms_total : int = 0
var organisms_algae : int = 0
var organisms_mold : int = 0
var organisms_critters : int = 0


signal depleted_arcana
signal depleted_sunlight
signal depleted_nitrogen
signal depleted_carbon
signal depleted_oxygen
signal depleted_detritus
signal depleted_food

signal spawned_organisms_algae
signal spawned_organisms_mold
signal spawned_organisms_critters

signal spawned_natures_twigs
signal spawned_natures_pebbles
signal spawned_natures_lights


func _ready() -> void:
	start_timers()
	update_resource_count_labels()
	

func start_timers() -> void:
	timerStandard.start()
	timerFast.start()
	timerSlow.start()
	
	
func update_arcana_count_label() -> void:
	arcanaCountLabel.text = "%s" %arcana
	
	
## Generates resources every minute
func generate_resources_slow() -> void:
	arcana += arcanaDeltaSlow
	sunlight += sunlightDeltaSlow
	nitrogen += nitrogenDeltaSlow
	carbon += carbonDeltaSlow
	oxygen += oxygenDeltaSlow
	detritus += detritusDeltaSlow
	food += foodDeltaSlow
	floor_resource_values()
	update_resource_count_labels()
	

## Generates resources every 6 seconds
func generate_resources_standard() -> void:
	arcana += arcanaDeltaStandard
	sunlight += sunlightDeltaStandard
	nitrogen += nitrogenDeltaStandard
	carbon += carbonDeltaStandard
	oxygen += oxygenDeltaStandard
	detritus += detritusDeltaStandard
	food += foodDeltaStandard
	floor_resource_values()
	update_resource_count_labels()
	
	
## Generates resources every second
func generate_resources_fast() -> void:
	arcana += arcanaDeltaFast
	sunlight += sunlightDeltaFast
	nitrogen += nitrogenDeltaFast
	carbon += carbonDeltaFast
	oxygen += oxygenDeltaFast
	detritus += detritusDeltaFast
	food += foodDeltaFast
	floor_resource_values()
	update_resource_count_labels()
	

## Signal if any resources are below Zero
func floor_resource_values() -> void:
	if arcana < 0:
		depleted_arcana.emit(arcana)
		arcana = 0
	if sunlight < 0:
		depleted_sunlight.emit(sunlight)
		sunlight = 0
	if nitrogen < 0:
		depleted_nitrogen.emit(nitrogen)
		nitrogen = 0
	if carbon < 0:
		depleted_carbon.emit(carbon)
		carbon = 0
	if oxygen < 0:
		depleted_oxygen.emit(oxygen)
		oxygen = 0
	if detritus < 0:
		depleted_detritus.emit(detritus)
		detritus = 0
	if food < 0:
		depleted_food.emit(food)
		food = 0
	

## Updates the UI
func update_resource_count_labels() -> void:
	arcanaCountLabel.text = "%s" %arcana
	sunlightCountLabel.text = "%s" %sunlight
	nitrogenCountLabel.text = "%s" %nitrogen
	carbonCountLabel.text = "%s" %carbon
	oxygenCountLabel.text = "%s" %oxygen
	detritusCountLabel.text = "%s" %detritus
	foodCountLabel.text = "%s" %food
	

func update_resource_generations() -> void:
	## Natures
	arcanaDeltaSlow = 1
	arcanaDeltaStandard = 0
	arcanaDeltaFast = 0
	sunlightDeltaSlow = natures_lights
	sunlightDeltaStandard = 0
	sunlightDeltaFast = 1
	nitrogenDeltaSlow = natures_pebbles
	nitrogenDeltaStandard = 0
	nitrogenDeltaFast = 0
	carbonDeltaSlow = 0
	carbonDeltaStandard = 0
	carbonDeltaFast = 0
	oxygenDeltaSlow = 0
	oxygenDeltaStandard = 0
	oxygenDeltaFast = 0
	detritusDeltaSlow = natures_twigs
	detritusDeltaStandard = 0
	detritusDeltaFast = 0
	foodDeltaSlow = 0
	foodDeltaStandard = 0
	foodDeltaFast = 0
	
	
	## Total Organisms :: add '/ log(10)' for base 10
	arcanaDeltaSlow += log(max(organisms_total, 1))
	
	## Algae
	sunlightDeltaStandard -= organisms_algae
	nitrogenDeltaSlow -= organisms_algae
	carbonDeltaStandard -= organisms_algae
	oxygenDeltaFast += organisms_algae
	foodDeltaStandard += organisms_algae
	
	## Mold
	detritusDeltaStandard -= organisms_mold
	oxygenDeltaStandard -= organisms_mold
	carbonDeltaStandard += organisms_mold
	nitrogenDeltaStandard += organisms_mold
	
	## Critters
	foodDeltaFast -= organisms_critters
	oxygenDeltaStandard -= organisms_critters
	carbonDeltaStandard += organisms_critters
	detritusDeltaStandard += organisms_critters
	

func _on_timer_fast_timeout() -> void:
	update_resource_generations()
	generate_resources_fast()
	update_resource_count_labels()


func _on_timer_standard_timeout() -> void:
	update_resource_generations()
	generate_resources_standard()
	update_resource_count_labels()


func _on_timer_slow_timeout() -> void:
	update_resource_generations()
	generate_resources_slow()
	update_resource_count_labels()


func _on_natures_ui_twigs_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_natures_twigs.emit()
	else:
		pass


func _on_natures_ui_pebbles_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_natures_pebbles.emit()
	else:
		pass


func _on_natures_ui_lights_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_natures_lights.emit()
	else:
		pass


func _on_organisms_ui_algae_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_organisms_algae.emit()
	else:
		pass


func _on_organisms_ui_mold_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_organisms_mold.emit()
	else:
		pass


func _on_organisms_ui_critters_button_pressed(cost) -> void:
	if arcana >= cost:
		arcana -= cost
		update_arcana_count_label()
		spawned_organisms_critters.emit()
	else:
		pass


func _on_organisms_ui_update_counts(total_organisms, algae, mold, critters) -> void:
	organisms_total = total_organisms
	organisms_algae = algae
	organisms_mold = mold
	organisms_critters = critters


func _on_natures_ui_update_counts(twigs, pebbles, lights) -> void:
	natures_twigs = twigs
	natures_pebbles = pebbles
	natures_lights = lights
