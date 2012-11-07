set :rails_env,             "staging"
set :domain,                "spree-example.mimo.com.ng"

role :web,                  domain.to_s
role :app,                  domain.to_s
role :ops,                  domain.to_s
role :db,                   domain.to_s,    primary:  true