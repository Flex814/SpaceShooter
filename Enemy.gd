extends Area2D

export(int) var SPEED = 20
export (int) var ARMOR = 3

#keep body moving left
func _process(delta):
	position.x -= SPEED * delta

#remove armor if body hit
func _on_Enemy_body_entered(body):
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		queue_free()

#Delete when off screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
