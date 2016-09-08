module UsersHelper

    # Retorna o Gravatar do usuário de acordo com o avatar que contém no email informado
    # Retorna o nome do usuário como forma de mobilidade
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
