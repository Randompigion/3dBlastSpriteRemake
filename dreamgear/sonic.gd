extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var click_position = Vector2()
var target_position = Vector2()


func _physics_process(delta: float) -> void:
	
	if InputEventMouseMotion:
			click_position = get_global_mouse_position()
	
	if position.distance_to(click_position) >3:
		target_position = (click_position - position).normalized()
		velocity = target_position * SPEED
		$AnimatedSprite2D.play("Run")
		move_and_slide()
	


func _on_teleport_body_entered(body: Node2D) -> void:
	position.x = -326
	position.y = -1546.0
