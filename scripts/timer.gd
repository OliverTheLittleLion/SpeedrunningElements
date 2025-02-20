extends Control
@onready var rich_text_label : RichTextLabel = $RichTextLabel
var timeL = 54000
func _ready():
    if timeL > 0:
    if Input.is_key_pressed(Key.A):
        timeL -=1
        rich_text_label.bbcode_text = "TIME LEFT: %d" % timeL