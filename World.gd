extends Node

#score var with getter and setter
var score = 0 setget set_score

#When set_score is updated, we update the score label here
onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)
