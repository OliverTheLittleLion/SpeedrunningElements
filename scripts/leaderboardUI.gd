extends Control

@onready var vbox = $LeaderboardVBox

func _ready():
	update_display()

func update_display():
	var top_players = Leaderboard.get_top_players(5)

	for i in range(vbox.get_child_count()):
		var label = vbox.get_child(i)
		if i < top_players.size():
			var player = top_players[i]
			label.text = "%d. %s - %s" % [i + 1, player["nickname"], format_time(player["time"])]
		else:
			label.text = "%d. ---" % (i + 1)

func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var secs = int(seconds) % 60
	var millis = int((seconds - int(seconds)) * 100)
	return "%02d:%02d.%02d" % [minutes, secs, millis]
Leaderboard.update_time("PlayerOne", 82.47)
Leaderboard.update_time("PlayerTwo", 75.89)
$LeaderboardUI.update_display()
LeaderboardUI (Control)
├── VBoxContainer (name: LeaderboardVBox)
│   ├── Label (name: Entry1)
│   ├── Label (name: Entry2)
│   ├── Label (name: Entry3)
│   ├── Label (name: Entry4)
│   ├── Label (name: Entry5)
└── Label (name: TitleLabel)  <-- Optional "Top Times" title
