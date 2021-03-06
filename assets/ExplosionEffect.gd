extends Particles
## This removes itself from it's current parent so that the effect won't be tied to the ship's lifetime&transform.

## Provided Signals
#signal value_changed(new_value)

## Exported vars
#export var value : int = 0 setget set_value, get_value

## Internal Vars
onready var animationPlayer : AnimationPlayer = $AnimationPlayer

## Methods
func explode():
	# Set transform to the current ship's transform.
	transform = get_parent().global_transform
	
	# Explode!
	animationPlayer.play("Explode")
	
	# Reparent to the node above the current ship.
	var parent = get_parent()
	parent.remove_child(self)
	parent.get_parent().add_child(self)
	owner = parent.get_parent()

## Connected Signals