Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :careers do
    resources :careers, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :careers, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/careers" do
      resources :careers, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

