local core = require "core"

local config = require "core.config"

config.indent_size = 4
config.tab_type = "hard"
config.file_size_limit = 9999999999999
config.blink_period = 0.25

local syntax = require "core.syntax"

syntax.add {
	files = { "%.xsh$" },
	comment = '#',
	patterns = {},
	symbols = {},
}

local lsp = require "plugins.lsp"

lsp.add_server {
	language = "python",
	file_patterns = {"%.py$", "%.xsh$"},
	name = "python-lsp-server",
	command = {"bash", "-c", "source .venv/bin/activate && exec pylsp"},
}

lsp.add_server {
	language = "c/cpp",
	file_patterns = {"%.c$", "%.h$", "%.cpp$", "%.hpp$"},
	name = "clangd",
	command = {"clangd"},
}

lsp.add_server {
	language = "meson",
	file_patterns = {"meson.build"},
	name = "mesonlsp",
	command = {"mesonlsp", "--lsp"},
}

lsp.add_server {
	language = "bash",
	file_patterns = {"%.sh"},
	name = "bash-language-server",
	command = {"bash-language-server", "start"},
}

lsp.add_server {
	language = "javascript",
	file_patterns = {"%.js"},
	name = "deno-lsp",
	command = {"deno", "lsp"},
}

