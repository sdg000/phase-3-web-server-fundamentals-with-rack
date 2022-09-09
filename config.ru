# creating a server definition file
require "rack"
require "pry"


class App
    def call(env)
        # binding.pry

        # CREATING SINGLE PATH SERVER RESPONSE 
        # [200, { "Content-Type" => "text/html" }, ["your server returned", "<h2>Hello <em>World</em>!</h2>"]]

        # CREATING MULTIPLE PATH SERVER RESPONSE

        path = env["PATH_INFO"]

        if path == "/"
            [200, { "Content-Type" => "text/html" }, ["your server returned", "<h2>Hello <em>World</em>!</h2>"]]
        elsif path == "/potato"
            [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
        else
            [404, { "Content-Type" => "text/html" }, ["Page not found"]]
        end

    end
end

run App.new


# starting server : run // rackup config.run

# when config.ru runs, Class APP listens to requests (env) , invoke #call_method to return a {an array of response}

# Visit     http://localhost:9292  to view server html response

# MULTI PATH SERVER RESPONSE:
# //http://localhost:9292  => body response (" your server returned , Hello World! ")

# //http://localhost:9292/potato  => body response (" Boil 'em, mash 'em, stick 'em in a stew ")

# //http://localhost:9292/home  => body response ( "Page not found") status code: 404...view in console

