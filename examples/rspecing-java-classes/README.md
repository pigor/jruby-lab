execution
=========

javac -d build src/com/examples/Greeting.java
jruby -J-cp build -S spec/greeting_spec.rb
