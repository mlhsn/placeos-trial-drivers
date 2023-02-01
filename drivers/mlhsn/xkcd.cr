require "placeos-driver"

# class Mlhsn::Joke
#   getter! :alt
#   getter! :img
#   getter! :title

#   def from_json(j_obj : String)
#     h_obj = Hash(String, String).from_json(JSON.parse(j_obj))
#     @alt, @img, @title = h_obj["alt"], h_obj["img"], h_obj["title"]
#   end
# end

class Mlhsn::Xkcd < PlaceOS::Driver
    generic_name :Driver

    descriptive_name "xkcd.com comic fetcher"

    description "This is the Driver used for fetching xkcd.com comic"

    uri_base "https://xkcd.com"

    default_settings({
      default_slug: "/info.0.json",
      # params_slug: "/{id}/info.0.json",
    })


    def on_load
      on_update
    end

    def on_update
    end

    def get_joke(slug : String) : String
      response = get(slug, headers: {
        "Content-Type" => "application/json",
        "Accept"       => "application/json",
      })

      raise "request failed with #{response.status_code}\n#{response.body}" unless response.success?

    #   puts response.body
      response.body

      # Mlhsn::Joke.new
    end
end
