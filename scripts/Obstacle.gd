extends StaticBody2D

@onready var polygon2d = $Polygon2D
@onready var collision_polygon2d = $CollisionPolygon2D


func _ready():
	draw_circle_polygon(30,20)
	collision_polygon2d.polygon = polygon2d.polygon

func draw_circle_polygon(points_nb: int, radius: float) -> void:
	var points = PackedVector2Array()
	for i in range(points_nb+1):
		var point = deg_to_rad(i * 360.0 / points_nb - 90)
		points.push_back(Vector2.ZERO + Vector2(cos(point), sin(point)) * radius)
	polygon2d.polygon = points
