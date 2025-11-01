# day and night cycles

extends CanvasLayer

@onready var light_manager: ColorRect = $LightManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if light_manager.material :
		light_manager.material.set_shader_parameter("modulate_color", Color(0.169,0.21321326,0.32432337,1))
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
