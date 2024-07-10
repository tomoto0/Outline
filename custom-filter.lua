-- Pandoc documentに著者情報と抄録を挿入するための関数
function Pandoc(doc)
  local meta = doc.meta
  local blocks = {}

  -- 著者情報があればHTMLとして挿入
  if meta.author then
    local authorHtml = '<div class="author">' .. pandoc.utils.stringify(meta.author) .. '</div>'
    table.insert(blocks, pandoc.RawBlock('html', authorHtml))
  end

  -- 抄録があればHTMLとして挿入
  if meta.abstract then
    local abstractHtml = '<div class="abstract">' .. pandoc.utils.stringify(meta.abstract) .. '</div>'
    table.insert(blocks, pandoc.RawBlock('html', abstractHtml))
  end

  -- 既存のブロックに新しいブロックを追加
  for _, block in ipairs(doc.blocks) do
    table.insert(blocks, block)
  end

  -- 新しいドキュメントオブジェクトを返す
  return pandoc.Pandoc(blocks, meta)
end

-- 導入部に特別なHTMLクラスを追加するための関数
function Header(elem)
  if elem.level == 1 and elem.content[1].text == "Introduction" then
    -- 導入部の見出しに特別なクラスを追加
    return pandoc.Div({elem}, {class = "introduction"})
  end
end
