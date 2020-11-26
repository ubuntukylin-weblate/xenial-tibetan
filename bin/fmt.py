from pathlib import Path

from polib import pofile
from typer import run


def main(directory: str):
    source_directory = Path(directory)
    if source_directory.is_dir():
        for source in source_directory.glob("*.po"):
            target = source.with_suffix(".mo")
            p = pofile(str(source))
            p.save_as_mofile(str(target))


if __name__ == '__main__':
    run(main)
