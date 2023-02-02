require "http/client"
require "json"

def get_joke(slug : String) : String
    response = HTTP::Client.get(slug)

    return "![failed](#{response.status_code})" unless response.success?

    body_json = JSON.parse response.body

    "![#{body_json["safe_title"]}](#{body_json["img"]})"
end


require "spec"

describe "Mlhsn::Xkcd" do
    it "calls the joke" do
        ret = get_joke("https://xkcd.com/info.0.json")
        ret.should_not contain("![failed]")
    end
end