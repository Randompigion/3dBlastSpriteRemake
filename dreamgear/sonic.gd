extends CharacterBody2D
var spriteDirection = "Idle"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var click_position = Vector2()
var target_position = Vector2()


func _physics_process(delta: float) -> void:
	
	if InputEventMouseMotion:
			click_position = get_global_mouse_position()
	
	if position.distance_to(click_position) >15:
		target_position = (click_position - position).normalized()
		velocity = target_position * SPEED
		if spriteDirection == "Left":
			$AnimatedSprite2D.play("RunLEFT")
		elif spriteDirection == "Right":
			$AnimatedSprite2D.play("RunRIGHT")
			
		elif spriteDirection == "BottomRight":
			$AnimatedSprite2D.play("RUNRIGHTDOWN")
		elif spriteDirection == "BottomLeft":
			$AnimatedSprite2D.play("RUNLEFTDOWN")
		move_and_slide()
	else:
		if spriteDirection == "Idle":
			$AnimatedSprite2D.play("Idle")



func _on_left_side_mouse_entered() -> void:
	spriteDirection = "Left"

func _on_right_side_mouse_entered() -> void:
	spriteDirection = "Right"


func _on_bottom_right_side_mouse_entered() -> void:
	spriteDirection = "BottomRight"


func _on_bottom_left_side_mouse_entered() -> void:
	spriteDirection = "BottomLeft"


func _on_teleport_body_entered(body: Node2D) -> void:
	position.x = -326
	position.y = -1546.0


func _on_teleport_2_body_entered(body: Node2D) -> void:
	position.x = 0
	position.y = 0


func _on_idle_mouse_entered() -> void:
	spriteDirection = "Idle"


func _on_loop_teleport_enter_body_entered(body: Node2D) -> void:
	position.x =-400
	position.y = -429.0


func _on_loop_teleport_exit_body_entered(body: Node2D) -> void:
	position.x = -670
	position.y = -353
