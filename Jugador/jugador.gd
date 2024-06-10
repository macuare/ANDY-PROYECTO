extends CharacterBody2D

@export var velocidad: float = 100.0
var atacando: bool = false

func _physics_process(delta):
	var direccion: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")	
	position += direccion * velocidad * delta
	
	if atacando == false:
		animacionSegunMovimiento(direccion)
		move_and_slide()

	if Input.is_action_pressed("ui_accept"):
		atacando = true
		animacionDeAtaque(direccion)
		await $AnimatedSprite2D.animation_finished
	else:
		atacando = false
		$AudioStreamPlayer2.stop()

func animacionSegunMovimiento(direccion: Vector2 = Vector2.ZERO) -> void:
	
	match puntosCardinales(direccion):
		"N":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = false
			pasosMovimientos()
		"S":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = false
			pasosMovimientos()
		"E":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = true
			pasosMovimientos()
		"O":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = false
			pasosMovimientos()
		"NO":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = false
			pasosMovimientos()
		"SO":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = false
			pasosMovimientos()
		"SE":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = true
			pasosMovimientos()
		"NE":
			$AnimatedSprite2D.play("caminar")
			$AnimatedSprite2D.flip_h = true
			pasosMovimientos()
		_:
			$AnimatedSprite2D.play("default")
			$AnimatedSprite2D.flip_h = false
			$AudioStreamPlayer.stop()

func animacionDeAtaque(direccion: Vector2 = Vector2.ZERO) -> void:
	#$AudioStreamPlayer2.stop()
	#$AnimatedSprite2D.stop()
	
	match puntosCardinales(direccion):
		"E","NE":
			$AnimatedSprite2D.play("atk1Espalda")
			$AnimatedSprite2D.flip_h = true
			efectoEspadazo()
			
		"N","NO":
			$AnimatedSprite2D.play("atk1Espalda")
			$AnimatedSprite2D.flip_h = false
			efectoEspadazo()
			
		"O":
			$AnimatedSprite2D.play("atk1Lateral")
			$AnimatedSprite2D.flip_h = false
			efectoEspadazo()
			
		"E":
			$AnimatedSprite2D.play("atk1Lateral")
			$AnimatedSprite2D.flip_h = true
			efectoEspadazo()
			
		"SO","S":
			$AnimatedSprite2D.play("atk1Frontal")
			$AnimatedSprite2D.flip_h = true
			efectoEspadazo()
			
		"SE":
			$AnimatedSprite2D.play("atk1Frontal")
			$AnimatedSprite2D.flip_h = false
			efectoEspadazo()
			
		_:
			$AnimatedSprite2D.play("atk1Lateral")
			$AnimatedSprite2D.flip_h = false
			efectoEspadazo()
			#await get_tree().create_timer(0.25).timeout
			#$AudioStreamPlayer2.stop()
	

func puntosCardinales(pto: Vector2 = Vector2.ZERO) -> String:
	var acondicionado: Vector2i = (pto * 180.0)
	var salida: String = ""
	
	match acondicionado:
		Vector2i(0,-180):
			salida = "N"
		Vector2i(0,180):
			salida = "S"
		Vector2i(-180,0):
			salida = "E"
		Vector2i(180,0):
			salida = "O"
		Vector2i(127,-127):
			salida = "NO"
		Vector2i(127,127):
			salida = "SO"
		Vector2i(-127,127):
			salida = "SE"
		Vector2i(-127,-127):
			salida = "NE"
		_:
			salida = "DEFAULT"
	
	return salida

func pasosMovimientos() -> void:
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play(0.0)

func efectoEspadazo() -> void:
	if !$AudioStreamPlayer2.is_playing():
			$AudioStreamPlayer2.play(3.8)


