extends CharacterBody2D

@export var velocidad: float = 100.0

func _physics_process(delta):
	var direccion: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")	
	position += direccion * velocidad * delta
	animacionSegunMovimiento(direccion)
	move_and_slide()


func animacionSegunMovimiento(direccion: Vector2 = Vector2.ZERO) -> void:
	var acondicionado: Vector2i = (direccion * 180.0)
	
	if acondicionado == Vector2i(0,-180):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = false
		pasosMovimientos()
	elif acondicionado == Vector2i(0,180):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = false
		pasosMovimientos()
	elif acondicionado == Vector2i(-180,0):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = true
		pasosMovimientos()
	elif acondicionado == Vector2i(180,0):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = false
		pasosMovimientos()
	elif acondicionado == Vector2i(127,-127):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = false
		pasosMovimientos()
	elif acondicionado == Vector2i(127,127):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = false
		pasosMovimientos()
	elif acondicionado == Vector2i(-127,127):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = true
		pasosMovimientos()
	elif acondicionado == Vector2i(-127,-127):
		$AnimatedSprite2D.play("caminar")
		$AnimatedSprite2D.flip_h = true
		pasosMovimientos()
	else:
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.flip_h = false
		$AudioStreamPlayer.stop()

func pasosMovimientos() -> void:
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play(0.0)
