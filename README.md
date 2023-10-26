# LangCodeToEndonym
 
A ISO 639 to Endonym converter for the [Godot Engine](https://godotengine.org/).

NOTE: This was only tested in Godot 4.1, but probably works in >3.0 too.

## What is this?

Selecting the correct language can cause a challenge for a player. The app could falsely recognize the users main language and thus set a language which is not comprehendable for the user, e.g. non roman characters.

Thus, instead of creating language options such as:
"Chinese" "English" "French" "German" "Italian" "Spanish"

it should look like that:
"中文" "English" "français" "italiano" "español"

## Features

- Get ISO 639 code from a endonym
- Get endonym from a ISO 639 code

## Installation

Copy the `addons/LangCodeToEndonym` directory into your `res://addons/` directory.

Enable `LangCodeToEndonym` in project plugins.

## Documentation

This addon includes each ISO 639 subcode as a child node. These are used to access a large dict with the codes and edonyms. 
Call "LangCodeToEndonym" and its subsequent functions "get_endonym_from_iso_639_code(code: String)" or "get_iso_639_code_from_endonym(endonym: String)" to get either the endonym or the ISO 639 code.

## Todo

- complete ISO 639-3 list
- add methods for receiving a specific subcode of ISO 639
- C# implementation
- option to access more language options from a dict

## License

Licensed under the MIT license, see `LICENSE` for more information. All information regarding ISO 639 and their endonyms is taken from the respective Wikipedia pages which strangely vary in their depth depending on the Wiki's page language. See for further information on ISO 639 the official ISO list from [ISO](https://www.iso.org/obp/ui/#search).
