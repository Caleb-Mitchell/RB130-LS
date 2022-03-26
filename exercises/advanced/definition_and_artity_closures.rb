# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class # 1. lambdas are objects of the Proc class.
my_lambda.call('dog')
# my_lambda.call # 2. lambdas have strict arity, will raise an exception with
# too many or too few arguments provided.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # 3. this
# syntax does not work, as Lambda is not a class, lambdas are objects of the
# proc class.

puts "----"
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # 4. Blocks have
# lenient arity, still run even though nothing is passed to the block via yield.
# block_method_1('seal') # 5. yield keyword within method definition raises an
# exception with no block passed as an argument to the method.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # 6. Blocks have lenient arity, so
# even though only block parameter turtle references a value, the block is still able to run.
end
block_method_2('turtle') { puts "This is a #{animal}."} # 7. local variable animal within the block is
# unable to access local variable `animal` within the method definition, as it
# is not referenced by a parameter, or named object, within the block to
# manipulate.



# Lambdas are types of Proc's. Technically they are both Proc objects. An
# implicit block is a grouping of code, a type of closure, it is not an Object.
# Lambdas enforce the number of arguments passed to them. Implicit blocks and
# Procs do not enforce the number of arguments passed in.
