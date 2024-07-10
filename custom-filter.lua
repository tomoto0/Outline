function Meta(meta)
  -- 著者情報をHTMLに変換
  if meta.author then
    meta.author = pandoc.RawInline('html', '<div class="author">' .. pandoc.utils.stringify(meta.author) .. '</div>')
  end

  -- 抄録をHTMLに変換
  if meta.abstract then
    meta.abstract = pandoc.RawInline('html', '<div class="abstract">' .. pandoc.utils.stringify(meta.abstract) .. '</div>')
  end

  return meta
end
