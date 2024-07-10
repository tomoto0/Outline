function Pandoc(doc)
  -- 著者情報と抄録をHTMLとして挿入
  local author = doc.meta.author
  local abstract = doc.meta.abstract
  local blocks = {}

  if author then
    table.insert(blocks, pandoc.RawBlock('html', '<div class="author">' .. pandoc.utils.stringify(author) .. '</div>'))
  end

  if abstract then
    table.insert(blocks, pandoc.RawBlock('html', '<div class="abstract">' .. pandoc.utils.stringify(abstract) .. '</div>'))
  end

  -- 既存のブロックの先頭に新しいブロックを挿入
  for i, block in ipairs(doc.blocks) do
    table.insert(blocks, block)
  end

  return pandoc.Pandoc(blocks, doc.meta)
end

function Header(elem)
  if elem.level == 1 and elem.content[1].text == "Introduction" then
    return pandoc.RawBlock('html', '<h2 class="introduction">Introduction</h2>')
  end
end
