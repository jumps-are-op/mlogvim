VIMRUNTIME=

install:
	@[ '${VIMRUNTIME}' ] || { echo "Please specify VIMRUNTIME (e.g. make VIMRUNTIME=PATH/TO/VIM/RUNTIME/DIRECTORY)"; exit 1;}
	@cp -r -- vim-syntax/*/ '${VIMRUNTIME}'
