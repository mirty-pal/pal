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
	hspd = Input.get_axis("ui_left","ui_right");
	vspd = Input.get_axis("ui_up","ui_down");
	velocity.x = hspd*pSpd;
	velocity.y = vspd*pSpd;
	
	if(velocity.x != 0 && velocity.y != 0):
		pSpd = 1.5;
	else:
		pSpd = 2;
		
	if(hspd != 0): 
		$Sprite2D.scale.x = -1*abs($Sprite2D.scale.x)*hspd;
		
		
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
		insBullet.get_node("Watermelon").scale.x *= sign($Sprite2D.scale.x);
		get_tree().get_root().add_child(insBullet)
		
		
		
