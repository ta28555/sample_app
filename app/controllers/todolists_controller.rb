class TodolistsController < ApplicationController

  def new
    @list = List.new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
  end

  def create
    # ①　データを新規登録するためのインスタンス作成
    list = List.new(list_params)

    # ②　データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ③　リダイレクト
    # 詳細画面へ
    redirect_to todolist_path(list.id)
  end

  # indexアクション
  def index
    @lists = List.all
  end

  # showアクション
  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
    list = List.find(params[:id]) # データを1件取得
    list.destroy # データ（レコード）を削除
    redirect_to todolists_path # 一覧画面にリダイレクト
  end


  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
