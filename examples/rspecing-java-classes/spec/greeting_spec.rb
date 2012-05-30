require "java"

java_import "Greeting"

describe Greeting do
  let(:greeting){ Greeting.new "Mateus Linhares", "mateus@idopter.com" }
  let(:date){ Time.now.strftime "%d/%m/%Y" }

  it "should say hello to me" do
    greeting.say_hello.should == "Hello, Mateus Linhares. Your email: mateus@idopter.com. Date: #{date}"
  end

  it "should say hello to Piguera" do
    greeting.name = "Piguera"
    greeting.email = "pigor@idopter.com"
    greeting.say_hello.should == "Hello, Piguera. Your email: pigor@idopter.com. Date: #{date}"
  end
end
