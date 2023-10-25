"""Language code to endonym

This module returns the correct ISO 639 (1,2,3) code for a given endonym.
Also, it returns the endonym for a given ISO 639 code.
"""
extends Node2D

# Load all nodes with the lists

var iso_639_1_list = load("res://addons/LangCodeToEndonym/iso_639_1_list.gd")
var iso_639_2_list = preload("res://addons/LangCodeToEndonym/iso_639_2_list.gd")
var iso_639_3_list = preload("res://addons/LangCodeToEndonym/iso_639_3_list.gd")

var iso_639_1_endonyms_dict  # = iso_639_1_list.get_iso_639_1_codes_endonyms()
var iso_639_2_endonyms_dict #= iso_639_1_list.get_iso_639_1_codes_endonyms()
var iso_639_3_endonyms_dict #= iso_639_3_list.get_iso_639_3_codes_endonyms()

# Declare the "reversed" dicts of the previous ones
var rev_iso_639_1_endonyms_dict = {}
var rev_iso_639_2_endonyms_dict = {}
var rev_iso_639_3_endonyms_dict = {}

# On _ready the reversed dicts are created
func _ready():
	# Assign the dicts with the iso code as a key 
	iso_639_1_endonyms_dict = iso_639_1_list.get_iso_639_1_codes_endonyms()
	iso_639_2_endonyms_dict = iso_639_2_list.get_iso_639_2_codes_endonyms()
	iso_639_3_endonyms_dict = iso_639_3_list.get_iso_639_3_codes_endonyms()
	
	for code in iso_639_1_endonyms_dict:
		rev_iso_639_1_endonyms_dict[iso_639_1_endonyms_dict[code]] = code
	pass
	for code in iso_639_2_endonyms_dict:
		rev_iso_639_2_endonyms_dict[iso_639_2_endonyms_dict[code]] = code
	pass
	for code in iso_639_3_endonyms_dict:
		rev_iso_639_3_endonyms_dict[iso_639_3_endonyms_dict[code]] = code
	pass

# Returns the endonym as a String given a iso 639 is provided.
func get_endonym_from_iso_639_code(iso_639_code: String):
	#print(iso_639_code.length())
	match iso_639_code.length():
		2:
			var result = str(iso_639_1_endonyms_dict.get(iso_639_code))
			if result == "" or result == null or result == "<null>":
				printerr("Given code is not found.\
							Are you sure that this is a ISO 639 code?")
			else:
				return result
		3:
			var result = str(iso_639_2_endonyms_dict.get(iso_639_code))
			
			if result == "" or result == null or result == "<null>":
				result = str(iso_639_3_endonyms_dict.get(iso_639_code))
				if result == "" or result == null or result == "<null>":
					printerr("Given code is not found.\
								Are you sure that this is a ISO 639 code?")
				else:
					return result
			else:
				return result
		0:
			printerr("Given code length is 0.\
						Are you sure that this is a ISO 639 code?")
		_: 
			printerr("Given code length is larger than 3.\
						Are you sure that this is a ISO 639 code?")

# Returns the iso 639 code as a String, given an endonym.
# Due some endonyms having more than 1 endonym, the String is searched
# in String.
func get_iso_639_code_from_endonym(endonym_hint: String):
	for endonym in rev_iso_639_1_endonyms_dict.keys():
		if endonym_hint in endonym:
			return str(rev_iso_639_1_endonyms_dict[endonym])
	for endonym in rev_iso_639_2_endonyms_dict.keys():
		if endonym_hint in endonym:
			return str(rev_iso_639_2_endonyms_dict[endonym])
	for endonym in rev_iso_639_3_endonyms_dict.keys():
		if endonym_hint in endonym:
			return str(rev_iso_639_3_endonyms_dict[endonym])
	push_warning("No iso code was found.
					Please check your endonym.")
