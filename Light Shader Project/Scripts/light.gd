extends Marker2D

@export var active: bool = true                       # Whether this light is currently active
@export var _base_radius: float = 300.0
@export var _base_strength: float = 0.8
@export var _base_falloff: float = 2
var radius: float = 128.0                              # Light radius
var strength: float = 0.8                              # Light strength
var falloff: float = 1.0                               # How fast light fades (lower = softer)
@export var color: Color = Color(1, 1, 1)              # Light color


func _ready():
	radius = _base_radius
	strength = _base_strength
	falloff = _base_falloff
