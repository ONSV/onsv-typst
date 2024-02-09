#include "01-folha_de_rosto.typ"

#set page(
  paper: "a4",
  margin: (x: 25mm, y: 30mm),
  footer: [
    #stack(
      spacing: 0.5em,
      line(length: 100%, stroke: (paint: rgb("#333333"), thickness: 0.5pt)),
      block(
        [
          #set text(10pt, rgb("#333333"))
          _onsv.org.br_
          #h(1fr)
          #counter(page).display("1")
        ]
      )
    )
  ],
  header: [
    #stack(
      spacing: 0.5em,
      grid(
        columns: (1fr, 1fr, 1fr),
        [
          #set align(left)
          #image("/icon/onsv_logo_header.png", width: 75%)
        ],
        " ",
        [
          #set align(right)
          #image("/icon/obs2030.png", width: 35%)
        ]
      ),
      line(length: 100%, stroke: (paint: rgb("#333333"), thickness: 0.5pt))
    )
  ]
)

#set par(justify: true)

#set text(
  size: 11pt,
  font: "Open Sans",
  fill: rgb("#1a1a1a"),
  lang: "pt",
  hyphenate: false
)

#set heading(numbering: "1.1")

#show heading: set text(rgb("#00496d"))

#show link: underline

#show figure.caption: emph

#show figure.caption: it => [
  #text(
    10pt,
    fill: rgb("#00496d"),
    style: "italic",
    [#it.supplement #it.counter.display(it.numbering): #it.body]
  )
]

#set figure.caption(position: top, )

#let fonte(term) = {
  align(
    center, 
    text(
      10pt,
      fill: rgb("#00496d"))[
        Fonte: #cite(term, form: "prose")
      ]
  )
}

#include "02-expediente.typ"
#include "03-metadados.typ"
#include "04-sumario.typ"

//---------------------------------------------------------------

= Título 1

== Título 2

=== Título 3

#pagebreak()

= Citações

#lorem(50) @austroads_guide_2021

#lorem(50) @grsp_speed_2023

#pagebreak()

= Figuras

Testando figura (@test-img)

#figure(
  image("/img/img-test.svg"),
  caption: [Teste de figura]
) <test-img>

#fonte(<austroads_guide_2021>)

#pagebreak()

= Tabelas

== Tabela nativa

Testando a tabela nativa do typst (@test-tbl)

#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [Testando a tabela],
) <test-tbl>

#fonte(<austroads_guide_2021>)

== Tabela gt

Tabela criada com o gt (@test-tbl-gt)

#figure(
  table(
    image("/img/tbl-test.png", width: 90%),
    stroke: none
  ),
  caption: [Testando a tabela do gt],
) <test-tbl-gt>

#fonte(<austroads_guide_2021>)


#pagebreak()

= Código

Testando um bloco de código em R:

```r
sum <- function(x, y) {
  x + y
}
```
#pagebreak()

#bibliography("refs.bib", style: "associacao-brasileira-de-normas-tecnicas")