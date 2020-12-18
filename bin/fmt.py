import sys
from pathlib import Path

from polib import pofile


def main(directory):
    source_directory = Path(directory)
    if source_directory.is_dir():
        for source in source_directory.glob("*.po"):
            target = source.with_suffix(".mo")
            p = pofile(str(source))
            p.save_as_mofile(str(target))


if __name__ == '__main__':
    main(sys.argv[1])
