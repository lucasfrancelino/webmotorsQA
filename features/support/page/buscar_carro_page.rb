class Filtro < SitePrism::Page
    set_url ''

    element :search_input, '#searchBar'
    element :search_click, '.SearchBar__results__result__name'
    element :search_versao_click, :xpath, "//div[@class='Filters__line Filters__line--icon Filters__line--icon Filters__line--icon--right Filters__line--gray']"
    element :versao_escolhida_click, :xpath, "//*[@id='root']/main/div[1]/div[2]/div/div[2]/div/div[4]/a[1]"

    def buscar_carro(carro)
        search_input.set carro
        search_click.click
    end

    def selecionar_versao
        search_versao_click.click
        versao_escolhida_click.click 
    end

end