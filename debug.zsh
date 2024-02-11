#!/usr/bin/env zsh

nerd-dictation begin --output STDOUT --timeout 3 >prompt.txt ;
echo "start ollama" >time.txt ; date >>time.txt ;
ollama run qwen:0.5b <prompt.txt >answer.txt ;
# ollama run orca2:13b <prompt.txt >answer.txt ;
# ollama run dolphin-mistral <prompt.txt >answer.txt ;
echo "end ollama, start piper" >>time.txt ; date >>time.txt ;
cat answer.txt |
piper-tts --model ~/piper/en_US-libritts-high.onnx --speaker 41 --output_file tts.wav ;
echo "end piper" >>time.txt ; date >>time.txt ;
nvlc tts.wav