extends CharacterBody2D

var target = Vector2.ZERO;
var movX = 0;
var movY = 0;
func _physics_process(_delta):
	if(position == target):
		movX = int(Input.is_action_just_pressed("Move Right")) - int(Input.is_action_just_pressed("Move Left"))
		movY = int(Input.is_action_just_pressed("Move Down")) - int(Input.is_action_just_pressed("Move Up"))
	else:
		movX = 0;
		movY = 0;
	
	#set target and move dude towards it
	if(movX != 0 || movY != 0):
		target = Vector2(position.x+(42*movX),position.y+(42*movY));
		velocity.x = sign(movX);
		velocity.y = sign(movY);
		velocity = 6*velocity.normalized();
		
		
	#approximate float numbers 
	var pX = abs((target.x - position.x)/position.x);
	var pY = abs((target.y - position.y)/position.y);
	print("pX: " + str(pX));
	print("pY: " + str(pY));
	
	if(position == target):
		velocity = Vector2(0,0);
	move_and_collide(velocity);
