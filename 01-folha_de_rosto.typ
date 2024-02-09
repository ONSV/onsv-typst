#set text(size: 11pt, font: "Open Sans", fill: rgb("#1a1a1a"))

#align(
  center,
  text(18pt, fill: rgb("#00496d"))[
    *TÍTULO*
  ]
)

#align(
  end + horizon,
  [
    #grid(
      columns: (1fr, 1fr),
      [],
      [
        Produto
        \
        \
        
        Elaborado no âmbito da Cooperação Técnica entre a Universidade Federal do Paraná e o Observatório Nacional de Segurança Viária (Contrato PD&I 37/2023).
        \
        \
    
        Autor 1 \
        Autor 2 \
        Autor n
        \
        \
        #datetime.today().display("[day]/[month]/[year]")
      ]
    )
  ]
)

#pagebreak()