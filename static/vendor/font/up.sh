#!/bin/bash

set -euxo pipefail
command -v curl unzip uv find jq

curl -sL "$(curl -sL 'api.github.com/repos/be5invis/iosevka/releases/latest' | jq -r '.assets | map(select(.name | startswith("PkgWebFont-Iosevka-"))) | .[0].browser_download_url')" -o './iosevka/dl.zip'
unzip './iosevka/dl.zip' 'TTF/*' -d './iosevka/'
uv run --with 'fonttools,brotli' find './iosevka/TTF/' -name '*.ttf' -execdir sh -c 'pyftsubset --unicodes='\''U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD'\'' "$0" --flavor=woff2 --output-file="$(basename "${0}" '\''.ttf'\'').woff2" && pyftsubset --unicodes='\''U+0100-02BA,U+02BD-02C5,U+02C7-02CC,U+02CE-02D7,U+02DD-02FF,U+0304,U+0308,U+0329,U+1D00-1DBF,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20C0,U+2113,U+2C60-2C7F,U+A720-A7FF'\'' "$0" --flavor=woff2 --output-file="$(basename "${0}" '\''.ttf'\'')-ext.woff2"' '{}' \;
mv './iosevka/TTF/'*'.woff2' './iosevka'
rm -r './iosevka/TTF' './iosevka/dl.zip'

curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblemono/v8/tss4AoFBci4C4gvhPXrt3wjT1MqSzhA4t7IIcncBiwKthFw.woff2' -o 'ahm/ahm-n.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblemono/v8/tss6AoFBci4C4gvhPXrt3wjT1MqSzhA4t7IIcncBiwKotF6JGQ.woff2' -o 'ahm/ahm-i.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblemono/v8/tss4AoFBci4C4gvhPXrt3wjT1MqSzhA4t7IIcncBiwKjhFyRHQ.woff2' -o 'ahm/ahm-n-ext.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblemono/v8/tss6AoFBci4C4gvhPXrt3wjT1MqSzhA4t7IIcncBiwKotFCJGR0i.woff2' -o 'ahm/ahm-i-ext.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblenext/v7/NaPNcYPdHfdVxJw0IfIP0lvYFqijb-UxCtm5_wdGseiJn3o.woff2' -o 'ahn/ahn-n.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblenext/v7/NaPPcYPdHfdVxJw0IfIP0lvYFqijb-UxCtm5_wdGseiMr3i-oQ.woff2' -o 'ahn/ahn-i.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblenext/v7/NaPNcYPdHfdVxJw0IfIP0lvYFqijb-UxCtm5_wdGseiHn3qmpQ.woff2' -o 'ahn/ahn-n-ext.woff2'
curl -sL 'https://fonts.gstatic.com/s/atkinsonhyperlegiblenext/v7/NaPPcYPdHfdVxJw0IfIP0lvYFqijb-UxCtm5_wdGseiMr3a-oXZ-.woff2' -o 'ahn/ahn-i-ext.woff2'
