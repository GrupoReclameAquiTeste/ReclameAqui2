Feature: Usuario
  As an usuario do sistema ReclameAqui
  I want to fazer cadastro, login e editar minha conta
  so that que eu nao tenha acesso ao sistema e meus dados nele

  Scenario: Fazer cadastro
    Given Eu estou na pagina de cadastro de usuario
    And Preencho os campos email com "luiz@email.com", login com "luiz", password com "123456" e password confirmation com "123456"
    When Eu clico em criar conta
    Then Sou redirecionado para a tela de login

  Scenario: Editar conta
    Given Eu estou logado
    And Eu estou na pagina de editar a conta
    And Preencho os campos password e password confirmation com "1234567"
    When Eu Clico em editar
    Then Vejo a confirmacao da alteracao

  Scenario: Senha e confirmacao de senha diferentes
    Given Eu estou na pagina de cadastro de usuario
    And Preencho os campos email com "luiz@email.com", login com "luiz", password com "0123456" e password confirmation com "123456"
    When Eu clico em criar conta
    Then Vejo mensagem que a conta nao pode ser criada

  Scenario: Tentar cadastar login ja existente
    Given Eu estou na pagina de cadastro de usuario
    And Preencho os campos email com "luiz@email.com", com o login que ja existe "luiz", password com "123456" e password confirmation com "123456"
    When Eu clico em criar conta
    Then Vejo mensagem que a conta nao pode ser criada

