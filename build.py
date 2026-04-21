from shutil import copytree
from multiprocessing import Pool
from pathlib import Path
from subprocess import run, CompletedProcess
from sys import stdout, stderr, argv
from functools import partial


def proc(inp: Path, out: Path) -> CompletedProcess:
    out = Path("./dist", *inp.parent.parts[1:], "index.html")
    out.parent.mkdir(parents=True, exist_ok=True)
    return run(["typst", "--color", "always", "c", "--features=html", "--root", ".", str(inp), str(out)], capture_output=True)


if __name__ == "__main__":
    out = Path(argv[1])
    copytree("./static", out, dirs_exist_ok=True)
    code = 0
    with Pool() as p:
        for res in p.imap_unordered(
            partial(proc, out=out),
            Path("./src").glob("**/index.typ"),
        ):
            stdout.buffer.write(res.stdout)
            stdout.buffer.flush()
            stderr.buffer.write(res.stderr)
            stderr.buffer.flush()

            if res.returncode != 0:
                code = res.returncode

    quit(code)
