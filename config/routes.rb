Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'

  # todolists/1やtodolists/3を判別するためにidも記述する
  get 'todolists/:id' => 'todolists#show',as:'todolist'

  # editアクションの追加
  get 'todolists/:id/edit' => 'todolists#edit',as:'edit_todolist'

  # updateアクション
  patch 'todolists/:id' => 'todolists#update',as:'update_todolist'

  # destroyアクション
  delete 'todolists/:id' => 'todolists#destroy',as:'destroy_todolist'

end
