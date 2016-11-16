require 'json'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

get '/:collaboratorid' do
  content_type :json

  halt 400, { :message => 'the collaborator id needs to be a number' }.to_json unless params['collaboratorid'] =~ /^-?\d+$/ 

  collaboratorid = params['collaboratorid'].to_i

  halt 404, '' unless collaboratorid > 0 && collaboratorid < 6

  collaborators = [ nil,
                    { :id => 1, :name => 'Zeca', :age => 23 },
                    { :id => 2, :name => 'Chico', :age => 18 },
                    { :id => 3, :name => 'Joca', :age => 32 },
                    { :id => 4, :name => 'Gui', :age => 26 },
                    { :id => 5, :name => 'Lia', :age => 43 } ]

  collaborators[collaboratorid].to_json
end
