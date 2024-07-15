extends Area2D

@onready var camera = $"../../Camera2D"
@onready var player = $"../../Player"
@export var animation_component: AnimationComponent

var clocs = {
	"PlayerRoom" : Vector2(73, 64),
	"SisterRoom" : Vector2(317, 68),
	"PlayerHall" : Vector2(218, 330),
	"SisterHall" : Vector2(515, 327),
	"MainHall"   : Vector2(147, 561)
}

var camera_locs = {
	clocs["SisterRoom"] : clocs["SisterHall"],
	clocs["PlayerRoom"] : clocs["PlayerHall"],
	clocs["PlayerHall"] : [clocs["PlayerRoom"], clocs["SisterHall"], clocs["MainHall"]],
	clocs["SisterHall"] : [clocs["SisterRoom"], clocs["PlayerHall"]],
	clocs["MainHall"]   : [clocs["PlayerHall"]]
}

var dlocs = {
	"PlayerRoom" : Vector2(104, 132),
	"SisterRoom" : Vector2(280, 133),
	"PlayerHall" : Vector2(200, 280),
	"SisterHall" : Vector2(536, 282),
	"SisHallEnt" : Vector2(406, 352),
	"PlaHallEnt" : Vector2(345, 352),
	"MainHallEnt": Vector2(218, 576),
	"MainHallExt": Vector2(152, 633),
	"PlaHallExt" : Vector2(86, 352)
}

var door_locs = {
	dlocs["SisterRoom"] : dlocs["SisterHall"],
	dlocs["PlayerRoom"] : dlocs["PlayerHall"],
	dlocs["PlayerHall"] : dlocs["PlayerRoom"],
	dlocs["SisterHall"] : dlocs["SisterRoom"],
	dlocs["SisHallEnt"] : dlocs["PlaHallEnt"],
	dlocs["PlaHallEnt"] : dlocs["SisHallEnt"],
	dlocs["PlaHallExt"] : dlocs["MainHallEnt"],
	dlocs["MainHallEnt"]: dlocs["PlaHallExt"]
}

func _on_body_entered(body):
	var newcPos: Vector2
	var newpPos: Vector2
	
	var dir: Vector2
	var dpos = self.position
	var cpos = camera.get_camera_pos()
	
	if dpos == dlocs["PlayerRoom"]:
		dir.y = 1
		newcPos = camera_locs[cpos]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["SisterRoom"]:
		dir.y = 1
		newcPos = camera_locs[cpos]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["PlayerHall"]:
		dir.y = -1
		newcPos = camera_locs[clocs["PlayerHall"]][0]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["SisterHall"]:
		dir.y = -1
		newcPos = camera_locs[clocs["SisterHall"]][0]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["SisHallEnt"]:
		dir.x = -1
		newcPos = camera_locs[clocs["SisterHall"]][1]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["PlaHallEnt"]:
		dir.x = 1
		newcPos = camera_locs[clocs["PlayerHall"]][1]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["MainHallEnt"]:
		dir.x = 1
		newcPos = camera_locs[clocs["MainHall"]][0]
		newpPos = door_locs[dpos]
	elif dpos == dlocs["PlaHallExt"]:
		dir.x = -1
		newcPos = camera_locs[clocs["PlayerHall"]][2]
		newpPos = door_locs[dpos]
		
	camera.move_camera(newcPos)
	player.move_player(newpPos, dir)
	
	
	
