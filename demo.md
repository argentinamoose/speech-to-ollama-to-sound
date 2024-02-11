# An example of the inner workings of the program

## Speech to text
First, the user speaks into their microphone and it is transcribed for the ollama model to use.
```
what is a large language model
```

## Ollama responds
The language model will take the input and respond.
```
A large language model is a type of artificial intelligence that can process and generate natural language, such as speech or text. A large language model usually has a very big vocabulary, or the set of words it can recognize, and a complex grammar system, or the rules that govern how words can be combined and modified. A large language model can perform various tasks with natural language, such as translation, summarization, question answering, sentiment analysis, and text generation. Some examples of large language models are GPT-3, BERT, and XLNet.
```

## Text to speech model
Finally the text to speech model puts out a .wav file from reading the response.