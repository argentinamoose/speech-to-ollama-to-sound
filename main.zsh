#!/usr/bin/env zsh

function ollama-stt {
    nerd-dictation begin --output STDOUT --timeout 3 |
    ollama run $1 |
    piper-tts --model $2 --speaker $3 --output_file $4/tts.wav;
    nvlc $4/tts.wav;
}

function ollama-stt-debug {
    nerd-dictation begin --output STDOUT --timeout 3 >$4/prompt.txt ;
    echo "start ollama" >$4/time.txt ; date >>$4/time.txt ;
    ollama run $1 <$4/prompt.txt >$4/answer.txt ;
    echo "end ollama, start piper" >>$4/time.txt ; date >>$4/time.txt ;
    cat $4/answer.txt |
    piper-tts --model $2 --speaker $3 --output_file $4/tts.wav ;
    echo "end piper" >>$4/time.txt ; date >>$4/time.txt ;
    nvlc $4/tts.wav;
}