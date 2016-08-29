module ApplicationHelper

    #Retorna um titulo padrão(base_title) caso o titulo (provide(:title, "Home")) de cada pagina(view) esteja ausente.
    def full_title(page_title = '')
        base_title = "Ruby on Rails MicroMsg"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
end
