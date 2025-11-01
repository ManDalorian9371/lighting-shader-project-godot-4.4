extends ColorRect

var previous_viewport_size: Vector2
var scale_factor: float = 1
# Light default settings for scaling

func _ready() -> void:
	self.set_process(true)
	previous_viewport_size = get_viewport_rect().size
	

func get_light_positions() -> Array:
	return get_tree().get_nodes_in_group("lights").map(
		func(light: Node2D) -> Vector2:
			return light.get_global_transform_with_canvas().origin
	)

func _process(_delta: float) -> void:
	var current_viewport_size: Vector2 = get_viewport_rect().size
	
	# Scale light parameters if viewport size changed
	if current_viewport_size != previous_viewport_size:
		scale_factor = current_viewport_size.x / previous_viewport_size.x
		
		previous_viewport_size = current_viewport_size

	# Get all lights from group
	var lights = get_tree().get_nodes_in_group("lights")
	var number_of_lights = lights.size()
	
	# Prepare arrays for shader
	var light_positions: Array = []
	var colors: Array = []
	var radii: Array = []
	var strengths: Array = []
	var falloffs: Array = []
	var ons: Array = []
	
	var viewport_transform: Transform2D = get_viewport_transform()
	
	for light in lights:
		# Convert global position to screen-space
		var screen_pos = viewport_transform.basis_xform(light.get_global_transform_with_canvas().origin)
		light_positions.append(screen_pos)
		
		colors.append(light.color)
		radii.append(light.radius * scale_factor)
		strengths.append(light.strength)
		falloffs.append(light.falloff)
		ons.append(light.active)
	
	# Send all parameters to shader
	material.set_shader_parameter("number_of_lights", number_of_lights)
	material.set_shader_parameter("light_positions", light_positions)
	material.set_shader_parameter("light_colors", colors)
	material.set_shader_parameter("light_radii", radii)
	material.set_shader_parameter("light_strengths", strengths)
	material.set_shader_parameter("light_falloffs", falloffs)
	material.set_shader_parameter("light_on", ons)
