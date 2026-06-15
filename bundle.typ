#let expt = p => document(p + "index.html", include "/src/" + p + "index.typ")
#let expa = p => asset(p, read("static/" + p, encoding: none))

#expt("")
#expt("research/")
#expt("team/")

#expa("favicon/16x16.png")

#expa("vendor/font/iosevka/Iosevka-Heavy.woff2")
#expa("vendor/font/iosevka/LICENSE.md")
#expa("vendor/font/ahn/ahn-n.woff2")
#expa("vendor/font/ahn/ahn-i.woff2")
#expa("vendor/font/ahn/LICENSE.txt")

#expa("css/main.css")
#expa("css/font.css")
#expa("css/entry.css")
#expa("css/light.css")
#expa("css/dark.css")

#expa("js/theme.js")

#expa("vendor/img/hidden.png")
#expa("vendor/img/prior.png")
#expa("vendor/img/cell-cell interaction.png")
#expa("vendor/img/cross-condition comparison.png")
#expa("vendor/img/spatial.png")
#expa("vendor/img/LICENSE")

#expa("img/headshots/eafana.jpg")
#expa("img/headshots/arupan.jpg")
#expa("img/headshots/agoeva.png")

#expa("CNAME")

#asset("LICENSE", read("LICENSE", encoding: none))
