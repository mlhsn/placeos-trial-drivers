require "placeos-driver"

class Mlhsn::HelloWorld < PlaceOS::Driver
    generic_name :Driver
    descriptive_name "Hello driver"

    default_settings({
      who: "world",
    })

    def on_load
      on_update
    end

    def on_update
      greet
    end

    def greet(name : String? = nil) : String
      if name
        "Hello #{name}!"
      else
        "Hello #{setting?(String, :who)}!"
      end
    end
end
