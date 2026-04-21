# goeva lab website

[`typst`](https://github.com/typst/typst?tab=readme-ov-file#installation)-based lab website

## layout

- [`./src`](./src): typst source files for individual pages, sources for pages should be kept at `./src/<PAGE_URL>/index.typ`
- [`./static`](./static): static content requiring no build step (e.g. css, images, etc.), contents should be copied into the build directory directly
  - [`./static/vendor`](./static/vendor): designed to hold files produced by other authors that are vendored in accordance w/ existing copyright/licensing terms

## development

### downloading fonts

the site uses two different fonts ([`Iosevka`](https://typeof.net/Iosevka/) and [`Atkinson Hyperlegible Next`](https://www.brailleinstitute.org/freefont/)) that are vendored directly instead of relying on 3rd party services.

a script is provided ([here](./static/vendor/font/up.sh)) which can download the requisite fonts to the expected locations.
it requires binaries for [`curl`](https://curl.se/download.html), [`uv`](https://docs.astral.sh/uv/getting-started/installation/), [`unzip`](https://infozip.sourceforge.net/UnZip.html#Downloads), [`jq`](https://jqlang.org/download/), and `find` to be available, and can be utilized as follows:

```bash
cd './static/vendor/font'
bash './up.sh'
```

### building

building the site requires having installed [`typst`](https://github.com/typst/typst?tab=readme-ov-file#installation).

a simple ([`python`](https://www.python.org/downloads/)) build script is provided ([here](./build.py)) and can be utilized as follows to generate a website build in a subdirectory named `./dist`:

```bash
python -Wignore './build.py' './dist'
```

this can be combined with the [`watchexec`](https://github.com/watchexec/watchexec?tab=readme-ov-file#install) tool to have a live-reloading build served at [`localhost:8888`](http://localhost:8888) as follows:

```bash
watchexec -w src -w static -r 'python -Wignore build.py ./dist && python -m http.server -d dist -b localhost 8888'
```

## notes

[`./src/prelude.typ`](./src/prelude.typ) contains the core of page layout / HTML-relevant logic.
main relevant item is [`w`](./src/prelude.typ#L17-L63), which should be used as a global show rule by all page-generating files, via a top-level statement such as:

```typst
#import "/src/prelude.typ": w; #show: w
```

page-generating files should generally not reference HTML-aware functions directly, but use wrappers written in other files (e.g. [`entry`](./src/prelude.typ#L1-L15) in [`./src/prelude.typ`](./src/prelude.typ)).

## licensing

licensing terms for files are given by the closest `LICENSE.*` file present in a file's parent folder hierarchy (this is relevant to some files under [`./static/vendor`](./static/vendor), which are derived from other projects, and thus have different licensing from the rest of this project).

for all content in this repo outside of [`./static/vendor`](./static/vendor), licensing terms are described in [`./LICENSE`](./LICENSE).
