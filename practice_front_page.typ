#import "uni.typ": uni_style

#let SOLARLAB = [ООО "Соларлаб"]
#let MY_COURSE_CODE = [09.03.02]
#let MY_COURSE_NAME = [Информационные системы и технологии]
#let MY_SUPERVISOR = (
  [доцент],
  [М.В. Заморёнов],
)

#let practice_front_page(
  company_name,
  full_name,
  group,
  course_code,
  course_name,
  supervisor_post,
  supervisor_full_name,
) = {

  show: uni_style

  set par(
    justify: false,
    spacing: 1.5em,
    leading: 0.5em,
    first-line-indent: 0pt,
  )

  align(center + top)[
    #set text(size: 12pt)
    МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ \
    #set text(weight: "bold")
    ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ \
    УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ \
    #set text(size: 14pt)
    "СЕВАСТОПОЛЬСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ" \
  ]

  align(right)[
    Факультет #underline[информационных технологий]
    \
    #block(
      width: 60%,
      table(
        stroke: none,
        columns: (1fr, 3fr),
        [Кафедра], align(left)["#underline[Информационные технологии и системы]"]
      )
    )

    #set text(size: 11pt)
    #block(
      width: 55%,
      table(
        align: center,
        columns: (1fr, 3fr, 3fr, 3fr),
        rows: (auto, 14pt, 14pt),
        table.header(
          [№], [Дата поступления на кафедру], [Подпись отв. за регистрацию], [Подпись преподавателя]
        ),
      )
    )
  ]

  v(1em)
  set par(leading: 1.5em)

  align(center)[
    #text(size: 16pt, weight: "bold")[ОТЧЕТ] \
    о #underline[производственной (профессиональный трек)] практике \
    #set par(leading: 0.3em)
    в #underline(company_name) \
    #text(size: 10pt)[(наименование организации)])
  ]

  align(right)[
    #block(width: 50%)[
      #table(
        stroke: none,
        align: (left, center),
        columns: (1fr, 2fr),
        [Выполнил],
        table.hline(start: 1),
        full_name,
        [], text(size: 10pt)[(Фамилия И.О. обучающегося)],
        table.cell(colspan: 2, group, align: center),
        table.hline(),
        table.cell(colspan: 2, align: center, text(size: 10pt)[(шифр группы)]),
      )
      #set align(left)
      #set par(leading: 0.5em, spacing: 0.3em)
      Направление #underline[#course_code #course_name]

      #align(center, text(size: 10pt)[(код, наименование)])

      #v(2em)

      Руководитель по практической подготовке от Университета 

      #table(
        columns: 1fr,
        stroke: none,
        align: center,

        supervisor_post,
        table.hline(),
        text(size: 10pt)[(должность)],
        supervisor_full_name,
        table.hline(),
        text(size: 10pt)[(Фамилия И. О. руководителя)],
      )
    ]
  ]

  place(bottom+center)[
    #align(center)[
      #set par(leading: 0.5em)
      Севастополь,\
      #datetime.today().year()
    ]
  ]
}
