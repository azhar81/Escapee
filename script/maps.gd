extends Node2D

func _ready():
	for slime in $Slime.get_children():
		slime.connect("transformed", self, "_on_Slime_transformed")
		
func _on_Slime_slam():
	$Camera2D.add_trauma(0.3)

func _on_Slime_transformed(slime):
	slime.connect("transformed", self, "_on_Slime_transformed")
	slime.connect("slam", self, "_on_Slime_slam")
