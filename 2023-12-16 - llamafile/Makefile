.PHONY: all
all: \
	llava-main.llamafile \
	llava-server.llamafile \
	mistral-main.llamafile \
	llamafile \
#	rocket.gguf

llama-main.llamafile:
	curl -Lo $@ https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4-server.llamafile?download=true
	chmod +x $@

llama-server.llamafile:
	curl -Lo $@ https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4-main.llamafile
	chmod +x $@

mistral-main.llamafile:
	curl -Lo $@ https://huggingface.co/jartine/mistral-7b.llamafile/resolve/main/mistral-7b-instruct-v0.1-Q4_K_M-main.llamafile?download=true
	chmod +x $@

rocket.gguf:
	curl -Lo $@ https://huggingface.co/TheBloke/rocket-3B-GGUF/resolve/main/rocket-3b.Q3_K_M.gguf?download=true

llamafile:
	curl -Lo $@ https://github.com/Mozilla-Ocho/llamafile/releases/download/0.4/llamafile-0.4
	chmod +x $@

.PHONY: clean
clean:
	rm -f *.llamafile *.gguf
