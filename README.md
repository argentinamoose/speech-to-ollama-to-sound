# speech-to-ollama-to-sound

Allows you to speak to an ollama model and get a response in audio played back

Still a work in progress, many new features to come

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
```
curl -fsSL https://ollama.com/install.sh | sh
```

### Post Install
Before running the script I recomend installing the ollama models you plan to use by running: 
```
ollama pull $modelname
```

## festival, lame, VLC
Use your package manager

# Aliasing the script
## Bash, Zsh
Add this line to your shell config with the proper path and suffix for bash or zsh
```sh
alias ollama-stt='$path/to/main.sh'
alias ollama-stt-debug='$path/to/debug.sh'
```

# Usage
For now the script has to be manually changed to use different models, but the default will be qwen:0.5b because it is the smallest model available and so it will run on most systems. In a future update I will add the ability to flag which model you want to use.

To run
```sh
ollama-stt
```
After running the command you can talk and after 3 seconds of not talking it will begin processing what you said.

Please note that the command will save a file title tts.mp3 in the directory you run the command in.