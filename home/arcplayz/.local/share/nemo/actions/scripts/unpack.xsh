#!/usr/bin/env xonsh

$RAISE_SUBPROC_ERROR = True

from pathlib import Path
from tempfile import mkdtemp
from shutil import rmtree

for archive in $ARGS[1:]:
	archive = Path(archive)
	parent = archive.parent
	target = Path(mkdtemp(prefix = 'archive.', dir = parent))

	try:
		7z x @(archive) -o@(target)
	except:
		rmtree(target)
	else:
		contents = tuple(target.iterdir())

		if len(contents) == 1:
			mv @(contents[0]) @(parent)
			rmtree(target)
		else:
			target.rename(parent / archive.stem)
