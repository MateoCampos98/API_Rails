module Secured #concerns metodos que pueden ser reutilizados por los controladores funciona igual con los modelos 
  def authenticate_user!
    # Bearer xxxxx
    token_regex = /Bearer (\w+)/
    # leer HEADER de auth
    headers = request.headers
    # verificar que sea valido
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      if(Current.user = User.find_by_auth_token(token))
        return
      end
    end

    render json: {error: 'Unauthorized'}, status: :unauthorized
    # debemos vereficar que el token corresponda a un user
  end
end