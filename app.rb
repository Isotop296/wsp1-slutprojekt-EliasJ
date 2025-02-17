
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
        erb(:"index")
    end


    

end


