Rails.application.routes.draw do

  #resources :strategic_sortings

  resources :cycle_review do
    collection do
      get :import
      post :import_cycle_review, :export_cycle_review, :update, :edit, :add
    end
  end  

  resources :cards do
    collection do
      get :import, :import_card, :import_complexity, :import_impact, :advance_search
      post :update
    end
  end

  resources :assessment do
    collection do
      get :import
    end
  end

  resources :complexity do
    collection do
      get :index  
    end
  end

  resources :reports do
    collection do
      get :index, :charts, :export
      post :generate 
    end
  end

  mount Blacklight::Engine => '/'
  concern :marc_viewable, Blacklight::Marc::Routes::MarcViewable.new
  root to: "catalog#index"
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
    collection do
      post :add_milestone, :add_comment, :add_objective
    end
  end

  post 'cards/import_new_cards'
  post 'cards/import_complexity_ratings'
  post 'cards/import_impact_ratings'
  post 'assessment/import_assessment'
  post 'complexity/edit'
  post 'complexity/update'

  devise_for :users
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns [:exportable, :marc_viewable]
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
