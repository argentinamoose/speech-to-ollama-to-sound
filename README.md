# speech-to-ollama-to-sound

Allows you to speak to an ollama model and get a response in audio played back

[Installation](https://github.com/argentinamoose/speech-to-ollama-to-sound?tab=readme-ov-file#installation)

[Usage](https://github.com/argentinamoose/speech-to-ollama-to-sound?tab=readme-ov-file#usage)

# Installation
There are many tools that this script relies on and I am giving simple instructions on how to install them. Please refer to their linked githubs for more info.

## [Nerd Dictation](https://github.com/ideasman42/nerd-dictation)

```sh
pip3 install vosk
```
*If pip3 install doesn't work, you may need to use your distribution's package manager instead*
```sh
git clone https://github.com/ideasman42/nerd-dictation.git
````
```sh
cd nerd-dictation
``` 
```sh
wget https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip
```
```sh
unzip vosk-model-small-en-us-0.15.zip
```
*most distributions without unzip will have bsdtar which can be used like so*
```sh
bsdtar xf vosk-model-small-en-us-0.15.zip
```
```sh
mv vosk-model-small-en-us-0.15 model
```
### Post Install
Finally you want to add nerd-dictation to your shell's environment variables. For bash and zsh the following will work.
```sh
alias nerd-dictation='~/nerd-dictation/nerd-dictation'
```

## [Ollama](https://github.com/ollama/ollama)

### macOS
[Download](https://ollama.com/download/Ollama-darwin.zip)

### Linux & WSL2
```sh
curl -fsSL https://ollama.com/install.sh | sh
```

### Post Install
Before running the script I recomend installing the ollama models you plan to use by running: 
```sh
ollama pull $modelname
```

## [Piper-TTS](https://github.com/rhasspy/piper)
Depending on your distribution it may be in your package manager. For example it is in the aur under piper-tts-bin. If it is not, [follow the directions here](https://github.com/rhasspy/piper?tab=readme-ov-file#installation)

### Post Install
```sh
mkdir ~/piper
```
```sh
cd ~/piper
```
download the .onnx and the .onnx.json from [this link](https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0/en/en_US/libritts/high), and put the files in your ~/piper directory

*you can use any model from [here](https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0), but I recomend the one above*
```sh
echo "hello world" | piper-tts --model ~/piper/en_US-libritts-high.onnx --speaker 41 --output_file tts.wav
```
```sh
nvlc tts.wav
```
If you hear the sound you're good to go

*If you manually installed the package make sure that the command is aliased as piper-tts in your shell's env file*

## [VLC](https://www.videolan.org/)
Use your package manager

# Sourcing the script
## Bash, Zsh
Add this line to your shell's rc with the proper path and suffix for bash or zsh
```sh
source $path/to/main
```

# Usage
For now the script has to be manually changed to use different models, but the default will be qwen:0.5b because it is the smallest model available and so it will run on most systems. In a future update I will add the ability to flag which model you want to use.

The script will take 4 parameters for user customization
1. Model name for Ollama
2. Model file location for Piper
3. Speaker for Piper
4. Directory for tts.wav to be save (please end without /)

My recommended setup as an example
```sh
ollama-stt qwen:0.5b ~/piper/en_US-libritts-high.onnx 41 ~/piper
```
After running the command you can talk and after 3 seconds of not talking it will begin processing what you said. The program will save a tts.wav file in the directory you tell it to. If you would like to save it for later please move it to another location because the program will overwrite every time it runs. Using the debug command (ollam-stt-debug) will save text files as well if you would like those.
