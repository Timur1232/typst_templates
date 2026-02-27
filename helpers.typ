#let fmt_number(number, precision) = {
  assert(precision>0)
  let s = str(calc.round(number, digits: precision))
  let after_dot = s.find(regex("\..*"))
  if after_dot==none {
    s=s+"."
    after_dot="."
  }
  for i in range(precision - after_dot.len()+1){
    s=s+"0"
  }
  s
}

#let to_string(it) = {
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(to_string).join()
  } else if it.has("body") {
    to_string(it.body)
  } else if it == [ ] {
    " "
  } else {
    ""
  }
}

#let mod(a, b) = int(calc.floor((a - (b * int(calc.floor(a / b))))))

#let listing_code_file(path, caption: none) = {
  let filename = path.split("/").last()
  caption = if caption == none [Файл #filename] else [#caption]
  if path.first() != "/" {
    path = "/" + path
  }
  let code = raw(read(path), block: true, align: left)
  figure(code, caption: caption)
}

#let appendix(..args) = {
  counter(raw).update(0)
  let attachments_counter = counter("attachments")
  set heading(
    numbering: none,
  )

  let num(n) = {
    let letters = ("А", "Б", "В", "Г", "Д", "Е")
    return if n <= 6 { letters.at(n - 1) } else { num(calc.ceil(n / 6) - 1) + num(mod(n, 6)) }
  }

  attachments_counter.step()
  let attachments_number = context attachments_counter.display(num)

  align(center)[= ПРИЛОЖЕНИЕ #attachments_number]
  v(2.5em)

  let image_types = ( "png", "jpg", "jpeg", "gif", "bmp", "svg", "webp", "tiff" )

  let items = args.pos()

  for item in items {
    let (path, caption) = if type(item) == type("") {
      (item, none)
    } else {
      (item.at(0), item.at(1))
    }
    let type = path.split(".").last()
    if type in image_types {
      figure(
        caption: caption,
        image(path)
      )
    } else {
      listing_code_file(path, caption: caption)
    }
    v(2em)
  }
}
