#import "./data.typ": my_name, my_group

#let front_page(
  lab_number: 1,
  lab_name: [],
  subject: [],
  student_name: my_name,
  student_group: my_group,
  prof_info: [],
  prof_name: none,
) = {

  set par(justify: false)

  align(center)[
    #text(size: 12pt)[
      МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ \
      ФГАОУ ВО «СЕВАСТОПОЛЬСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ»
    ]
  ]

  v(6em)

  align(right)[
    ВТШ "СПИ". \
    Факультет информационных технологий
  ]

  v(4em)

  align(center)[
    #block(width: 60%)[
      ОТЧЕТ \
      о выполнении лабораторной работы №#lab_number \
      «#lab_name» \
      по дисциплине \
      «#subject»
    ]
  ]

  v(4em)

  [
    #set par(first-line-indent: (amount: 10cm, all: true), hanging-indent: 10cm)
    Выполнил:#parbreak()
    ст.гр. #student_group#parbreak()
    #student_name#parbreak()
    #if prof_name != none [
      #v(1em)
      Проверил:#parbreak()
      #prof_info#parbreak()
      #prof_name#parbreak()
    ]
  ]

  place(bottom+center)[
    #align(center)[
      Севастополь, #datetime.today().year()
    ]
  ]

  pagebreak()
}

#let simple_header(number: 1, lab_name: none) = {
  counter(heading).update(number - 1)
  align(
    center,
  )[
    #block(
      below: 1em,
      heading(
        numbering: (..nums) => [],
        [ЛАБОРТОРНАЯ РАБОТА №#number],
      )
    )
    «#lab_name»
  ]
}
