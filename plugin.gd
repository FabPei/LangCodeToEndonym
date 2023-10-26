@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("LangCodeToEndonym", "res://addons/LangCodeToEndonym/LangCodeToEndonym.tscn")


func _exit_tree():
	remove_autoload_singleton("LangCodeToEndonym")
