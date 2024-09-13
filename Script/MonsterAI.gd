extends Node2D

@onready var move_target := get_tree().current_scene.get_node("TargetPoint")
@onready var mover := $"../Mover"

var speed := 100.0
var state := MonsterState.MOVING

var hit_cooldown := 2.0
var timer := 0.0

enum MonsterState {
	MOVING,
	ATTACKING
}

func _process(delta):
	match state:
		MonsterState.MOVING:
			mover.set_destination(move_target.global_position, speed)

		MonsterState.ATTACKING:
			timer += delta
			if timer > hit_cooldown:
				# attack
				print("MIAOUUU, ATTAAAAAACK")
				timer = 0.0

		var unknown_state:
			print("wtf is this state?? wtf is " + str(unknown_state) + "????")

func switch_state(new_state: MonsterState):
	timer = 0.0
	mover.set_velocity(Vector2.UP, 0.0)
	
	state = new_state
