local lsp = require "plugins.lsp"

lsp.add_server {
	name = "bash-language-server",
	language = "bash",
	file_patterns = {"%.sh$", "%.bash$"},
	command = {"bash-language-server", "start"}
}

lsp.add_server {
	name = "ty",
	language = "python",
	file_patterns = {"%.py$", "%.xsh$"},
	command = {"ty", "server"}
}

lsp.add_server {
	name = "nimlangserver",
	language = "nim",
	file_patterns = {"%.nim$"},
	command = {"nimlangserver"}
}

lsp.add_server {
	name = "clangd",
	language = "c/cpp",
	file_patterns = {"%.c$", "%.h$", "%.cpp$", "%.cc$", "%.cxx$", "%.hpp$", "%.hh$", "%.hxx$"},
	command = {"clangd"}
}

lsp.add_server {
	name = "rust-analyzer",
	language = "rust",
	file_patterns = {"%.rs$"},
	command = {"rust-analyzer"}
}

lsp.add_server {
	name = "zls",
	language = "zig",
	file_patterns = {"%.zig$"},
	command = {"zls"}
}

lsp.add_server {
	name = "mesonlsp",
	language = "meson",
	file_patterns = {"meson.build"},
	command = {"mesonlsp", "--lsp"}
}

lsp.add_server {
	name = "flutter-analyze",
	language = "dart",
	file_patterns = {"%.dart$"},
	command = {"fvm", "flutter", "analyze", "--lsp"}
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
	file_patterns = {"%.js$", "%.ts$"},
	command = {"tsserver"}
}

