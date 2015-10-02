json.array!(@contatos) do |contato|
  json.extract! contato, :id, :nome, :telefone
  json.url contato_url(contato, format: :json)
end
