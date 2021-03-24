# app/contorollers/api以下のコントローラーのベースとなるコントローラー

class Api::ApplicationContoroller < ActionController
  # CSRF対策用のトークンを用いない
  skip_before_action :verify_authenticity_token
  
  # リクエストがxhr(XMLHttpReqesut)であることをチェックする
  before_action :chech_xhr_header
  
  private
  def check_xhr_header
    return if request.xhr?

    render json: { error:'forbidden' }, status: :forbidden
  end
end