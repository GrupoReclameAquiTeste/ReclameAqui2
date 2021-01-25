Given('Eu estou na pagina de cadastro de usuario') do
  visit "/usuarios/new"
end

And('Preencho os campos email com {string}, login com {string}, password com {string} e password confirmation com {string}') do |email, login, password, password_confirmation|
  fill_in "usuario[email]", :with => email
  fill_in "usuario[login]", :with => login
  fill_in "usuario[password]", :with => password
  fill_in "usuario[password_confirmation]", :with => password_confirmation
end

When('Eu clico em criar conta') do
  click_button 'submit'
end

Then('Sou redirecionado para a tela de login') do
  page.has_xpath?("/login")
end

And('Eu estou na pagina de editar a conta') do
  visit "/editar_usuario"
end

And('Preencho os campos password e password confirmation com {string}') do |password|
  fill_in 'usuario[password]', :with => password
  fill_in 'usuario[password_confirmation]', :with => password
end

When('Eu Clico em editar') do
  click_button 'submit'
end

Then('Vejo a confirmacao da alteracao') do
  expect(page).to have_content("Usuario was successfully updated.")
end

Then('Vejo mensagem que a conta nao pode ser criada') do
  expect(page).to have_content("prohibited this usuario from being saved")
end

And('Preencho os campos email com {string}, com o login que ja existe {string}, password com {string} e password confirmation com {string}') do |email, login, password, password_confirmation|
  visit "/usuarios/new"
  fill_in "usuario[email]", :with => "alguem@email.com"
  fill_in "usuario[login]", :with => login
  fill_in "usuario[password]", :with => "123456"
  fill_in "usuario[password_confirmation]", :with => "123456"
  click_button 'submit'

  visit "/usuarios/new"
  fill_in "usuario[email]", :with => email
  fill_in "usuario[login]", :with => login
  fill_in "usuario[password]", :with => password
  fill_in "usuario[password_confirmation]", :with => password_confirmation
  click_button 'submit'
end
