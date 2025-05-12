extends Node

var times := {}  # nickname => time (float in seconds)

const SAVE_PATH := "user://leaderboard.cfg"

func _ready():
	load_times()

func save_times():
	var config = ConfigFile.new()
	for nickname in times.keys():
		config.set_value("Times", nickname, times[nickname])
	config.save(SAVE_PATH)

func load_times():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	if err == OK:
		times.clear()
		for nick in config.get_section_keys("Times"):
			times[nick] = config.get_value("Times", nick, 9999.99)  # Default: very high time

func update_time(nickname: String, new_time: float):
	if nickname in times:
		times[nickname] = min(new_time, times[nickname])  # Keep best (lowest) time
	else:
		times[nickname] = new_time
	save_times()

func get_top_players(limit: int = 5) -> Array:
	var sorted = times.keys()
	sorted.sort_custom(func(a, b): return times[a] >= times[b])  # Ascending order
	var top := []
	for i in range(min(limit, sorted.size())):
		top.append({"nickname": sorted[i], "time": times[sorted[i]]})
	return top
