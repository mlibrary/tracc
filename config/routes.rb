Rails.application.routes.draw do

  #devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }

  #devise_scope :admin do
  #  get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
  #  get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  # end
  #resources :strategic_sortings

  #resources :users do
  #  collection do
  #    get :view
  #  end
  #end

  get '/auth/:provider/callback' => 'sessions#omniauth' 
  resources :about do
    collection do
      get :about, :help
      
    end
  end 

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
      get :settings, :import, :import_card, :import_complexity, :import_impact, :advance_search, :progress,  :status, :edit_objectives, :edit_tracks
      post :edit_status, :edit_rationale, :update, :save_card, :progress2, :tactical_progress2,:save_progress, :edit_objectives2, :save_objectives, :edit_consultants,:save_consultants, :save_tracks, :save_status, :edit_tracks
    end
  end

  resources :chips do
    collection do
      get :resources, :staff_chips
      post :edit_chips, :save_chips
    end
  end

  resources :chip_assignment do
    collection do
    get :resources, :tactical_resources  
   post :resources2, :save_resources, :update_resources, :add_resource, :tactical_resources2
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
      get :index,  :charts, :export, :chip_assignment, :objectives, :cycle_review
      post :generate, :chip_assignment, :objectives, :cycle_review
    end
  end

   resources :dashboard do
    collection do
      get :cycledashboard , :tactical_dashboard, :overview, :paused, :boards, :cycle_board, :strategic, :tactical_stats, :tactical, :dashboard
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
