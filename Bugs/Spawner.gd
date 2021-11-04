extends Node2D

var preloadedBugs := preload("res://Bugs/Bug.tscn")

onready var spawnTimer := $SpawnTimer

var nextSpawnTime := 6.0

func _ready():
	randomize()
	spawnTimer.start(nextSpawnTime)

func _on_SpawnTimer_timeout():
	$BugPath/BugSpawnLocation.offset = randi()
	
	var bug: Bug = preloadedBugs.instance()	
	get_tree().current_scene.add_child(bug)
	
	var direction = $BugPath/BugSpawnLocation.rotation + PI / 2
	
	bug.position = $BugPath/BugSpawnLocation.position
	
	direction += rand_range(-PI / 4, PI / 4)
	bug.rotation = direction
	
	bug.linear_velocity = Vector2(bug.speed, 0)
	bug.linear_velocity = bug.linear_velocity.rotated(direction)
	
	nextSpawnTime -= 0.1
	spawnTimer.start(nextSpawnTime)
