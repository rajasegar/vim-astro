.PHONY: test

test: vader.vim
	nvim --headless -u test/vimrc -c 'Vader! test/*.vader'

vader.vim:
	git clone https://github.com/junegunn/vader.vim.git
