require "java"

java_import "com.examples.Greeting"

describe Greeting do
  let(:greeting){ Greeting.new }

  it "should say hello" do
    greeting.say_hello.should == "Hello from Java class!"
  end
end
