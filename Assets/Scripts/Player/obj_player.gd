extends CharacterBody2D

var hspd = 0;
var vspd = 0;
var pSpd = 2;
var frameCounter = 0;
var rot = true;
var bullet = preload("res://Assets/Scenes/bullet.tscn")
# create function. called on creation.
func _ready():
	print("Yeah, I'm a total godot cell, I'm basically going pythonic mode and giving open source vibes.");
	

# step function; called every frame. 
func _physics_process(delta):
	
	#Setting hspd and vspd variables as the press_check in one direction minus the other direction. Classic givin.
	hspd = Input.get_axis("Move Left","Move Right");
	vspd = Input.get_axis("Move Up","Move Down");
	velocity = Vector2(hspd, vspd).normalized() * pSpd


	
	if(hspd != 0): 
		$Sprite2D.set_flip_h(hspd>0);
	
	$Sprite2D/Gun.set_flip_v(get_local_mouse_position().x < 0);
	if(get_local_mouse_position().x < 0):
		$Sprite2D/Gun/BulletSpawn.position.y = 400;
	else:
		$Sprite2D/Gun/BulletSpawn.position.y = -300;
		
	# stupid animation I made
	frameCounter += 1;
	if(frameCounter == 10): frameCounter = 0; rot = !rot;
	if(velocity != Vector2(0,0)):
		if(rot == true):
			$Sprite2D.rotation_degrees = 5;
		else:
			$Sprite2D.rotation_degrees = -5;
	else:
		$Sprite2D.rotation_degrees = 0;
	
	
	move_and_collide(velocity * 50 * delta);
	
	

func _input(event):
	if event.is_action_pressed("Shoot"):
		var insBullet = bullet.instantiate()
		insBullet.position = $Sprite2D/Gun/BulletSpawn.global_position
		insBullet.rotation = $Sprite2D/Gun.rotation
		get_tree().get_root().add_child(insBullet)
		
		
		
