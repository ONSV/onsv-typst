#import "onsv-typst.typ": onsv-typst, fonte

#show: onsv-typst.with(
  authors: (
    (name: "Autor 1"),
    (name: "Autor 2")
  ),
  title: "onsv-typst",
  data: "08/04/2024",
  produto: "Relatório Técnico",
  repositorio: "https://www.github.com/ONSV/onsv-typst"
)

//-----

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

#fonte(cite(<austroads_guide_2021>))

#pagebreak()

= Tabelas

== Tabela nativa

Testando a tabela nativa do typst (@test-tbl)

#figure(
  table(
    columns: 4,
    [t], [1],    [2],    [3],
    [y], [0.3s], [0.4s], [0.8s],
    [x], [0.4s], [0.5s], [1.0s],
    [x], [0.4s], [0.5s], [1.0s],
    [x], [0.4s], [0.5s], [1.0s],
    table.hline()
  ),
  caption: [Testando a tabela],
) <test-tbl>

#fonte(cite(<austroads_guide_2021>))

== Tabela gt

Tabela criada com o gt (@test-tbl-gt)

#figure(
  table(
    [],
    image("/img/tbl-test.png", width: 90%),
    stroke: none,
    fill: none
  ),
  caption: [Testando a tabela do gt],
) <test-tbl-gt>

#fonte(cite(<austroads_guide_2021>))

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