/// scrSetMelodyLayersVolume(volume, overTimeInMS)

var volume = argument0;
var overTimeInMS = argument1;

audio_sound_gain(objMusicControl.sineWaveLayer, volume, overTimeInMS);
audio_sound_gain(objMusicControl.triangleWaveLayer, volume, overTimeInMS);
audio_sound_gain(objMusicControl.squareWaveLayer, volume, overTimeInMS);
