extends CharacterBody2D

signal larp_finished

@onready var starting_position = $"../Starting_Position"
@onready var ending_position = $"../Ending_Position"




var tween : Tween

func reset() -> void:
	if tween != null:
		tween.kill()
	global_position = starting_position.global_position


#func calculate_time(from : Vector2,to : Vector2) -> float:
#
#	var distance = from.distance_to(to)
#	return distance/1000 * 2

#func larp_to_start() -> void:
#
#	tween = create_tween()
#	tween.tween_property(self,"global_position",Vector2.ZERO,calculate_time(global_position,Vector2.ZERO)).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
#	await tween.finished


func larp(val : bool,time : float,transtype : int, ease_type : int) -> void:

	tween = create_tween()
	if val:
		tween.tween_property(self,"global_position",ending_position.global_position,time).set_trans(transtype).set_ease(ease_type)
	else:
		tween.tween_property(self,"global_position",starting_position.global_position,time).set_trans(transtype).set_ease(ease_type)
	await tween.finished
	larp(!val,time,transtype,ease_type)

	pass
