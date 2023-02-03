require "placeos-driver/spec"

DriverSpecs.mock_driver "Mlhsn::HelloWorld" do
    # 1
    retval = exec(:greet)
    retval.get.should eq("Hello world!")

    # 2
    retval = exec(:greet, who: "human")
    retval.get.should eq("Hello human!")
end
