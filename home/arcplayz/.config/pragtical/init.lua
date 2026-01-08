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

lsp.add_server {
	name = "vscode-css-languageserver",
	language = "css/scss",
	file_patterns = {"%.css$", "%.scss$"},
	command = {"vscode-css-languageserver", "--stdio"}
}

lsp.add_server {
	name = "vscode-html-languageserver",
	language = "html",
	file_patterns = {"%.html$"},
	command = {"vscode-html-languageserver", "--stdio"}
}

lsp.add_server {
	name = "tsserver",
	language = "html",
	file_patterns = {"%.js$", "%.mjs$", "%.ts$", "%.mts$"},
	command = {"tsserver"}
}

