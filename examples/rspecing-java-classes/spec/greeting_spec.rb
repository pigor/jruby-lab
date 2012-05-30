require "java"

java_import "com.examples.Greeting"

describe Greeting do
  let(:greeting){ Greeting.new "Mateus Linhares", "mateus@idopter.com" }
  let(:date){ Time.now.strftime "%d/%m/%Y" }

  it "should say hello to me" do
    greeting.say_hello.should == "Hello, Mateus Linhares. Your email: mateus@idopter.com. Date: #{date}"
  end

  it "should say hello to Piguera" do
    greeting.set_name "Piguera"
    greeting.set_email "pigor@idopter.com"
    greeting.say_hello.should == "Hello, Piguera. Your email: pigor@idopter.com. Date: #{date}"
  end
end
