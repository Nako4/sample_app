# ログイン、ログアウト処理を行うコントローラー

class Api::SessionController < Api::ApplicationController
  def log_in
    account = Account.find_for_database_authentication(email: account_params[:email])

    return render json: {result: false} if account.nil?

    if account.valid_password?(account_params[:password])
      sign_in :account, account
      render json: {state: true}
    else
      render json: {state: false}
    end
  end

  def log_out
    sign_out current_account
    render json: {state: true}
  end

  private
  def account_params
    params.require(:account).permit(:email, :password)
  end
end