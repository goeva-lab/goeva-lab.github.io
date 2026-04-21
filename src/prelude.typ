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
      html.meta(
        name: "viewport",
        content: "width=device-width, initial-scale=1",
      )
      html.link(rel: "icon", type: "image/png", href: "/favicon/16x16.png")
      for font_id in ("iosevka/Iosevka-Heavy", "ahn/ahn-n") {
        html.link(
          rel: "prefetch",
          ..("as": "font"),
          href: "/vendor/font/" + font_id + ".woff2",
          type: "font/woff2",
          crossorigin: "anonymous",
        )
      }
      for sheet in ("main.css", "font.css", "entry.css") {
        html.link(rel: "stylesheet", href: "/css/" + sheet)
      }
    })
    html.body(html.main({
      html.header({
        title[Goeva Lab]
        let nle = (lnk, e) => context {
          if lower(document.title) == lower(e) {
            e
          } else {
            link(lnk, e)
          }
        }

        html.nav(list(
          nle("/")[Home],
          nle("/research/")[Research],
          nle("/team/")[Team],
          spacing: 0em,
        ))
      })
      html.hr()

      e
    }))
  })
}
