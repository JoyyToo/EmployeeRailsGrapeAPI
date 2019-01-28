class API < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json

    resource :employee_data do
        desc "List all Employee"
  
        get do
          Employee.all
        end

        desc "Get a single employee"
        params do
            requires :id, type: String
        end
        get ':id' do
            Employee.find(params[:id])
        end

        desc "update an employee address"
        params do
            requires :id, type: String
            requires :address, type:String
        end
        put ':id' do
            Employee.find(params[:id]).update({
                address:params[:address]
            })
        end

        desc "Delete a single employee"
        params do
            requires :id, type: String
        end
        delete ':id' do
            Employee.find(params[:id]).destroy!
        end

        desc "create a new employee"
        ## This takes care of parameter validation
        params do
            requires :name, type: String
            requires :address, type:String
            requires :age, type:Integer
        end
        ## This takes care of creating employee
        post do
        Employee.create!({
            name:params[:name],
            address:params[:address],
            age:params[:age]
        })
        end
    end
end