extends Control

@onready var character_body_2d = $"../../CharacterBody2D"

var trans_type := 0
var ease_type := 0
var time := 1.0

func _on_start_pressed():
	character_body_2d.reset()
	character_body_2d.larp(true,time,trans_type,ease_type)
	

func _on_ease_item_selected(index):
	ease_type = index


func _on_transition_item_selected(index):
	trans_type = index


func _on_spin_box_value_changed(value):
	time = value
