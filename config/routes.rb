Rails.application.routes.draw do

  #resources :strategic_sortings

  #resources :users do
  #  collection do
  #    get :view
  #  end
  #end

  resources :cycle_review do
    collection do
      get :import
      post :import_cycle_review, :export_cycle_review, :update, :edit, :add
    end
  end  

  resources :cycle do
    collection do
      get :new
      post :save
    end
  end  
  
  resources :cards do
    collection do
      get :settings, :import, :import_card, :import_complexity, :import_impact, :advance_search, :progress, :resources, :status, :edit_objectives, :edit_tracks
      post :edit_status, :edit_rationale, :update, :progress2, :tactical_progress2,:save_progress, :resources2, :save_resources, :update_resources, :add_resource, :tactical_resources2, :edit_objectives2, :save_objectives, :edit_consultants,:save_consultants, :save_tracks, :save_status
    end
  end

  resources :chips do
    collection do
      get :resources, :staff_chips
      post :edit_chips, :save_chips
    end
  end

  resources :permit do
    collection do
      get :index
      post :save
    end
  end

   resources :plogs do
    collection do
      get :index
      post :save
    end
  end

   resources :tracc_users do
    collection do
      get :index
      post :save
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

   resources :nonlit do
    collection do
      get :index
      post :save, :edit  
    end
  end

  resources :reports do
    collection do
      get :index, :about, :charts, :export
      post :generate
    end
  end

   resources :dashboard do
    collection do
      get :cycledashboard , :tactical_dashboard, :overview, :paused, :boards
      post :dashboard, :strategic, :tactical_stats, :tactical, :cycle_board
    end
  end
  resources :alerts do
    collection do
      get :index, :my_alerts, :add, :export
      post :save
    end
  end

  mount Blacklight::Engine => '/'
  concern :marc_viewable, Blacklight::Marc::Routes::MarcViewable.new
  root to: "catalog#index"
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
    collection do
      post :add_milestone, :add_comment, :add_objective, :update_milestone_check, :update_objective_check
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
