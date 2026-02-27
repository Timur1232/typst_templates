#import "./front_page.typ": *
#import "./data.typ": *
#import "./helpers.typ": *

#let uni_style(doc) = {
  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 1.5cm),
  )

  set text(
    lang: "ru",
    size: 14pt,
    // font: "Times New Roman"
  )

  set heading(
    numbering: "1.",
  )

  set par(
    first-line-indent: (amount: 1.25cm, all: true),
    spacing: 1em,
    leading: 1em,
    justify: true,
  )

  set list(
    marker: [--],
    indent: 1.25cm,
  )

  set enum(
    numbering: "1)",
    indent: 1.25cm,
  )

  show heading: it => {
    let (above, below) = if it.level == 1 {
      (2em, 1.25em)
    } else {
      (2em, 1em)
    }
    return block(
      above: above,
      below: below,
      pad(
        left: 1.25cm,
        text(
          weight: "bold",
          size: 14pt,
          it
        )
      )
    )
  }

  show raw.where(block: true): it => {
    let indent = if it.align == left { 0cm } else { 1.25cm }
    text(
      // font: "Iosevka",
      size: 10pt,
      [
        #par(
          first-line-indent: (amount: indent, all: true),
          hanging-indent: indent,
          leading: 0.5em,
          it.text,
        )
      ]
    )
  }

  show figure.caption.where(kind: image): it => {
    let fig-num = context counter(image).display()
    let cap = if it.body != [] [ -- #it.body] else []
    [Рисунок #fig-num #cap]
  }

  counter(table).update(1)
  show figure.where(kind: table): it => {
    let fig-num = context counter(table).display()
    let cap = if it.caption != none [ -- #it.caption.body] else []
    [
      #align(left, [Таблица #fig-num #cap])
      #parbreak()
      #it.body
    ]
  }

  counter(raw).update(1)
  show figure.where(kind: raw): it => {
    let fig-num = context counter(raw).display()
    let cap = if it.caption != none [ -- #it.caption.body] else []
    [
      #align(left, [
        Листинг #fig-num #cap
        #parbreak()
        #it.body
      ])
    ]
  }

  set math.equation(numbering: "(1)", supplement: none)
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      link(it.target)[(#it)]
    } else {
      it
    }
  }

  doc
}
