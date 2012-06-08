require "java"
require "test/unit"

java_import "Greeting"

class GreetingTest < Test::Unit::TestCase
  def setup
    @greeting = Greeting.new "Mateus Linhares", "mateus@idopter.com"
    @date = Time.now.strftime "%d/%m/%Y"
  end

  def test_say_hello
    assert_equal "Hello, Mateus Linhares. Your email: mateus@idopter.com. Date: #{@date}", @greeting.say_hello
  end

  def test_say_hello_with_assigns
    @greeting.name = "Piguera"
    @greeting.email = "pigor@idopter.com"
    assert_equal "Hello, Piguera. Your email: pigor@idopter.com. Date: #{@date}", @greeting.say_hello
  end
end

