extends Area2D

var preloadedBugs := preload("res://Bugs/Bug.tscn")
var bug: Bug = preloadedBugs.instance()

func _physics_process(delta):
	position = get_global_mouse_position()

func _on_Bug_area_entered(area):
	area.damage(1)

func _input(event):
	if event.is_action_pressed("click"):
		_on_Bug_area_entered(bug)
