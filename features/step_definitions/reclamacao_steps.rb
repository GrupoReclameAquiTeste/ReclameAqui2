Given ('Eu estou logado') do
  visit "usuarios/new"
  fill_in "usuario[login]", :with => 'ze'
  fill_in "usuario[email]", :with => 'ze@email.com'
  fill_in "usuario[password]", :with => '123456'
  fill_in "usuario[password_confirmation]", :with => '123456'
  click_button "submit"

  visit "/login"
  fill_in "login", :with => 'ze'
  fill_in "password", :with => '123456'
  click_button "Login"
end

And ('Eu estou na pagina de nova reclamacao') do
  visit "/reclamacaos/new"
end

When ('preencho titulo com {string}, texto com {string}, categoria_problema com {string} e seleciona a empresa {string}') do |titulo, texto, categoria_problema, empresa|
  fill_in "reclamacao[titulo]", :with => titulo
  fill_in "reclamacao[texto]", :with => texto
  fill_in "reclamacao[categoria_problema]", :with => categoria_problema

  select empresa, from: "reclamacao[empresa]"
end

And ('clico em criar reclamacao') do
  click_button 'Create'
end

Given ('Eu estou na pagina de reclamacoes') do
  visit "/reclamacaos"
end

And ('vejo a reclamacao de titulo {string} ja existente') do |titulo|
  visit "/reclamacaos/new"
  fill_in "reclamacao[titulo]", :with => titulo
  fill_in "reclamacao[texto]", :with => "Maecenas convallis erat eu ex vulputate, blandit malesuada lacus mattis. Phasellus sed pulvinar felis. Curabitur imperdiet pellentesque augue sed tincidunt. Vivamus commodo libero tortor, at lacinia metus congue non. Duis et feugiat sapien. Ut laoreet aliquet lorem nec luctus. Maecenas pulvinar nibh diam. "
  fill_in "reclamacao[categoria_problema]", :with => "????????????"
  select 'Empresa1', from: "reclamacao[empresa]"
  click_button 'Create'

  visit "/reclamacaos"
  expect(page).to have_content(titulo)
end

When ('eu clico em deletar') do
  click_link 'deletar'
end

Then ('vejo que nao existe a reclamacao de titulo {string}') do |titulo|
  expect(page).to have_no_content(titulo)
end

Then('vejo as mensagens de restricao para titulo e texto') do
  expect(page).to have_content("Titulo can't be blank")
  expect(page).to have_content("Texto can't be blank")
end

When('eu vejo a reclamacao de titulo {string}') do |titulo|
  visit "/"
  click_button "logout"

  visit "usuarios/new"
  fill_in "usuario[login]", :with => 'zeca'
  fill_in "usuario[email]", :with => 'zeca@email.com'
  fill_in "usuario[password]", :with => '123456'
  fill_in "usuario[password_confirmation]", :with => '123456'
  click_button "submit"

  visit "/login"
  fill_in "login", :with => 'zeca'
  fill_in "password", :with => '123456'
  click_button "Login"

  visit "/reclamacaos/new"
  fill_in "reclamacao[titulo]", :with => titulo
  fill_in "reclamacao[texto]", :with => "Maecenas convallis erat eu ex vulputate, blandit malesuada lacus mattis. Phasellus sed pulvinar felis. Curabitur imperdiet pellentesque augue sed tincidunt. Vivamus commodo libero tortor, at lacinia metus congue non. Duis et feugiat sapien. Ut laoreet aliquet lorem nec luctus. Maecenas pulvinar nibh diam. "
  fill_in "reclamacao[categoria_problema]", :with => "????????????"
  select 'Empresa1', from: "reclamacao[empresa]"
  click_button 'Create'

  visit "/"
  click_button "logout"

  visit "/login"
  fill_in "login", :with => 'ze'
  fill_in "password", :with => '123456'
  click_button "Login"

end

When('clico em editar a reclamacao de titulo {string}') do |titulo|
  visit "/reclamacaos"
  expect(page).to have_content(titulo)

  click_link 'editar'
  page.has_xpath?("/reclamacaos")

  expect(page).to have_content(titulo)
end