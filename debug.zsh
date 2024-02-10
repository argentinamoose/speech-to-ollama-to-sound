#!/usr/bin/env zsh

nerd-dictation begin --output STDOUT --timeout 3 >prompt.txt ;\
date >time.txt ;\
ollama run qwen:0.5b <prompt.txt >answer.txt ;\
# ollama run orca2:13b <prompt.txt >answer.txt ;\
# ollama run dolphin-mistral <prompt.txt >answer.txt ;\
date >>time.txt ;\
text2wave <answer.txt |\
lame - tts.mp3 ;\
nvlc tts.mp3