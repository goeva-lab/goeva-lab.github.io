#set document(title: [Research])
#import "/src/prelude.typ": entry, w; #show: w;
#html.div(hidden: true, id: "bibliography-hidden", bibliography(
  "bib.yml",
  style: "apa",
))
#show cite: it => {
  show "Goeva, A.": e => strong(smallcaps(emph(e)))
  show link: e => { if (type(e.dest) == location) { e.body } else { e } }
  it
}
#let ctl = (..tl, fn: enum.with(reversed: true)) => fn(..tl.pos().map(cite.with(form: "full")))

= Themes

#{
  let entry = entry.with(style: "max-width:400px;")
  (
    entry("/vendor/img/hidden.png", swap: true)[
      == Detecting subtle and heterogeneous biological signals
      Many disease-relevant effects are present only in subsets of cells or are masked by dominant sources of variation, making them difficult to detect with standard approaches.
      We develop statistical and machine learning methods to identify weak, sparse, and heterogeneous signals in high-dimensional biological data.
    ],
    entry("/vendor/img/spatial.png")[
      == Interpretable models for single-cell and spatial genomics
      We design interpretable computational frameworks that integrate prior biological knowledge with machine learning to model cellular identity, state, and spatial organization.
      A central goal is to produce models whose outputs can be directly linked to biological mechanisms and validated experimentally.
    ],
    entry("/vendor/img/cell-cell interaction.png", swap: true)[
      == Modeling cellular interactions and tissue organization
      We develop methods to understand how cells interact within tissues, including frameworks for studying cell–cell communication and the emergence of coordinated behavior across cell populations.
      We are particularly interested in moving beyond cell-centric views toward modeling interactions as fundamental units of biological systems.
    ],
    entry("/vendor/img/prior.png")[
      == Statistical frameworks for robust biological discovery
      We study how data structure, noise, and experimental design shape what can be reliably detected in biological systems.
      Our work emphasizes uncertainty, identifiability, and detectability, with the goal of improving the reliability and reproducibility of discoveries in modern genomics.
    ],
  ).join(html.br())
}

= Source availability

Source code for all lab projects (including this #link("https://github.com/goeva-lab/goeva-lab.github.io")[website]) is hosted on GitHub, under the #link("https://github.com/goeva-lab")[goeva-lab] organization!

= Selected Work

For a complete list of published works, please see Dr. Goeva's #link("https://scholar.google.com/citations?user=-AjMa60AAAAJ")[Google Scholar].

== Preprints

#ctl(<Afanasiev_2026>, fn: list)

== Peer-reviewed Publications

#ctl(
  <Campbell_2025>,
  <Goeva_2024>,
  <Yang_2024>,
  <Dolan_2023>,
  <Adler_2023>,
  <Cable_2021>,
  <Goeva_2020>,
  <Goeva_2019>,
  <Kramer_2019>,
  <Rodriques_2019>,
  <Kunin_2019>,
  <Saunders_2018>,
  <Kramer_2018>,
  <Goeva_2014>,
)

== Invited Discussions, Commentaries, and Explainers

#ctl(
  <Blumenthal_2021>,
  <Goeva_2021a>,
  <Frost_2021>,
  <Goeva_2021b>,
  <Frost_2020>,
  <Goeva_2016>,
)

