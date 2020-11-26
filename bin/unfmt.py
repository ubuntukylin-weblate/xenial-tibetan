from pathlib import Path

from polib import mofile
from typer import run


def main(directory: str):
    source_directory = Path(directory)
    if source_directory.is_dir():
        for source in source_directory.glob("*.mo"):
            target = source.with_suffix(".po")
            m = mofile(str(source))
            m.save_as_pofile(str(target))


if __name__ == '__main__':
    run(main)
