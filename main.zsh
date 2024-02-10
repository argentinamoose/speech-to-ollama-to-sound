#!/usr/bin/env zsh

nerd-dictation begin --output STDOUT --timeout 3 |\
ollama run qwen:0.5b |\
text2wave |\
lame - tts.mp3 ;\
nvlc tts.mp3