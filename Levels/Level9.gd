extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_NextLevel_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Levels/Start.tscn")


func _on_Node_reset():
	get_tree().reload_current_scene()