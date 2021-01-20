Dado('que eu acesse o site webmotors') do
    @filtro.load
  end
  
  Quando('eu faco a busca pelo carro {string}') do |carro|
    @filtro.buscar_carro(carro)
  end
  
  Quando('seleciono a versao DX16V FLEX 4P AUTOMÁTICO') do
    @filtro.selecionar_versao
  end
  
  Entao('vejo o resultado da Buscar') do
    expect(page).to have_content "Honda City 1.5 Dx 16v Flex 4p Automático Novos e Usados"
  end
  