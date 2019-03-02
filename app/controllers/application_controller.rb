class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 本来Viewでしか使えないはずのHelperModuleを、Controller側でも使えるようにするためのコード
  # HelperModule内のメソッドを、インスタンスメソッドとして読み込んでいる。
  # これをMix-inという。
  include SessionsHelper
  
  private

  def require_user_logged_in
    # ログインしていないのであれば、ログイン画面にリダイレクトをする
    # ApplicationControllerに書いておくことで、これを継承したControllerはbefore_actionで定義して、
    # 使用することができる。
    unless logged_in?
      redirect_to login_url
    end
  end
end
