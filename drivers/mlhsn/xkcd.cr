require "placeos-driver"

class Mlhsn::Xkcd < PlaceOS::Driver
    generic_name :Driver

    descriptive_name "xkcd.com comic fetcher"

    description "This is the Driver used for fetching xkcd.com comic"

    uri_base "https://xkcd.com"

    default_settings({
      default_slug: "/info.0.json",
    })

    def on_load
      on_update
    end

    def on_update
    end

    def get_joke(slug : String) : String
      response = get(slug, headers: {
        "Content-Type" => "application/json",
      })

      return "![failed](#{response.status_code})" unless response.success?

      body_json = JSON.parse response.body

      "![#{body_json["safe_title"]}](#{body_json["img"]})"
    end
end
