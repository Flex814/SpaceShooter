extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

#Var for bullet scene
const Bullet = preload("res://Bullet.tscn")

export(int) var SPEED = 100

#Basic controls
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()
		
#Fire bullet on space bar
func fire_bullet():
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	# sets bullet global pos to ship global pos
	bullet.global_position = global_position

func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position


#Destory ship when something hits it
func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()
