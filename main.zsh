#!/usr/bin/env zsh

nerd-dictation begin --output STDOUT --timeout 3 |
ollama run qwen:0.5b |
piper-tts --model ~/piper/en_US-libritts-high.onnx --speaker 41 --output_file ~/piper/tts.wav;
nvlc ~/piper/tts.wav