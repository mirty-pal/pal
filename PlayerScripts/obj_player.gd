extends CharacterBody2D

var hspd = 0;
var vspd = 0;
var frameCounter = 0;
var rot = true;
# create function. called on creation.
func _ready():
	print("Yeah, I'm a total godot cell, I'm basically going pythonic mode and giving open source vibes.");
	

# step function; called every frame. 
func _physics_process(delta):
	
	#Setting hspd and vspd variables as the press_check in one direction minus the other direction. Classic givin.
	hspd = Input.get_axis("ui_left","ui_right");
	vspd = Input.get_axis("ui_up","ui_down");
	velocity.x = hspd;
	velocity.y = vspd;
	print(velocity)
	print(velocity == Vector2(0,0))
	
	# stupid animation I made
	frameCounter += 1;
	if(frameCounter == 10): frameCounter = 0; rot = !rot;
	if(velocity != Vector2(0,0)):
		if(rot == true):
			rotation_degrees = 5;
		else:
			rotation_degrees = -5;
	else:
		rotation_degrees = 0;
	
	move_and_collide(velocity);
	
	
