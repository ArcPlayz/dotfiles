local lsp = require "plugins.lsp"

lsp.add_server {
	name = "ty",
	language = "python",
	file_patterns = {"%.py$", "%.xsh$"},
	command = {"ty", "server"}
}

lsp.add_server {
	name = "mesonlsp",
	language = "meson",
	file_patterns = {"meson.build"},
	command = {"mesonlsp", "--lsp"}
}

lsp.add_server {
	name = "clangd",
	language = "c/c++",
	file_patterns = {"%.c$", "%.cc$", "%.cpp$", "%.cxx$", "%.h$", "%.hh$", "%.hpp$", "%.hxx$"},
	command = {"clangd"}
}

lsp.add_server {
	name = "bash-language-server",
	language = "bash",
	file_patterns = {"%.sh$", "%.bash$"},
	command = {"bash-language-server", "start"}
}

