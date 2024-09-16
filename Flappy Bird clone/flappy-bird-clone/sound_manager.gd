extends Node

var being_played: Array[AudioStreamMP3] = []

func play(sound_file: AudioStreamMP3):
	if being_played.has(sound_file):
		return
	being_played.append(sound_file)
	var new_playback = sound_file.instantiate_playback()
	new_playback.play()
