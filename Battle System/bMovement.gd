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
	print("Position: " + str(position));
	print("Target: " + str(target))
	print("Velocity X: " + str(velocity.x))
	print("Velocity Y: " + str(velocity.y))
	print("movX: " + str(movX))
	if(movX != 0 || movY != 0):
		target = Vector2(position.x+(36*movX),position.y+(48*movY));
		velocity.x = sign(movX)*12;
		velocity.y = sign(movY)*12;
	if(position == target):
		velocity = Vector2(0,0);
	move_and_collide(velocity);
