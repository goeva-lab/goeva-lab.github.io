from functools import partial
from multiprocessing import Pool
from pathlib import Path
from shutil import copytree
from subprocess import CompletedProcess, run
from sys import argv, stderr, stdout
from time import time_ns


def proc(inp: Path, out: Path, cache_bust: str) -> CompletedProcess:
    out = Path("./dist", *inp.parent.parts[1:], "index.html")
    out.parent.mkdir(parents=True, exist_ok=True)

    return run(
        [
            "typst",
            "--color",
            "always",
            "c",
            "--features=html",
            "--root",
            ".",
            "--input",
            f"cache_bust={cache_bust}",
            str(inp),
            str(out),
        ],
        capture_output=True,
    )


if __name__ == "__main__":
    out = Path(argv[1])
    cache_bust = argv[2] if len(argv) > 2 else str(time_ns())
    copytree("./static", out, dirs_exist_ok=True)
    code = 0
    with Pool() as p:
        for res in p.imap_unordered(
            partial(proc, out=out, cache_bust=cache_bust),
            Path("./src").glob("**/index.typ"),
        ):
            stdout.buffer.write(res.stdout)
            stdout.buffer.flush()
            stderr.buffer.write(res.stderr)
            stderr.buffer.flush()

            if res.returncode != 0:
                code = res.returncode

    quit(code)
