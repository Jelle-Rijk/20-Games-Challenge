extends Node2D

@onready var foreground: Parallax2D = $Foreground
@onready var mountains: Parallax2D = $Mountains
@onready var distant_mountains: Parallax2D = $Mountains/DistantMountains
@onready var clouds: Parallax2D = $Clouds
@onready var distant_clouds: Parallax2D = $Clouds/DistantClouds

func stop() -> void:
	foreground.autoscroll.x = 0
	mountains.autoscroll.x = 0
	distant_mountains.autoscroll.x = 0
	clouds.autoscroll.x = 0
	distant_clouds.autoscroll.x = 0
