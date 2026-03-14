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
	name = "vala-language-server",
	language = "vala",
	file_patterns = {"%.vala$"},
	command = {"vala-language-server"}
}

lsp.add_server {
	name = "flutter-analyze",
	language = "dart",
	file_patterns = {"%.dart$"},
	command = {"fvm", "flutter", "analyze", "--lsp"}
}

