extends Node2D

@onready var move_target := get_tree().get_first_node_in_group("TargetPoint")
@onready var mover := $"../Mover"

@export var speed := 100.0
var state := MonsterState.MOVING

var hit_cooldown := 2.0
var timer := 0.0
var hit_range := 100
var attack_target: Node2D

enum MonsterState {
	MOVING,
	ATTACKING
}

func _process(delta):
	match state:
		MonsterState.MOVING:
			if move_target != null:
				mover.set_destination(move_target.global_position, speed)
			update_state()
			
		MonsterState.ATTACKING:
			timer += delta
			if attack_target == null: timer = 0
			if timer > hit_cooldown:
				var hittables := attack_target.find_children("*", "Hittable")
				if len(hittables) > 0:

					hittables[0].hit(5)
				timer = 0.0
			update_state()

		var unknown_state:
			print("wtf is this state?? wtf is " + str(unknown_state) + "????")

func switch_state(new_state: MonsterState):
	if state == new_state: return


	timer = 0.0
	mover.set_velocity(Vector2.UP, 0.0)
	
	state = new_state

func update_state():
	var target_nodes := get_tree().get_nodes_in_group("monster_target")
	for target in target_nodes:
		if global_position.distance_to(target.global_position) < hit_range:
			attack_target = target
			switch_state(MonsterState.ATTACKING)
			return
	switch_state(MonsterState.MOVING)
