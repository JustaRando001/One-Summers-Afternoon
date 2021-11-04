extends RigidBody2D
class_name Bug

export var speed := 20
export var health: int = 1

func _physics_process(delta):
	position.x += speed * delta
	position.y += speed * delta
	
func damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
