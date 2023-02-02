require "placeos-driver/spec"

DriverSpecs.mock_driver "Mlhsn::Xkcd" do
  # Send the request
  retval = exec(:get_joke,
    slug: "/info.0.json",
  )

  expect_http_request do |request, response|
    if (/(\/[0-9]+\/)/ =~ request.path).nil?
      response.status_code = 200
      response << "{\"month\": \"2\", \"num\": 2732, \"link\": \"\", \"year\": \"2023\", \"news\": \"\", \"safe_title\": \"Bursa of Fabricius\", \"transcript\": \"\", \"alt\": \"If an anatomical structure is named for a person, it means they were the only person to have it. Pierre Paul Broca had a special area of his brain that created powerful magnetic fields, enabling him to do 19th century fMRI research.\", \"img\": \"https://imgs.xkcd.com/comics/bursa_of_fabricius.png\", \"title\": \"Bursa of Fabricius\", \"day\": \"1\"}"
    else
      response.status_code = 404
      response << "{}"
    end
  end

  retval.get.should_not contain("![failed]")
end
