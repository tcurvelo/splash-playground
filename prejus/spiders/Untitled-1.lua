function main(splash, args)
    assert(splash:go(args.url))
    assert(splash:wait(3))
    splash:set_viewport_full()
    splash:wait(0.1)

    get_coords_menu = splash:jsfunc([[
        function(label) {
            elem = $(".QvContent:contains('" + label + "')");
            rect = elem.offset();
            return {"x": rect.left, "y": rect.top}
        }
    ]])

    get_coords_parameters = splash:jsfunc([[
      function(label, value) {
          elem = $(".QvCaption:contains('" + label + "') + .QvContent")
                 .find(".QvOptional:contains('"+ value + "')");
          rect = elem.offset();
          return {"x": rect.left, "y": rect.top}
      }
    ]])

    click_and_wait = function(coords)
        splash:mouse_click(coords.x, coords.y)
        splash:wait(4)
    end

    get_parameter_input = function(label, text)
        local get_glass_coords = splash:jsfunc([[
            function(label) {
                var elem = $('.QvCaption:contains("' + label + '") div[title="Pesquisar"]');
                rect = elem.offset();
                return {"x": rect.left, "y": rect.top}
            }
        ]])

        click_and_wait(get_glass_coords(label))
        return splash:select(".PopupSearch input")
    end

    click_and_wait(get_coords_menu("Empenho"))
    ano = get_parameter_input("Ano Emissão")
    ano:send_text("2018")


    -- query = {
    --     {label = 'Ano Emissão', value = '2018'},
    --     {label = 'Mês Emissão', value = 'jun'},
    --     {label = 'Órgão Superior', value = 'JUSTICA DO TRABALHO'},
    --     -- {label = 'Unidade Orçamentária', value = '15114 - TRIBUNAL REGIONAL DO TRABALHO DA 13A. REGIAO'},
    --     -- {label = 'Unidade Gestora', value = '080005 - TRIBUNAL REGIONAL DO TRABALHO DA 13A.REGIAO'},
    --     {label = 'Elemento de Despesa', value = '14 - DIARIAS - PESSOAL CIVIL'},
    -- }

    -- for index, parameter in pairs(query) do
    --     coords = get_coords_parameters(parameter.label, parameter.value)
    --     click_and_wait(coords)
    -- end

  return {
    html = splash:html(),
    png = splash:png(),
  }
end