extends Node

#score var with getter and setter
var score = 0 setget set_score

#When set_score is updated, we update the score label here
onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)

#Create timer to send player to main menu after death
#yield will allow player to get the pixels effect before death
func _on_Ship_playerDeath():
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://GameOverMenu.tscn")
