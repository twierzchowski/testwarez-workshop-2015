pushd ..\application\todo-list & rake db:drop & rake db:migrate & rake db:seed & rake db:test:clone & popd
cucumber features -t ~@skip