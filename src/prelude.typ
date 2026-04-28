#let entry = (img, swap: false, ..args, txt) => context {
  let img_m = measure(image("/static/" + img))
  html.div(
    {
      html.img(
        src: img,
        height: int(img_m.height.mm()),
        width: int(img_m.width.mm()),
        ..args,
      )
      html.div(txt, class: "entry-flex-in")
    },
    class: "entry-flex-out" + if swap { " entry-swap-ord" },
  )
}

#let w = e => {
  html.html({
    html.head({
      html.title[Goeva Lab #sym.bar.v #context { document.title }]
      html.meta(charset: "utf-8")
      html.meta(name: "viewport", content: "width=device-width, initial-scale=1")
      html.link(rel: "icon", type: "image/png", href: "/favicon/16x16.png")

      ("iosevka/Iosevka-Heavy", "ahn/ahn-n")
        .map(font_id => html.link(
          rel: "prefetch",
          ..("as": "font"),
          href: "/vendor/font/" + font_id + ".woff2",
          type: "font/woff2",
          crossorigin: "anonymous",
        ))
        .join()

      ("main.css": (), "font.css": (), "entry.css": (), "theme.css": (id: "css-theme-pref"))
        .pairs()
        .map(((sheet, args)) => html.link(rel: "stylesheet", href: "/css/" + sheet, ..args))
        .join()

      html.script(defer: true, src: "/js/theme.js")
    })
    html.body(html.main({
      html.header({
        title[Goeva Lab]
        let nle = (lnk, e) => html.li(context { if lower(document.title) == lower(e) { e } else { link(lnk, e) } })

        html.nav(
          html.ul({
            // `change_button` and `change_theme` functions defined in `/static/js/theme.js` to allow for theme toggle
            html.li(style: "display:none;", html.elem("button", attrs: (id: "button-dark-switch"))[🌑])
            html.li(style: "display:none;", html.elem("button", attrs: (id: "button-light-switch"))[🔆])
            nle("/")[Home]
            nle("/research/")[Research]
            nle("/team/")[Team]
          }),
        )
      })
      html.hr()

      e
    }))
  })
}
