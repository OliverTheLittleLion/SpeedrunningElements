extends Control

const ALPHABET := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var players := {
	1: {
		"selected_letters": ['A', 'A'],
		"alphabet_index": [0, 0],
		"current_index": 0,
		"label_node": null,
		"input_cooldown": 0.2,
		"timer": 0.0,
		"move_up_action": "p1_up",
		"move_down_action": "p1_down",
		"move_left_action": "p1_left",
		"move_right_action": "p1_right",
		"confirm_action": "p1_start",
		"ready": false  # Player 1 readiness status
	},
	2: {
		"selected_letters": ['A', 'A'],
		"alphabet_index": [0, 0],
		"current_index": 0,
		"label_node": null,
		"input_cooldown": 0.2,
		"timer": 0.0,
		"move_up_action": "p2_up",
		"move_down_action": "p2_down",
		"move_left_action": "p2_left",
		"move_right_action": "p2_right",
		"confirm_action": "p2_start",
		"ready": false  # Player 2 readiness status
	}
}

@onready var label1 = $Player1Nickname/Label
@onready var label2 = $Player2Nickname/Label
@onready var ready_label = $ReadyStatus  # Label to show Ready/Not Ready status

func _ready():
	players[1]["label_node"] = label1
	players[2]["label_node"] = label2
	_update_all_labels()


	# Check if both players are ready
	if players[1]["ready"] and players[2]["ready"]:
		ready_label.text = "Both players are ready! Press 'Start' to begin."
	else:
		ready_label.text = "Waiting for both players to be ready..."

func _handle_input_for_player(player_id):
	# Get the custom input actions for each player
	var move_up_action = players[player_id]["move_up_action"]
	var move_down_action = players[player_id]["move_down_action"]
	var move_left_action = players[player_id]["move_left_action"]
	var move_right_action = players[player_id]["move_right_action"]
	var confirm_action = players[player_id]["confirm_action"]

	# Vertical movement (change letter)
	if Input.is_action_pressed(move_up_action):
		_change_letter(player_id, 1)
	elif Input.is_action_pressed(move_down_action):
		_change_letter(player_id, -1)

	# Horizontal movement (change letter position)
	if Input.is_action_pressed(move_right_action):
		players[player_id]["current_index"] = min(players[player_id]["current_index"] + 1, 1)
	elif Input.is_action_pressed(move_left_action):
		players[player_id]["current_index"] = max(players[player_id]["current_index"] - 1, 0)


	# Toggle ready state (press 'Start' to toggle readiness)
	if Input.is_action_pressed("p1_start") and Input.is_action_pressed("p2_start"):
		get_tree().change_scene_to_file("res://sceens/level.tscn")

func _change_letter(player_id, direction):
	var idx = players[player_id]["current_index"]
	var alphabet_idx = players[player_id]["alphabet_index"]
	alphabet_idx[idx] = (alphabet_idx[idx] + direction + ALPHABET.length()) % ALPHABET.length()
	players[player_id]["selected_letters"][idx] = ALPHABET[alphabet_idx[idx]]
	_update_label(player_id)

func _update_label(player_id):
	var label = players[player_id]["label_node"]
	var letters = players[player_id]["selected_letters"]
	label.text = "P%d Nickname: %s%s" % [player_id, letters[0], letters[1]]

func _update_all_labels():
	for id in players.keys():
		_update_label(id)
