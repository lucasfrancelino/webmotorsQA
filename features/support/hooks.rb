require "base64"

Before('@usr') do
  @filtro = Filtro.new
end

After('@logout') do
  @login = LoginPage.new
  @login.sair
end

After do |scenario|
  nome_cenario = scenario.name.tr(' ','_').downcase!
  #nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')
  screenshot = "logs/shots/#{nome_cenario}.png"
  shot_file = page.save_screenshot(screenshot)
  shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
  #embed(shot_b64, 'image/png', 'Clique aqui para ver a evidência!')
end