NormalizationStation::Application.routes.draw do
  get "upload/new"
  post "upload/upload"

  root :to => "upload#new"
end


