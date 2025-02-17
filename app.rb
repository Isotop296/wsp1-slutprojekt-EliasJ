
class App < Sinatra::Base

    def db
        return @db if @db

        @db = SQLite3::Database.new("db/spel.sqlite")
        @db.results_as_hash = true

        return @db
    end

    def UserSessionManager(userId)
        active_user = session[:userId]
    end

    get '/' do
        user_handeling = 
        erb(:"account")
    end

    post '/loggin/check' do 
        username = params[:username]
        password = params[:password]
        password_hash = BCrypt::Password.create(password)

        user_exists = db.execute('SELECT * FROM users WHERE username = ?', [username]).first

        users_exists.each do |password|
            if password == password_hash
                userid = users.username
                UserSessionManager(userid)
                redirekt('#här ska det vara något annat')
            else 
                @error_message = "användaren finns inte"
                erb(:"login")
            end
        end
    end


    

end


