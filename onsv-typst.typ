#let onsv-typst(
  title: none,
  authors: (),
  produto: none, 
  data: none,
  repositorio: none,
  body
) = {
  // Config da página
  set page(
    paper: "a4",
    margin: (x: 25mm, y: 30mm),
    footer: [
      #stack(
        spacing: 0.5em,
        line(length: 100%, stroke: (paint: rgb("#333333"), thickness: 0.5pt)),
        block(
          [
            #set text(10pt, fill: rgb("#333333"))
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

  // Parágrafo
  set par(justify: true)

  // Corpo do texto
  set text(
    size: 11pt,
    font: "Open Sans",
    fill: rgb("#1a1a1a"),
    lang: "pt",
    hyphenate: false
  )

  // Headings
  set heading(numbering: "1.1")
  show heading: set text(rgb("#00496d"))

  // Links
  show link: underline

  // Figuras
  show figure.caption: emph
  show figure.caption: it => [
    #text(
      10pt,
      fill: rgb("#00496d"),
      style: "italic",
      [#it.supplement #it.counter.display(it.numbering): #it.body]
    )
  ]
  set figure.caption(position: top)

  // Tabelas
  set table(
    // Header em azul do OBS
    fill: (_, y) => if y == 0 { rgb("#00496d") },

    // Coloca uma linha cinza no topo e baixo do header
    stroke: (_, y) => if y == 0 { (bottom: silver + 1pt, top: silver + 1pt) }
  )

  // Coloca a fonte do header em cinza negrito
  show table.cell.where(y: 0): set text(fill: silver, weight: "bold")

  // Deixa a fonte da tabela no tamanho 10pt
  show table.cell: it => {text(it, size: 10pt)}

  // Folha de rosto
  page(
    header: none,
    footer: none
  )[
    #align(
      center,
      text(18pt, fill: rgb("#00496d"), weight: "bold")[
        #title
      ]
    )
  
    #align(
      end + horizon,
      [
        #grid(
          columns: (1fr, 1fr),
          [],
          [
            #produto
            \
            \

            Elaborado no âmbito da Cooperação Técnica entre a Universidade Federal do Paraná e o Observatório Nacional de Segurança Viária (Contrato PD&I 37/2023).
            \
            \

            #grid(
              columns: 1,
              ..authors.map(author => [
                #author.name 
                \
                \
              ])
            )
            \
            \
            #data
          ]
        )
      ]
    )
  ]
  
  pagebreak()

  // Página de expediente
  align(
    start + horizon,
    [
      #text(14pt, fill: rgb("#00496d"), [*Observatório Nacional de Segurança Viária*]) 
      \
      \
      
      *Sobre*

      O Observatório Nacional de Segurança Viária é uma instituição social sem fins lucrativos, dedicada a desenvolver ações que contribuam efetivamente para a redução dos elevados índices de ocorrências no trânsito brasileiro. Com esse objetivo, um grupo de profissionais multidisciplinares decidiu reunir todo o seu conhecimento, experiência e motivação em um único projeto grandioso e desafiador: mobilizar a sociedade em prol de um trânsito mais seguro.

      \
      \
      *Expediente*
      \
      \
      Paulo Guimarães -- _CEO_ 
      \
      \
      José Aurelio Ramalho -- _Presidente do Conselho Deliberativo_\
      
      Dr. Jorge Tiago Bastos -- _Membro do Conselho Deliberativo_\
      
      Mauro Gil Meger -- _Membro do Conselho Deliberativo_
      \
      \
      Pedro Augusto Borges dos Santos -- _Head de Mobilidade Segura_\
      
      Rodrigo Ribeiro -- _Head de Comunicação e Marketing_
      \
      \
      Daniela Gurgel -- _Public Affairs_\
      
      Marcela Santoro Coutinho -- _Assistente de Gestão Pleno_\
      
      Eliana Souza -- _Assessoria de Gabinete_\
      
      Fernando Silva -- _Assistente de Comunicação_\
      
      Rodrigo Silva -- _Controle Financeiro_\
      
      Vitor de Almeida David -- _Comunicação e Marketing_\
      
      João Pedro Saraiva -- _Estagiário de Análise de Dados_\

      Isabella Tostes -- _Estagiária de Comunicação e Marketing_\

      Paloma Eleutério -- _Estagiária de Análise de Dados_\

      Arthur Noguti -- _Estagiário_
    ]
  )

  pagebreak()

  // Página de metadados
  align(
    start + horizon,
    [
      #text(14pt, fill: rgb("#00496d"), [*Como citar*]) 
      
      ONSV; UFPR (2024). #title. Observatório Nacional de
      Segurança Viária e Universidade Federal do Paraná. Disponível em:
      #link("https://www.onsv.org.br/estudos-pesquisas/estudos-e-pesquisas").

      \
      #text(14pt, fill: rgb("#00496d"), [*Licença de uso*]) 
      
      #title © 2024 por Observatório Nacional de
      Segurança Viária e Universidade Federal do Paraná está licenciada sob CC
      BY-NC 4.0. Para ver uma cópia desta licença, acesse
      http://creativecommons.org/licenses/by-nc/4.0/

      \
      #text(14pt, fill: rgb("#00496d"), [*Código livre e aberto*]) 
      
      Todo o processo metodológico de coleta, transformação e visualização dos
      dados presentes nesse relatório estão disponíveis no repositório
      #link(repositorio)
    ]
  )

  pagebreak()

  // Renderiza o sumário
  outline()

  outline(target: figure.where(kind: image), title: [Lista de figuras])

  outline(target: figure.where(kind: table), title: [Lista de tabelas])

  pagebreak()

  // Renderiza o corpo do documento
  body
}

// Citações em figuras / tabelas
#let fonte(term) = {
  set cite(form: "prose")
  align(
    center, 
    text(
      10pt,
      fill: rgb("#00496d")
    )[Fonte: #term]
  )
}