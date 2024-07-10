function Meta(meta)
  local author = meta.author
  if author then
    meta.author_html = pandoc.RawBlock('html', '<div class="author">' .. pandoc.utils.stringify(author) .. '</div>')
  end

  local abstract = meta.abstract
  if abstract then
    meta.abstract_html = pandoc.RawBlock('html', '<div class="abstract">' .. pandoc.utils.stringify(abstract) .. '</div>')
  end

  return meta
end

function Header(elem)
  if elem.level == 1 and elem.content[1].text == "Introduction" then
    return pandoc.RawBlock('html', '<h2 class="introduction">Introduction</h2>')
  end
end
